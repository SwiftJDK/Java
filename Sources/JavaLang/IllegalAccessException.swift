
open class IllegalAccessException : ReflectiveOperationException { 
	private let serialVersionUID: Int64 = 6616958222490762034

	// *
	//      * Constructs an <code>IllegalAccessException</code> without a
	//      * detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>IllegalAccessException</code> with a detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

