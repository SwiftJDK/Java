
open class InstantiationError : IncompatibleClassChangeError { 
	private let serialVersionUID: Int64 = -4885810657349421204

	// *
	//      * Constructs an <code>InstantiationError</code> with no detail  message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>InstantiationError</code> with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

