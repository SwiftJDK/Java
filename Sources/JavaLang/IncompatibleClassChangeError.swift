
open class IncompatibleClassChangeError : LinkageError { 
	private let serialVersionUID: Int64 = -4914975503642802119

	// *
	//      * Constructs an <code>IncompatibleClassChangeError</code> with no
	//      * detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>IncompatibleClassChangeError</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

