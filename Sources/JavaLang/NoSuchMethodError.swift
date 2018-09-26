

open class NoSuchMethodError : IncompatibleClassChangeError { 
	private let serialVersionUID: Int64 = -3765521442372831335

	// *
	//      * Constructs a <code>NoSuchMethodError</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>NoSuchMethodError</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

