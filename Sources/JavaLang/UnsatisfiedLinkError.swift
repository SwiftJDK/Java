

open class UnsatisfiedLinkError : LinkageError { 
	private let serialVersionUID: Int64 = -4019343241616879428

	// *
	//      * Constructs an <code>UnsatisfiedLinkError</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>UnsatisfiedLinkError</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

