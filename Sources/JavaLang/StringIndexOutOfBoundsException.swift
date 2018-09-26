
open class StringIndexOutOfBoundsException : IndexOutOfBoundsException { 
	private let serialVersionUID: Int64 = -6762910422159637258

	// *
	//      * Constructs a {@code StringIndexOutOfBoundsException} with no
	//      * detail message.
	//      *
	//      * @since   JDK1.0.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a {@code StringIndexOutOfBoundsException} with
	//      * the specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}

	// *
	//      * Constructs a new {@code StringIndexOutOfBoundsException}
	//      * class with an argument indicating the illegal index.
	//      *
	//      * @param   index   the illegal index.
	public init(_ index: Int32) {
		super.init("String index out of range: " + index)
	}

	// BEGIN Android-added: Additional constructors for internal use.
	// *
	//      * Used internally for consistent high-quality error reporting.
	//      * @hide
	internal init(_ s: String!, _ index: Int32) {
		self.init(s.length(), index)
	}

	// *
	//      * Used internally for consistent high-quality error reporting.
	//      * @hide
	internal init(_ sourceLength: Int32, _ index: Int32) {
		super.init("length=" + sourceLength + "; index=" + index)
	}

	// *
	//      * Used internally for consistent high-quality error reporting.
	//      * @hide
	internal init(_ s: String!, _ offset: Int32, _ count: Int32) {
		self.init(s.length(), offset, count)
	}

	// *
	//      * Used internally for consistent high-quality error reporting.
	//      * @hide
	internal init(_ sourceLength: Int32, _ offset: Int32, _ count: Int32) {
		super.init("length=" + sourceLength + "; regionStart=" + offset + "; regionLength=" + count)
	}
}

