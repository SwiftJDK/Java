
open class ClassCastException : RuntimeException { 
	private let serialVersionUID: Int64 = -9223365651070458532

	// *
	//      * Constructs a <code>ClassCastException</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>ClassCastException</code> with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

