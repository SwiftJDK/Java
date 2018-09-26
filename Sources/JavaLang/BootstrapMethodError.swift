open class BootstrapMethodError : LinkageError {
	private let serialVersionUID: Int64 = 292

	// *
	//      * Constructs a {@code BootstrapMethodError} with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a {@code BootstrapMethodError} with the specified
	//      * detail message.
	//      *
	//      * @param s the detail message.
	public init(_ s: String!) {
		super.init(s)
	}

	// *
	//      * Constructs a {@code BootstrapMethodError} with the specified
	//      * detail message and cause.
	//      *
	//      * @param s the detail message.
	//      * @param cause the cause, may be {@code null}.
	public init(_ s: String!, _ cause: Throwable!) {
		super.init(s, cause)
	}

	// *
	//      * Constructs a {@code BootstrapMethodError} with the specified
	//      * cause.
	//      *
	//      * @param cause the cause, may be {@code null}.
	public init(_ cause: Throwable!) {
		//  cf. Throwable(Throwable cause) constructor.
		super.init((cause == nil ? nil : cause.toString()))
		initCause(cause)
	}
}

