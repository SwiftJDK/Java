
open class InstantiationException : ReflectiveOperationException { 
	private let serialVersionUID: Int64 = -8441929162975509110

	// *
	//      * Constructs an {@code InstantiationException} with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an {@code InstantiationException} with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

