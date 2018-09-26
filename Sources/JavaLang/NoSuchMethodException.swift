
open class NoSuchMethodException : ReflectiveOperationException { 
	private let serialVersionUID: Int64 = 5034388446362600923

	// *
	//      * Constructs a <code>NoSuchMethodException</code> without a detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>NoSuchMethodException</code> with a detail message.
	//      *
	//      * @param      s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

