 
public final class StringBuilder : AbstractStringBuilder, java.io.Serializable, CharSequence { 
	// * use serialVersionUID for interoperability 
	// 
	internal let serialVersionUID: Int64 = 4383685877147921099

	// *
	//      * Constructs a string builder with no characters in it and an
	//      * initial capacity of 16 characters.
	public init() {
		super.init(16)
	}

	// *
	//      * Constructs a string builder with no characters in it and an
	//      * initial capacity specified by the {@code capacity} argument.
	//      *
	//      * @param      capacity  the initial capacity.
	//      * @throws     NegativeArraySizeException  if the {@code capacity}
	//      *               argument is less than {@code 0}.
	public init(_ capacity: Int32) {
		super.init(capacity)
	}

	// *
	//      * Constructs a string builder initialized to the contents of the
	//      * specified string. The initial capacity of the string builder is
	//      * {@code 16} plus the length of the string argument.
	//      *
	//      * @param   str   the initial contents of the buffer.
	public init(_ str: String!) {
		super.init(str.length() + 16)
		append(str)
	}

	// *
	//      * Constructs a string builder that contains the same characters
	//      * as the specified {@code CharSequence}. The initial capacity of
	//      * the string builder is {@code 16} plus the length of the
	//      * {@code CharSequence} argument.
	//      *
	//      * @param      seq   the sequence to copy.
	public init(_ seq: CharSequence!) {
		self.(seq.length() + 16)
		append(seq)
	}

	// @Override
	public func append(_ obj: Object!) -> StringBuilder! {
		return append(String.valueOf(obj))
	}

	// @Override
	public func append(_ str: String!) -> StringBuilder! {
		super.append(str)
		return self
	}

	// *
	//      * Appends the specified {@code StringBuffer} to this sequence.
	//      * <p>
	//      * The characters of the {@code StringBuffer} argument are appended,
	//      * in order, to this sequence, increasing the
	//      * length of this sequence by the length of the argument.
	//      * If {@code sb} is {@code null}, then the four characters
	//      * {@code "null"} are appended to this sequence.
	//      * <p>
	//      * Let <i>n</i> be the length of this character sequence just prior to
	//      * execution of the {@code append} method. Then the character at index
	//      * <i>k</i> in the new character sequence is equal to the character at
	//      * index <i>k</i> in the old character sequence, if <i>k</i> is less than
	//      * <i>n</i>; otherwise, it is equal to the character at index <i>k-n</i>
	//      * in the argument {@code sb}.
	//      *
	//      * @param   sb   the {@code StringBuffer} to append.
	//      * @return  a reference to this object.
	open func append(_ sb: StringBuffer!) -> StringBuilder! {
		super.append(sb)
		return self
	}

	// @Override
	public func append(_ s: CharSequence!) -> StringBuilder! {
		super.append(s)
		return self
	}

	// *
	//      * @throws     IndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func append(_ s: CharSequence!, _ start: Int32, _ end: Int32) -> StringBuilder! {
		super.append(s, start, end)
		return self
	}

	// @Override
	public func append(_ str: AnsiChar[]) -> StringBuilder! {
		super.append(str)
		return self
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func append(_ str: AnsiChar[], _ offset: Int32, _ len: Int32) -> StringBuilder! {
		super.append(str, offset, len)
		return self
	}

	// @Override
	public func append(_ b: Bool) -> StringBuilder! {
		super.append(b)
		return self
	}

	// @Override
	public func append(_ c: AnsiChar) -> StringBuilder! {
		super.append(c)
		return self
	}

	// @Override
	public func append(_ i: Int32) -> StringBuilder! {
		super.append(i)
		return self
	}

	// @Override
	public func append(_ lng: Int64) -> StringBuilder! {
		super.append(lng)
		return self
	}

	// @Override
	public func append(_ f: Float32) -> StringBuilder! {
		super.append(f)
		return self
	}

	// @Override
	public func append(_ d: Float64) -> StringBuilder! {
		super.append(d)
		return self
	}

	// *
	//      * @since 1.5
	// @Override
	public func appendCodePoint(_ codePoint: Int32) -> StringBuilder! {
		super.appendCodePoint(codePoint)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func delete(_ start: Int32, _ end: Int32) -> StringBuilder! {
		super.delete(start, end)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func deleteCharAt(_ index: Int32) -> StringBuilder! {
		super.deleteCharAt(index)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func replace(_ start: Int32, _ end: Int32, _ str: String!) -> StringBuilder! {
		super.replace(start, end, str)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ index: Int32, _ str: AnsiChar[], _ offset: Int32, _ len: Int32) -> StringBuilder! {
		super.insert(index, str, offset, len)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ obj: Object!) -> StringBuilder! {
		super.insert(offset, obj)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ str: String!) -> StringBuilder! {
		super.insert(offset, str)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ str: AnsiChar[]) -> StringBuilder! {
		super.insert(offset, str)
		return self
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ dstOffset: Int32, _ s: CharSequence!) -> StringBuilder! {
		super.insert(dstOffset, s)
		return self
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ dstOffset: Int32, _ s: CharSequence!, _ start: Int32, _ end: Int32) -> StringBuilder! {
		super.insert(dstOffset, s, start, end)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ b: Bool) -> StringBuilder! {
		super.insert(offset, b)
		return self
	}

	// *
	//      * @throws IndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ c: AnsiChar) -> StringBuilder! {
		super.insert(offset, c)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ i: Int32) -> StringBuilder! {
		super.insert(offset, i)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ l: Int64) -> StringBuilder! {
		super.insert(offset, l)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ f: Float32) -> StringBuilder! {
		super.insert(offset, f)
		return self
	}

	// *
	//      * @throws StringIndexOutOfBoundsException {@inheritDoc}
	// @Override
	public func insert(_ offset: Int32, _ d: Float64) -> StringBuilder! {
		super.insert(offset, d)
		return self
	}

	// @Override
	public func indexOf(_ str: String!) -> Int32 {
		return super.indexOf(str)
	}

	// @Override
	public func indexOf(_ str: String!, _ fromIndex: Int32) -> Int32 {
		return super.indexOf(str, fromIndex)
	}

	// @Override
	public func lastIndexOf(_ str: String!) -> Int32 {
		return super.lastIndexOf(str)
	}

	// @Override
	public func lastIndexOf(_ str: String!, _ fromIndex: Int32) -> Int32 {
		return super.lastIndexOf(str, fromIndex)
	}

	// @Override
	public func reverse() -> StringBuilder! {
		super.reverse()
		return self
	}

	// @Override
	public func toString() -> String! {
		//  BEGIN Android-added: Return a constant "" for an empty buffer to keep historic behavior.
		if count == 0 {
			return ""
		}
		//  END Android-added: Return a constant "" for an empty buffer to keep historic behavior.
		//  Create a copy, don't share the array
		return String(value, 0, count)
	}

	// *
	//      * Save the state of the {@code StringBuilder} instance to a stream
	//      * (that is, serialize it).
	//      *
	//      * @serialData the number of characters currently stored in the string
	//      *             builder ({@code int}), followed by the characters in the
	//      *             string builder ({@code char[]}).   The length of the
	//      *             {@code char} array may be greater than the number of
	//      *             characters currently stored in the string builder, in which
	//      *             case extra characters are ignored.
	private func writeObject(_ s: java.io.ObjectOutputStream!) {
		s.defaultWriteObject()
		s.writeInt(count)
		s.writeObject(value)
	}

	// *
	//      * readObject is called to restore the state of the StringBuffer from
	//      * a stream.
	private func readObject(_ s: java.io.ObjectInputStream!) {
		s.defaultReadObject()
		count = s.readInt()
		value = (s.readObject() as? AnsiChar[])
	}
}

