
open class AssertionError : Error { 
	private let serialVersionUID: Int64 = -5013299493970297370

	// *
	//      * Constructs an AssertionError with no detail message.
	public init() {
	}

	// *
	//      * This internal constructor does no processing on its string argument,
	//      * even if it is a null reference.  The public constructors will
	//      * never call this constructor with a null argument.
	private init(_ detailMessage: String!) {
		super.init(detailMessage)
	}

	// *
	//      * Constructs an AssertionError with its detail message derived
	//      * from the specified object, which is converted to a string as
	//      * defined in section 15.18.1.1 of
	//      * <cite>The Java&trade; Language Specification</cite>.
	//      *<p>
	//      * If the specified object is an instance of {@code Throwable}, it
	//      * becomes the <i>cause</i> of the newly constructed assertion error.
	//      *
	//      * @param detailMessage value to be used in constructing detail message
	//      * @see   Throwable#getCause()
	public init(_ detailMessage: Object) {
		self.init(String.valueOf(detailMessage))
		if detailMessage is Throwable! {
			initCause((detailMessage as? Throwable))
		}
	}

	// *
	//      * Constructs an AssertionError with its detail message derived
	//      * from the specified <code>boolean</code>, which is converted to
	//      * a string as defined in section 15.18.1.1 of
	//      * <cite>The Java&trade; Language Specification</cite>.
	//      *
	//      * @param detailMessage value to be used in constructing detail message
	public init(_ detailMessage: Bool) {
		self.init(String.valueOf(detailMessage))
	}

	// *
	//      * Constructs an AssertionError with its detail message derived
	//      * from the specified <code>char</code>, which is converted to a
	//      * string as defined in section 15.18.1.1 of
	//      * <cite>The Java&trade; Language Specification</cite>.
	//      *
	//      * @param detailMessage value to be used in constructing detail message
	public init(_ detailMessage: AnsiChar) {
		self.init(String.valueOf(detailMessage))
	}

	// *
	//      * Constructs an AssertionError with its detail message derived
	//      * from the specified <code>int</code>, which is converted to a
	//      * string as defined in section 15.18.1.1 of
	//      * <cite>The Java&trade; Language Specification</cite>.
	//      *
	//      * @param detailMessage value to be used in constructing detail message
	public init(_ detailMessage: Int32) {
		self.init(String.valueOf(detailMessage))
	}

	// *
	//      * Constructs an AssertionError with its detail message derived
	//      * from the specified <code>long</code>, which is converted to a
	//      * string as defined in section 15.18.1.1 of
	//      * <cite>The Java&trade; Language Specification</cite>.
	//      *
	//      * @param detailMessage value to be used in constructing detail message
	public init(_ detailMessage: Int64) {
		self.init(String.valueOf(detailMessage))
	}

	// *
	//      * Constructs an AssertionError with its detail message derived
	//      * from the specified <code>float</code>, which is converted to a
	//      * string as defined in section 15.18.1.1 of
	//      * <cite>The Java&trade; Language Specification</cite>.
	//      *
	//      * @param detailMessage value to be used in constructing detail message
	public init(_ detailMessage: Float32) {
		self.(String.valueOf(detailMessage))
	}

	// *
	//      * Constructs an AssertionError with its detail message derived
	//      * from the specified <code>double</code>, which is converted to a
	//      * string as defined in section 15.18.1.1 of
	//      * <cite>The Java&trade; Language Specification</cite>.
	//      *
	//      * @param detailMessage value to be used in constructing detail message
	public init(_ detailMessage: Float64) {
		self.(String.valueOf(detailMessage))
	}

	// *
	//      * Constructs a new {@code AssertionError} with the specified
	//      * detail message and cause.
	//      *
	//      * <p>Note that the detail message associated with
	//      * {@code cause} is <i>not</i> automatically incorporated in
	//      * this error's detail message.
	//      *
	//      * @param  message the detail message, may be {@code null}
	//      * @param  cause the cause, may be {@code null}
	//      *
	//      * @since 1.7
	public init(_ message: String!, _ cause: Throwable!) {
		super.init(message, cause)
	}
}

