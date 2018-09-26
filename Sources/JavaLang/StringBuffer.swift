
// import java.util

public final class StringBuffer : AbstractStringBuilder, java.io.Serializable, CharSequence { 
	// *
	//      * A cache of the last value returned by toString. Cleared
	//      * whenever the StringBuffer is modified.
	//      
	// 
	private var toStringCache: [AnsiChar]
	// * use serialVersionUID from JDK 1.0.2 for interoperability 
	// 
	internal let serialVersionUID: Int64 = 3388685877147921107
	// *
	//      * Serializable fields for StringBuffer.
	//      *
	//      * @serialField value  char[]
	//      *              The backing character array of this StringBuffer.
	//      * @serialField count int
	//      *              The number of characters in this StringBuffer.
	//      * @serialField shared  boolean
	//      *              A flag indicating whether the backing array is shared.
	//      *              The value is ignored upon deserialization.
	//      
	// 
	private let serialPersistentFields: java.io.ObjectStreamField![] = [java.io.ObjectStreamField("value", [AnsiChar].self), java.io.ObjectStreamField("count", Integer.TYPE), java.io.ObjectStreamField("shared", Boolean.TYPE)]

	// *
	//      * Constructs a string buffer with no characters in it and an
	//      * initial capacity of 16 characters.
	public init() {
		super.init(16)
	}

	// *
	//      * Constructs a string buffer with no characters in it and
	//      * the specified initial capacity.
	//      *
	//      * @param      capacity  the initial capacity.
	//      * @exception  NegativeArraySizeException  if the {@code capacity}
	//      *               argument is less than {@code 0}.
	public init(_ capacity: Int32) {
		super.init(capacity)
	}

	// *
	//      * Constructs a string buffer initialized to the contents of the
	//      * specified string. The initial capacity of the string buffer is
	//      * {@code 16} plus the length of the string argument.
	//      *
	//      * @param   str   the initial contents of the buffer.
	public init(_ str: String!) {
		super.init(str.length() + 16)
		append(str)
	}

	// *
	//      * Constructs a string buffer that contains the same characters
	//      * as the specified {@code CharSequence}. The initial capacity of
	//      * the string buffer is {@code 16} plus the length of the
	//      * {@code CharSequence} argument.
	//      * <p>
	//      * If the length of the specified {@code CharSequence} is
	//      * less than or equal to zero, then an empty buffer of capacity
	//      * {@code 16} is returned.
	//      *
	//      * @param      seq   the sequence to copy.
	//      * @since 1.5
	public init(_ seq: CharSequence!) {
		self.(seq.length() + 16)
		append(seq)
	}

	// @Override
	public func length() -> Int32 {
		return count
	}

	// @Override
	public func capacity() -> Int32 {
		return value.length
	}

	// @Override
	public func ensureCapacity(_ minimumCapacity: Int32) {
		super.ensureCapacity(minimumCapacity)
	}

	// *
	//      * @since      1.5
	// @Override
	public func trimToSize() {
		super.trimToSize()
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	//      * @see        #length()
	// @Override
	public func setLength(_ newLength: Int32) {
		toStringCache = nil
		super.setLength(newLength)
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	//      * @see        #length()
	// @Override
	public func charAt(_ index: Int32) -> AnsiChar {
		if (index < 0) | (index >= count) {
			throw StringIndexOutOfBoundsException(index)
		}
		return value[index]
	}

	// *
	//      * @since      1.5
	// @Override
	public func codePointAt(_ index: Int32) -> Int32 {
		return super.codePointAt(index)
	}

	// *
	//      * @since     1.5
	// @Override
	public func codePointBefore(_ index: Int32) -> Int32 {
		return super.codePointBefore(index)
	}

	// *
	//      * @since     1.5
	// @Override
	public func codePointCount(_ beginIndex: Int32, _ endIndex: Int32) -> Int32 {
		return super.codePointCount(beginIndex, endIndex)
	}

	// *
	//      * @since     1.5
	// @Override
	public func offsetByCodePoints(_ index: Int32, _ codePointOffset: Int32) -> Int32 {
		return super.offsetByCodePoints(index, codePointOffset)
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func getChars(_ srcBegin: Int32, _ srcEnd: Int32, _ dst: [AnsiChar], _ dstBegin: Int32) {
		super.getChars(srcBegin, srcEnd, dst, dstBegin)
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	//      * @see        #length()
	// @Override
	public func setCharAt(_ index: Int32, _ ch: AnsiChar) {
		if (index < 0) | (index >= count) {
			throw StringIndexOutOfBoundsException(index)
		}
		toStringCache = nil
		value[index] = ch
	}

	// @Override
	public func append(_ obj: Object!) -> StringBuffer! {
		toStringCache = nil
		super.append(String.valueOf(obj))
		return self
	}

	// @Override
	public func append(_ str: String!) -> StringBuffer! {
		toStringCache = nil
		super.append(str)
		return self
	}

	// *
	//      * Appends the specified {@code StringBuffer} to this sequence.
	//      * <p>
	//      * The characters of the {@code StringBuffer} argument are appended,
	//      * in order, to the contents of this {@code StringBuffer}, increasing the
	//      * length of this {@code StringBuffer} by the length of the argument.
	//      * If {@code sb} is {@code null}, then the four characters
	//      * {@code "null"} are appended to this {@code StringBuffer}.
	//      * <p>
	//      * Let <i>n</i> be the length of the old character sequence, the one
	//      * contained in the {@code StringBuffer} just prior to execution of the
	//      * {@code append} method. Then the character at index <i>k</i> in
	//      * the new character sequence is equal to the character at index <i>k</i>
	//      * in the old character sequence, if <i>k</i> is less than <i>n</i>;
	//      * otherwise, it is equal to the character at index <i>k-n</i> in the
	//      * argument {@code sb}.
	//      * <p>
	//      * This method synchronizes on {@code this}, the destination
	//      * object, but does not synchronize on the source ({@code sb}).
	//      *
	//      * @param   sb   the {@code StringBuffer} to append.
	//      * @return  a reference to this object.
	//      * @since 1.4
	open func append(_ sb: StringBuffer!) -> StringBuffer! {
		toStringCache = nil
		super.append(sb)
		return self
	}

	// *
	//      * @since 1.8
	// @Override
	internal func append(_ asb: AbstractStringBuilder!) -> StringBuffer! {
		toStringCache = nil
		super.append(asb)
		return self
	}

	// *
	//      * Appends the specified {@code CharSequence} to this
	//      * sequence.
	//      * <p>
	//      * The characters of the {@code CharSequence} argument are appended,
	//      * in order, increasing the length of this sequence by the length of the
	//      * argument.
	//      *
	//      * <p>The result of this method is exactly the same as if it were an
	//      * invocation of this.append(s, 0, s.length());
	//      *
	//      * <p>This method synchronizes on {@code this}, the destination
	//      * object, but does not synchronize on the source ({@code s}).
	//      *
	//      * <p>If {@code s} is {@code null}, then the four characters
	//      * {@code "null"} are appended.
	//      *
	//      * @param   s the {@code CharSequence} to append.
	//      * @return  a reference to this object.
	//      * @since 1.5
	// @Override
	public func append(_ s: CharSequence!) -> StringBuffer! {
		toStringCache = nil
		super.append(s)
		return self
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	//      * @since      1.5
	// @Override
	public func append(_ s: CharSequence!, _ start: Int32, _ end: Int32) -> StringBuffer! {
		toStringCache = nil
		super.append(s, start, end)
		return self
	}

	// @Override
	public func append(_ str: [AnsiChar]) -> StringBuffer! {
		toStringCache = nil
		super.append(str)
		return self
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func append(_ str: [AnsiChar], _ offset: Int32, _ len: Int32) -> StringBuffer! {
		toStringCache = nil
		super.append(str, offset, len)
		return self
	}

	// @Override
	public func append(_ b: Bool) -> StringBuffer! {
		toStringCache = nil
		super.append(b)
		return self
	}

	// @Override
	public func append(_ c: AnsiChar) -> StringBuffer! {
		toStringCache = nil
		super.append(c)
		return self
	}

	// @Override
	public func append(_ i: Int32) -> StringBuffer! {
		toStringCache = nil
		super.append(i)
		return self
	}

	// *
	//      * @since 1.5
	// @Override
	public func appendCodePoint(_ codePoint: Int32) -> StringBuffer! {
		toStringCache = nil
		super.appendCodePoint(codePoint)
		return self
	}

	// @Override
	public func append(_ lng: Int64) -> StringBuffer! {
		toStringCache = nil
		super.append(lng)
		return self
	}

	// @Override
	public func append(_ f: Float32) -> StringBuffer! {
		toStringCache = nil
		super.append(f)
		return self
	}

	// @Override
	public func append(_ d: Float64) -> StringBuffer! {
		toStringCache = nil
		super.append(d)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	//      * @since      1.2
	// @Override
	public func delete(_ start: Int32, _ end: Int32) -> StringBuffer! {
		toStringCache = nil
		super.delete(start, end)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	//      * @since      1.2
	// @Override
	public func deleteCharAt(_ index: Int32) -> StringBuffer! {
		toStringCache = nil
		super.deleteCharAt(index)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	//      * @since      1.2
	// @Override
	public func replace(_ start: Int32, _ end: Int32, _ str: String!) -> StringBuffer! {
		toStringCache = nil
		super.replace(start, end, str)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	//      * @since      1.2
	// @Override
	public func substring(_ start: Int32) -> String! {
		return substring(start, count)
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	//      * @since      1.4
	// @Override
	public func subSequence(_ start: Int32, _ end: Int32) -> CharSequence! {
		return super.substring(start, end)
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	//      * @since      1.2
	// @Override
	public func substring(_ start: Int32, _ end: Int32) -> String! {
		return super.substring(start, end)
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	//      * @since      1.2
	// @Override
	public func insert(_ index: Int32, _ str: [AnsiChar], _ offset: Int32, _ len: Int32) -> StringBuffer! {
		toStringCache = nil
		super.insert(index, str, offset, len)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ obj: Object!) -> StringBuffer! {
		toStringCache = nil
		super.insert(offset, String.valueOf(obj))
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ str: String!) -> StringBuffer! {
		toStringCache = nil
		super.insert(offset, str)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ str: [AnsiChar]) -> StringBuffer! {
		toStringCache = nil
		super.insert(offset, str)
		return self
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	//      * @since      1.5
	// @Override
	public func insert(_ dstOffset: Int32, _ s: CharSequence!) -> StringBuffer! {
		//  Note, synchronization achieved via invocations of other StringBuffer methods
		//  after narrowing of s to specific type
		//  Ditto for toStringCache clearing
		super.insert(dstOffset, s)
		return self
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	//      * @since      1.5
	// @Override
	public func insert(_ dstOffset: Int32, _ s: CharSequence!, _ start: Int32, _ end: Int32) -> StringBuffer! {
		toStringCache = nil
		super.insert(dstOffset, s, start, end)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ b: Bool) -> StringBuffer! {
		//  Note, synchronization achieved via invocation of StringBuffer insert(int, String)
		//  after conversion of b to String by super class method
		//  Ditto for toStringCache clearing
		super.insert(offset, b)
		return self
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ c: AnsiChar) -> StringBuffer! {
		toStringCache = nil
		super.insert(offset, c)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ i: Int32) -> StringBuffer! {
		//  Note, synchronization achieved via invocation of StringBuffer insert(int, String)
		//  after conversion of i to String by super class method
		//  Ditto for toStringCache clearing
		super.insert(offset, i)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ l: Int64) -> StringBuffer! {
		//  Note, synchronization achieved via invocation of StringBuffer insert(int, String)
		//  after conversion of l to String by super class method
		//  Ditto for toStringCache clearing
		super.insert(offset, l)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ f: Float32) -> StringBuffer! {
		//  Note, synchronization achieved via invocation of StringBuffer insert(int, String)
		//  after conversion of f to String by super class method
		//  Ditto for toStringCache clearing
		super.insert(offset, f)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ d: Float64) -> StringBuffer! {
		//  Note, synchronization achieved via invocation of StringBuffer insert(int, String)
		//  after conversion of d to String by super class method
		//  Ditto for toStringCache clearing
		super.insert(offset, d)
		return self
	}

	// *
	//      * @since      1.4
	// @Override
	public func indexOf(_ str: String!) -> Int32 {
		//  Note, synchronization achieved via invocations of other StringBuffer methods
		return super.indexOf(str)
	}

	// *
	//      * @since      1.4
	// @Override
	public func indexOf(_ str: String!, _ fromIndex: Int32) -> Int32 {
		return super.indexOf(str, fromIndex)
	}

	// *
	//      * @since      1.4
	// @Override
	public func lastIndexOf(_ str: String!) -> Int32 {
		//  Note, synchronization achieved via invocations of other StringBuffer methods
		return lastIndexOf(str, count)
	}

	// *
	//      * @since      1.4
	// @Override
	public func lastIndexOf(_ str: String!, _ fromIndex: Int32) -> Int32 {
		return super.lastIndexOf(str, fromIndex)
	}

	// *
	//      * @since   JDK1.0.2
	// @Override
	public func reverse() -> StringBuffer! {
		toStringCache = nil
		super.reverse()
		return self
	}

	// @Override
	public func toString() -> String! {
		if toStringCache == nil {
			toStringCache = Arrays.copyOfRange(value, 0, count)
		}
		return String(toStringCache, 0, count)
	}

	// *
	//      * readObject is called to restore the state of the StringBuffer from
	//      * a stream.
	private func writeObject(_ s: java.io.ObjectOutputStream!) {
		var fields: java.io.ObjectOutputStream.PutField! = s.putFields()
		fields.put("value", value)
		fields.put("count", count)
		fields.put("shared", false)
		s.writeFields()
	}

	// *
	//      * readObject is called to restore the state of the StringBuffer from
	//      * a stream.
	private func readObject(_ s: java.io.ObjectInputStream!) {
		var fields: java.io.ObjectInputStream.GetField! = s.readFields()
		value = (fields.`get`("value", nil) as? [AnsiChar])
		count = fields.`get`("count", 0)
	}
}

