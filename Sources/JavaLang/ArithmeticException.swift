
open class ArithmeticException : RuntimeException {
	private let serialVersionUID: Int64 = 2256477558314496007

	// *
	//      * Constructs an {@code ArithmeticException} with no detail
	//      * message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an {@code ArithmeticException} with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String) {
		super.init(s)
	}
}

