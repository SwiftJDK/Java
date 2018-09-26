

open class NegativeArraySizeException : RuntimeException { 
	private let serialVersionUID: Int64 = -8960118058596991861

	// *
	//      * Constructs a <code>NegativeArraySizeException</code> with no
	//      * detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>NegativeArraySizeException</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

