
open class OutOfMemoryError : VirtualMachineError { 
	private let serialVersionUID: Int64 = 8228564086184010517

	// *
	//      * Constructs an {@code OutOfMemoryError} with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an {@code OutOfMemoryError} with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

