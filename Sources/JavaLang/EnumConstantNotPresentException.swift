
//@SuppressWarnings("rawtypes")
open class EnumConstantNotPresentException : RuntimeException { 
	private let serialVersionUID: Int64 = -6046998521960521108
	// *
	//      * The type of the missing enum constant.
	//      
	// 
	private var enumType: Class!
	// *
	//      * The name of the missing enum constant.
	//      
	// 
	private var constantName: String!

	// *
	//      * Constructs an <tt>EnumConstantNotPresentException</tt> for the
	//      * specified constant.
	//      *
	//      * @param enumType the type of the missing enum constant
	//      * @param constantName the name of the missing enum constant
	public init(_ enumType: Class!, _ constantName: String!) {
		super.init(enumType.getName() + "." + constantName)
		self.enumType = enumType
		self.constantName = constantName
	}

	// *
	//      * Returns the type of the missing enum constant.
	//      *
	//      * @return the type of the missing enum constant
	open func enumType() -> Class! {
		return enumType
	}

	// *
	//      * Returns the name of the missing enum constant.
	//      *
	//      * @return the name of the missing enum constant
	open func constantName() -> String! {
		return constantName
	}
}

