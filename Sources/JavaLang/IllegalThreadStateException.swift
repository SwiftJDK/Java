

open class IllegalThreadStateException : IllegalArgumentException { 
	private let serialVersionUID: Int64 = -7626246362397460174

	// *
	//      * Constructs an <code>IllegalThreadStateException</code> with no
	//      * detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>IllegalThreadStateException</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

