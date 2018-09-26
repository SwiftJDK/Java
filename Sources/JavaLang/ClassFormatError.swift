

open class ClassFormatError : LinkageError { 
	private let serialVersionUID: Int64 = -8420114879011949195

	// *
	//      * Constructs a <code>ClassFormatError</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>ClassFormatError</code> with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

