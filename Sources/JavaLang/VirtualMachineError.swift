
open /* __abstract */ class VirtualMachineError : JavaLang.Error {
    
	private let serialVersionUID: Int64 = 4161983926571568670

	// *
	//      * Constructs a <code>VirtualMachineError</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>VirtualMachineError</code> with the specified
	//      * detail message.
	//      *
	//      * @param   message   the detail message.
	public init(_ message: String!) {
		super.init(message)
	}

	// *
	//      * Constructs a {@code VirtualMachineError} with the specified
	//      * detail message and cause.  <p>Note that the detail message
	//      * associated with {@code cause} is <i>not</i> automatically
	//      * incorporated in this error's detail message.
	//      *
	//      * @param  message the detail message (which is saved for later retrieval
	//      *         by the {@link #getMessage()} method).
	//      * @param  cause the cause (which is saved for later retrieval by the
	//      *         {@link #getCause()} method).  (A {@code null} value is
	//      *         permitted, and indicates that the cause is nonexistent or
	//      *         unknown.)
	//      * @since  1.8
	public init(_ message: String!, _ cause: Throwable!) {
		super.init(message, cause)
	}

	// *
	//      * Constructs an a {@code VirtualMachineError} with the specified
	//      * cause and a detail message of {@code (cause==null ? null :
	//      * cause.toString())} (which typically contains the class and
	//      * detail message of {@code cause}).
	//      *
	//      * @param  cause the cause (which is saved for later retrieval by the
	//      *         {@link #getCause()} method).  (A {@code null} value is
	//      *         permitted, and indicates that the cause is nonexistent or
	//      *         unknown.)
	//      * @since  1.8
	public init(_ cause: Throwable!) {
		super.init(cause)
	}
}

