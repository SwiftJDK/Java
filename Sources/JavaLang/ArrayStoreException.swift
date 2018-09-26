open class ArrayStoreException : RuntimeException { 
	private let serialVersionUID: Int64 = -4522193890499838241

	// *
	//      * Constructs an <code>ArrayStoreException</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs an <code>ArrayStoreException</code> with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String) {
		super.init(s)
	}
}

