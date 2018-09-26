
open class CloneNotSupportedException : Exception { 
	private let serialVersionUID: Int64 = 5195511250079656443

	// *
	//      * Constructs a <code>CloneNotSupportedException</code> with no
	//      * detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>CloneNotSupportedException</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}
}

