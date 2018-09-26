
open class InterruptedException : Exception { 
	private let serialVersionUID: Int64 = 6700697376100628473

	// *
	//      * Constructs an <code>InterruptedException</code> with no detail  message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>InterruptedException</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

