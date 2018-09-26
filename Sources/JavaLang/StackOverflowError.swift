

open class StackOverflowError : VirtualMachineError { 
	private let serialVersionUID: Int64 = 8609175038441759607

	// *
	//      * Constructs a <code>StackOverflowError</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>StackOverflowError</code> with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

