
open class ArrayIndexOutOfBoundsException : IndexOutOfBoundsException { 
	private let serialVersionUID: Int64 = -5116101128118950844

	// *
	//      * Constructs an <code>ArrayIndexOutOfBoundsException</code> with no
	//      * detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a new <code>ArrayIndexOutOfBoundsException</code>
	//      * class with an argument indicating the illegal index.
	//      *
	//      * @param   index   the illegal index.
	public init(_ index: Int32) {
		super.init("Array index out of range: " + index)
	}

	// *
	//      * Constructs an <code>ArrayIndexOutOfBoundsException</code> class
	//      * with the specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String) {
		super.init(s)
	}
}

