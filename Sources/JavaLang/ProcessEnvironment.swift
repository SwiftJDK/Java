//
//  We use APIs that access the standard Unix environ array, which
//  * is defined by UNIX98 to look like:
//  *
//  *    char **environ;
//  *
//  * These are unsorted, case-sensitive, null-terminated arrays of bytes
//  * of the form FOO=BAR\000 which are usually encoded in the user's
//  * default encoding (file.encoding is an excellent choice for
//  * encoding/decoding these).  However, even though the user cannot
//  * directly access the underlying byte representation, we take pains
//  * to pass on the child the exact byte representation we inherit from
//  * the parent process for any environment name or value not created by
//  * Javaland.  So we keep track of all the byte representations.
//  *
//  * Internally, we define the types Variable and Value that exhibit
//  * String/byteArray duality.  The internal representation of the
//  * environment then looks like a Map<Variable,Value>.  But we don't
//  * expose this to the user -- we only provide a Map<String,String>
//  * view, although we could also provide a Map<byte[],byte[]> view.
//  *
//  * The non-private methods in this class are not for general use even
//  * within this package.  Instead, they are the system-dependent parts
//  * of the system-independent method of the same name.  Don't even
//  * think of using this class unless your method's name appears below.
//  *
//  * @author  Martin Buchholz
//  * @since   1.5
//  

internal final class ProcessEnvironment { 
	private let theEnvironment: HashMap<Variable!,Value!>!
	private let theUnmodifiableEnvironment: Map<String!,String!>!
	internal let MIN_NAME_LENGTH: Int32 = 0

	// Only for use by System.getenv(String)
	internal static func getenv(_ name: String!) -> String! {
		return theUnmodifiableEnvironment.`get`(name)
	}

	// Only for use by System.getenv()
	internal static func getenv() -> Map<String!,String!>! {
		return theUnmodifiableEnvironment
	}

	// Only for use by ProcessBuilder.environment()
	//@SuppressWarnings("unchecked")
	internal static func environment() -> Map<String!,String!>! {
		return StringEnvironment((theEnvironment.clone() as? Map<Variable!,Value!>))
	}

	// Only for use by Runtime.exec(...String[]envp...)
	internal static func emptyEnvironment(_ capacity: Int32) -> Map<String!,String!>! {
		return StringEnvironment(HashMap<Variable!,Value!>(capacity))
	}

	private static /* __extern */ func environ() -> [[Int8]]

	// This class is not instantiable.
	private init() {
	}

	// Check that name is suitable for insertion into Environment map
	private static func validateVariable(_ name: String!) {
		if (name.indexOf("=") != -1) | (name.indexOf("\0") != -1) {
			throw IllegalArgumentException("Invalid environment variable name: \"" + name + "\"")
		}
	}

	// Check that value is suitable for insertion into Environment map
	private static func validateValue(_ value: String!) {
		if value.indexOf("\0") != -1 {
			throw IllegalArgumentException("Invalid environment variable value: \"" + value + "\"")
		}
	}

	internal static func toEnvironmentBlock(_ map: Map<String!,String!>!, _ envc: Int32[]) -> Int8[] {
		return (map == nil ? nil : (map as? StringEnvironment).toEnvironmentBlock(envc))
	}

	// Replace with general purpose method someday
	private static func arrayCompare(_ x: Int8[], _ y: Int8[]) -> Int32 {
		var min: Int32 = (x.length < y.length ? x.length : y.length)
		for i in 0 ... min - 1 {
			if x[i] != y[i] {
				return x[i] - y[i]
			}
		}
		return x.length - y.length
	}

	// Replace with general purpose method someday
	private static func arrayEquals(_ x: Int8[], _ y: Int8[]) -> Bool {
		if x.length != y.length {
			return false
		}
		for i in 0 ... x.length - 1 {
			if x[i] != y[i] {
				return false
			}
		}
		return true
	}

	// Replace with general purpose method someday
	private static func arrayHash(_ x: Int8[]) -> Int32 {
		var hash: Int32 = 0
		for i in 0 ... x.length - 1 {
			hash = (31 * hash) + x[i]
		}
		return hash
	}

	private init() {
		//  We cache the C environment.  This means that subsequent calls
		//  to putenv/setenv from C will not be visible from Java code.
		var environ: Int8[][] = environ()
		theEnvironment = HashMap((environ.length / 2) + 3)
		var i: Int32 = environ.length - 1
		while i > 0 {
			theEnvironment.put(Variable.valueOf(environ[i - 1]), Value.valueOf(environ[i]))
		}theUnmodifiableEnvironment = Collections.unmodifiableMap(StringEnvironment(theEnvironment))
	}

	/* __abstract */ class ExternalData { 
		public let str: String!
		public let bytes: Int8[]

		public init(_ str: String!, _ bytes: Int8[]) {
			self.str = str
			self.bytes = bytes
		}

		open func getBytes() -> Int8[] {
			return bytes
		}

		open func toString() -> String! {
			return str
		}

		open func equals(_ o: Object!) -> Bool {
			return (o is ExternalData!) & arrayEquals(getBytes(), (o as? ExternalData).getBytes())
		}

		open func hashCode() -> Int32 {
			return arrayHash(getBytes())
		}
	}

	class Variable : ExternalData, Comparable<Variable!> { 
		public init(_ str: String!, _ bytes: Int8[]) {
			super.init(str, bytes)
		}

		public static func valueOfQueryOnly(_ str: Object!) -> Variable! {
			return valueOfQueryOnly((str as? String))
		}

		public static func valueOfQueryOnly(_ str: String!) -> Variable! {
			return Variable(str, str.getBytes())
		}

		public static func valueOf(_ str: String!) -> Variable! {
			validateVariable(str)
			return valueOfQueryOnly(str)
		}

		public static func valueOf(_ bytes: Int8[]) -> Variable! {
			return Variable(String(bytes), bytes)
		}

		open func compareTo(_ variable: Variable!) -> Int32 {
			return arrayCompare(getBytes(), variable.getBytes())
		}

		open func equals(_ o: Object!) -> Bool {
			return (o is Variable!) & super.equals(o)
		}
	}

	class Value : ExternalData, Comparable<Value!> { 
		public init(_ str: String!, _ bytes: Int8[]) {
			super.init(str, bytes)
		}

		public static func valueOfQueryOnly(_ str: Object!) -> Value! {
			return valueOfQueryOnly((str as? String))
		}

		public static func valueOfQueryOnly(_ str: String!) -> Value! {
			return Value(str, str.getBytes())
		}

		public static func valueOf(_ str: String!) -> Value! {
			validateValue(str)
			return valueOfQueryOnly(str)
		}

		public static func valueOf(_ bytes: Int8[]) -> Value! {
			return Value(String(bytes), bytes)
		}

		open func compareTo(_ value: Value!) -> Int32 {
			return arrayCompare(getBytes(), value.getBytes())
		}

		open func equals(_ o: Object!) -> Bool {
			return (o is Value!) & super.equals(o)
		}
	}

	class StringEnvironment : AbstractMap<String!,String!> { 
		private var m: Map<Variable!,Value!>!

		private static func toString(_ v: Value!) -> String! {
			return (v == nil ? nil : v.toString())
		}

		public init(_ m: Map<Variable!,Value!>!) {
			self.m = m
		}

		open func size() -> Int32 {
			return m.size()
		}

		open func isEmpty() -> Bool {
			return m.isEmpty()
		}

		open func clear() {
			m.clear()
		}

		open func containsKey(_ key: Object!) -> Bool {
			return m.containsKey(Variable.valueOfQueryOnly(key))
		}

		open func containsValue(_ value: Object!) -> Bool {
			return m.containsValue(Value.valueOfQueryOnly(value))
		}

		open func `get`(_ key: Object!) -> String! {
			return toString(m.`get`(Variable.valueOfQueryOnly(key)))
		}

		open func put(_ key: String!, _ value: String!) -> String! {
			return toString(m.put(Variable.valueOf(key), Value.valueOf(value)))
		}

		open func remove(_ key: Object!) -> String! {
			return toString(m.remove(Variable.valueOfQueryOnly(key)))
		}

		open func keySet() -> Set<String!>! {
			return StringKeySet(m.keySet())
		}

		open func entrySet() -> Set<Map.Entry<String!,String!>!>! {
			return StringEntrySet(m.entrySet())
		}

		open func values() -> Collection<String!>! {
			return StringValues(m.values())
		}

		// It is technically feasible to provide a byte-oriented view
		//  as follows:
		//       public Map<byte[],byte[]> asByteArrayMap() {
		//           return new ByteArrayEnvironment(m);
		//       }
		//  Convert to Unix style environ as a monolithic byte array
		//  inspired by the Windows Environment Block, except we work
		//  exclusively with bytes instead of chars, and we need only
		//  one trailing NUL on Unix.
		//  This keeps the JNI as simple and efficient as possible.
		open func toEnvironmentBlock(_ envc: Int32[]) -> Int8[] {
			var count: Int32 = m.size() * 2
			//  For added '=' and NUL
			for entry in m.entrySet() {
				count = count + entry.getKey().getBytes().length
				count = count + entry.getValue().getBytes().length
			}
			var block: Int8[] = Int8[](count: count)
			var i: Int32 = 0
			for entry in m.entrySet() {
				var key: Int8[] = entry.getKey().getBytes()
				var value: Int8[] = entry.getValue().getBytes()
				System.arraycopy(key, 0, block, i, key.length)
				i = i + key.length
				block[i] = ("=" as? Int8)
				inc(i)
				System.arraycopy(value, 0, block, i, value.length)
				i = i + value.length + 1
				//  No need to write NUL byte explicitly
				// block[i++] = (byte) '\u0000';
			}
			envc[0] = m.size()
			return block
		}
	}

	class StringEntry : Map.Entry<String!,String!> { 
		private let e: Map.Entry<Variable!,Value!>!

		public init(_ e: Map.Entry<Variable!,Value!>!) {
			self.e = e
		}

		open func getKey() -> String! {
			return e.getKey().toString()
		}

		open func getValue() -> String! {
			return e.getValue().toString()
		}

		open func setValue(_ newValue: String!) -> String! {
			return e.setValue(Value.valueOf(newValue)).toString()
		}

		open func toString() -> String! {
			return getKey() + "=" + getValue()
		}

		open func equals(_ o: Object!) -> Bool {
			return (o is StringEntry!) & e.equals((o as? StringEntry).e)
		}

		open func hashCode() -> Int32 {
			return e.hashCode()
		}
	}

	class StringEntrySet : AbstractSet<Map.Entry<String!,String!>!> { 
		private let s: Set<Map.Entry<Variable!,Value!>!>!

		public init(_ s: Set<Map.Entry<Variable!,Value!>!>!) {
			self.s = s
		}

		open func size() -> Int32 {
			return s.size()
		}

		open func isEmpty() -> Bool {
			return s.isEmpty()
		}

		open func clear() {
			s.clear()
		}

		open func iterator() -> Iterator<Map.Entry<String!,String!>!>! {
			return class {
				func hasNext() {
					return i.hasNext()
				}

				func next() {
					return StringEntry(i.next())
				}

				func remove() {
					i.remove()
				}
			}
		}

		private static func vvEntry(_ o: Object!) -> Map.Entry<Variable!,Value!>! {
			if o is StringEntry! {
				return (o as? StringEntry).e
			}
			return class {
				func getKey() {
					return Variable.valueOfQueryOnly((o as? Map.Entry).getKey())
				}

				func getValue() {
					return Value.valueOfQueryOnly((o as? Map.Entry).getValue())
				}

				func setValue(_ value: Value!) {
					throw UnsupportedOperationException()
				}
			}
		}

		open func contains(_ o: Object!) -> Bool {
			return s.contains(vvEntry(o))
		}

		open func remove(_ o: Object!) -> Bool {
			return s.remove(vvEntry(o))
		}

		open func equals(_ o: Object!) -> Bool {
			return (o is StringEntrySet!) & s.equals((o as? StringEntrySet).s)
		}

		open func hashCode() -> Int32 {
			return s.hashCode()
		}
	}

	class StringValues : AbstractCollection<String!> { 
		private let c: Collection<Value!>!

		public init(_ c: Collection<Value!>!) {
			self.c = c
		}

		open func size() -> Int32 {
			return c.size()
		}

		open func isEmpty() -> Bool {
			return c.isEmpty()
		}

		open func clear() {
			c.clear()
		}

		open func iterator() -> Iterator<String!>! {
			return class {
				func hasNext() {
					return i.hasNext()
				}

				func next() {
					return i.next().toString()
				}

				func remove() {
					i.remove()
				}
			}
		}

		open func contains(_ o: Object!) -> Bool {
			return c.contains(Value.valueOfQueryOnly(o))
		}

		open func remove(_ o: Object!) -> Bool {
			return c.remove(Value.valueOfQueryOnly(o))
		}

		open func equals(_ o: Object!) -> Bool {
			return (o is StringValues!) & c.equals((o as? StringValues).c)
		}

		open func hashCode() -> Int32 {
			return c.hashCode()
		}
	}

	class StringKeySet : AbstractSet<String!> { 
		private let s: Set<Variable!>!

		public init(_ s: Set<Variable!>!) {
			self.s = s
		}

		open func size() -> Int32 {
			return s.size()
		}

		open func isEmpty() -> Bool {
			return s.isEmpty()
		}

		open func clear() {
			s.clear()
		}

		open func iterator() -> Iterator<String!>! {
			return class {
				func hasNext() {
					return i.hasNext()
				}

				func next() {
					return i.next().toString()
				}

				func remove() {
					i.remove()
				}
			}
		}

		open func contains(_ o: Object!) -> Bool {
			return s.contains(Variable.valueOfQueryOnly(o))
		}

		open func remove(_ o: Object!) -> Bool {
			return s.remove(Variable.valueOfQueryOnly(o))
		}
	}
}

