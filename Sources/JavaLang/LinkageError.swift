
open class LinkageError : JavaLang.Error {
    
	private let serialVersionUID: Int64 = 3579600108157160122

	// *
	//      * Constructs a {@code LinkageError} with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a {@code LinkageError} with the specified detail
	//      * message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}

	// *
	//      * Constructs a {@code LinkageError} with the specified detail
	//      * message and cause.
	//      *
	//      * @param s     the detail message.
	//      * @param cause the cause, may be {@code null}
	//      * @since 1.7
	public init(_ s: String!, _ cause: Throwable!) {
		super.init(s, cause)
	}
}

