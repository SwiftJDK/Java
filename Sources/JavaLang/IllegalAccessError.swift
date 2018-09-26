
open class IllegalAccessError : IncompatibleClassChangeError { 
	private let serialVersionUID: Int64 = -8988904074992417891

	// *
	//      * Constructs an <code>IllegalAccessError</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>IllegalAccessError</code> with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

