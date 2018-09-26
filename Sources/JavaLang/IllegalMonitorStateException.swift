
open class IllegalMonitorStateException : RuntimeException { 
	private let serialVersionUID: Int64 = 3713306369498869069

	// *
	//      * Constructs an <code>IllegalMonitorStateException</code> with no
	//      * detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>IllegalMonitorStateException</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

