
open class NoSuchFieldException : ReflectiveOperationException { 
	private let serialVersionUID: Int64 = -6143714805279938260

	// *
	//      * Constructor.
	public init() {
		super.init()
	}

	// *
	//      * Constructor with a detail message.
	//      *
	//      * @param s the detail message
	public init(_ s: String!) {
		super.init(s)
	}
}

