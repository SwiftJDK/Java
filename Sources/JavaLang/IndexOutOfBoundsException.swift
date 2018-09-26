
open class IndexOutOfBoundsException : RuntimeException { 
	private let serialVersionUID: Int64 = 234122996006267687

	// *
	//      * Constructs an <code>IndexOutOfBoundsException</code> with no
	//      * detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>IndexOutOfBoundsException</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

