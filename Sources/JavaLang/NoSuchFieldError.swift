
open class NoSuchFieldError : IncompatibleClassChangeError { 
	private let serialVersionUID: Int64 = -3456430195886129035

	// *
	//      * Constructs a <code>NoSuchFieldError</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>NoSuchFieldError</code> with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

