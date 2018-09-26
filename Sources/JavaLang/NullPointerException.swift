
open class NullPointerException : RuntimeException { 
	private let serialVersionUID: Int64 = 5162710183389028792

	// *
	//      * Constructs a {@code NullPointerException} with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a {@code NullPointerException} with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

