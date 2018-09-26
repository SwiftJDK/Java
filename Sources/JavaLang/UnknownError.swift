
open class UnknownError : VirtualMachineError { 
	private let serialVersionUID: Int64 = 2524784860676771849

	// *
	//      * Constructs an <code>UnknownError</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>UnknownError</code> with the specified detail
	//      * message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

