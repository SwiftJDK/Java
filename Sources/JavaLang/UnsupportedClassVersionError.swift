
open class UnsupportedClassVersionError : ClassFormatError { 
	private let serialVersionUID: Int64 = -7123279212883497373

	// *
	//      * Constructs a <code>UnsupportedClassVersionError</code>
	//      * with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>UnsupportedClassVersionError</code> with
	//      * the specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

