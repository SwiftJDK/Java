
open class ClassCircularityError : LinkageError { 
	private let serialVersionUID: Int64 = 1054362542914539689

	// *
	//      * Constructs a {@code ClassCircularityError} with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a {@code ClassCircularityError} with the specified detail
	//      * message.
	//      *
	//      * @param  s
	//      *         The detail message
	public init(_ s: String!) {
		super.init(s)
	}
}

