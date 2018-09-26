
open class NoClassDefFoundError : LinkageError { 
	private let serialVersionUID: Int64 = 9095859863287012458

	// *
	//      * Constructs a <code>NoClassDefFoundError</code> with no detail message.
	public init() {
		super.init()
	}

	// *
	//      * Constructs a <code>NoClassDefFoundError</code> with the specified
	//      * detail message.
	//      *
	//      * @param   s   the detail message.
	public init(_ s: String!) {
		super.init(s)
	}

	// Android-added: A new constructor for use by the Android runtime.
	// *
	//      * Constructs a new {@code NoClassDefFoundError} with the current stack
	//      * trace, the specified detail message and the specified cause. Used
	//      * internally by the Android runtime.
	//      *
	//      * @param detailMessage
	//      *            the detail message for this error.
	//      * @param throwable
	//      *            the cause of this error.
	private init(_ detailMessage: String!, _ throwable: Throwable!) {
		super.init(detailMessage, throwable)
	}
}

