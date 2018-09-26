
open class TypeNotPresentException : RuntimeException { 
	private let serialVersionUID: Int64 = -5101214195716534496
	private var typeName: String!

	// *
	//      * Constructs a <tt>TypeNotPresentException</tt> for the named type
	//      * with the specified cause.
	//      *
	//      * @param typeName the fully qualified name of the unavailable type
	//      * @param cause the exception that was thrown when the system attempted to
	//      *    load the named type, or <tt>null</tt> if unavailable or inapplicable
	public init(_ typeName: String!, _ cause: Throwable!) {
		super.init("Type " + typeName + " not present", cause)
		self.typeName = typeName
	}

	// *
	//      * Returns the fully qualified name of the unavailable type.
	//      *
	//      * @return the fully qualified name of the unavailable type
	open func typeName() -> String! {
		return typeName
	}
}

