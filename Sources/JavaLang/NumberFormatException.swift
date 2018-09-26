

open class NumberFormatException : IllegalArgumentException { 
	internal let serialVersionUID: Int64 = -2848938806368998894

	// *
	//      * Constructs a <code>NumberFormatException</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>NumberFormatException</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}

	// *
	//      * Factory method for making a <code>NumberFormatException</code>
	//      * given the specified input which caused the error.
	//      *
	//      * @param   s   the input causing the error
	internal static func forInputString(_ s: String!) -> NumberFormatException! {
		return NumberFormatException("For input string: \"" + s + "\"")
	}
}

