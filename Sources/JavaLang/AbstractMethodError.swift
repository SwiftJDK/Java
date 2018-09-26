open class AbstractMethodError : IncompatibleClassChangeError { 
	private let serialVersionUID: Int64 = -1654391082989018462

	// *
	//      * Constructs an <code>AbstractMethodError</code> with no detail  message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>AbstractMethodError</code> with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}
