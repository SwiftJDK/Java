
open class SecurityException : RuntimeException { 
	private let serialVersionUID: Int64 = 6878364983674394167

	// *
	//      * Constructs a <code>SecurityException</code> with no detail  message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>SecurityException</code> with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}

	// *
	//      * Creates a <code>SecurityException</code> with the specified
	//      * detail message and cause.
	//      *
	//      * @param message the detail message (which is saved for later retrieval
	//      *        by the {@link #getMessage()} method).
	//      * @param cause the cause (which is saved for later retrieval by the
	//      *        {@link #getCause()} method).  (A <tt>null</tt> value is permitted,
	//      *        and indicates that the cause is nonexistent or unknown.)
	//      * @since 1.5
	public init(_ message: String!, _ cause: Throwable!) {
		super.init(message, cause)
	}

	// *
	//      * Creates a <code>SecurityException</code> with the specified cause
	//      * and a detail message of <tt>(cause==null ? null : cause.toString())</tt>
	//      * (which typically contains the class and detail message of
	//      * <tt>cause</tt>).
	//      *
	//      * @param cause the cause (which is saved for later retrieval by the
	//      *        {@link #getCause()} method).  (A <tt>null</tt> value is permitted,
	//      *        and indicates that the cause is nonexistent or unknown.)
	//      * @since 1.5
	public init(_ cause: Throwable!) {
		super.init(cause)
	}
}

