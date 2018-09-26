
open class ClassNotFoundException : ReflectiveOperationException { 
	// *
	//      * use serialVersionUID from JDK 1.1.X for interoperability
	//      
	// 
	private let serialVersionUID: Int64 = 9176873029745254542
	// *
	//      * This field holds the exception ex if the
	//      * ClassNotFoundException(String s, Throwable ex) constructor was
	//      * used to instantiate the object
	//      * @serial
	//      * @since 1.2
	//      
	// 
	private var ex: Throwable!

	// *
	//      * Constructs a <code>ClassNotFoundException</code> with no detail message.
	public init() {
		super.init((nil as? Throwable))
		//  Disallow initCause
	}

	// *
	//      * Constructs a <code>ClassNotFoundException</code> with the
	//      * specified detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s, nil)
		//   Disallow initCause
	}

	// *
	//      * Constructs a <code>ClassNotFoundException</code> with the
	//      * specified detail message and optional exception that was
	//      * raised while loading the class.
	//      *
	//      * @param s the detail message
	//      * @param ex the exception that was raised while loading the class
	//      * @since 1.2
	public init(_ s: String!, _ ex: Throwable!) {
		super.init(s, nil)
		//   Disallow initCause
		self.ex = ex
	}

	// *
	//      * Returns the exception that was raised if an error occurred while
	//      * attempting to load the class. Otherwise, returns <tt>null</tt>.
	//      *
	//      * <p>This method predates the general-purpose exception chaining facility.
	//      * The {@link Throwable#getCause()} method is now the preferred means of
	//      * obtaining this information.
	//      *
	//      * @return the <code>Exception</code> that was raised while loading a class
	//      * @since 1.2
	open func getException() -> Throwable! {
		return ex
	}

	// *
	//      * Returns the cause of this exception (the exception that was raised
	//      * if an error occurred while attempting to load the class; otherwise
	//      * <tt>null</tt>).
	//      *
	//      * @return  the cause of this exception.
	//      * @since   1.4
	open func getCause() -> Throwable! {
		return ex
	}
}

