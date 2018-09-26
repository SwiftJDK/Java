
open class VerifyError : LinkageError { 
	private let serialVersionUID: Int64 = 7001962396098498785

	// *
	//      * Constructs an <code>VerifyError</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>VerifyError</code> with the specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

