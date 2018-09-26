

// import java.util

public final class StackTraceElement : java.io.Serializable { 
	//  Normally initialized by VM (public constructor added in 1.5)
	// 
	private var declaringClass: String!
	private var methodName: String!
	private var fileName: String!
	private var lineNumber: Int32 = 0
	private let serialVersionUID: Int64 = 6992337162326171013

	// *
	//      * Creates a stack trace element representing the specified execution
	//      * point.
	//      *
	//      * @param declaringClass the fully qualified name of the class containing
	//      *        the execution point represented by the stack trace element
	//      * @param methodName the name of the method containing the execution point
	//      *        represented by the stack trace element
	//      * @param fileName the name of the file containing the execution point
	//      *         represented by the stack trace element, or {@code null} if
	//      *         this information is unavailable
	//      * @param lineNumber the line number of the source line containing the
	//      *         execution point represented by this stack trace element, or
	//      *         a negative number if this information is unavailable. A value
	//      *         of -2 indicates that the method containing the execution point
	//      *         is a native method
	//      * @throws NullPointerException if {@code declaringClass} or
	//      *         {@code methodName} is null
	//      * @since 1.5
	public init(_ declaringClass: String!, _ methodName: String!, _ fileName: String!, _ lineNumber: Int32) {
		self.declaringClass = Objects.requireNonNull(declaringClass, "Declaring class is null")
		self.methodName = Objects.requireNonNull(methodName, "Method name is null")
		self.fileName = fileName
		self.lineNumber = lineNumber
	}

	// *
	//      * Returns the name of the source file containing the execution point
	//      * represented by this stack trace element.  Generally, this corresponds
	//      * to the {@code SourceFile} attribute of the relevant {@code class}
	//      * file (as per <i>The Java Virtual Machine Specification</i>, Section
	//      * 4.7.7).  In some systems, the name may refer to some source code unit
	//      * other than a file, such as an entry in source repository.
	//      *
	//      * @return the name of the file containing the execution point
	//      *         represented by this stack trace element, or {@code null} if
	//      *         this information is unavailable.
	open func getFileName() -> String! {
		return fileName
	}

	// *
	//      * Returns the line number of the source line containing the execution
	//      * point represented by this stack trace element.  Generally, this is
	//      * derived from the {@code LineNumberTable} attribute of the relevant
	//      * {@code class} file (as per <i>The Java Virtual Machine
	//      * Specification</i>, Section 4.7.8).
	//      *
	//      * @return the line number of the source line containing the execution
	//      *         point represented by this stack trace element, or a negative
	//      *         number if this information is unavailable.
	open func getLineNumber() -> Int32 {
		return lineNumber
	}

	// *
	//      * Returns the fully qualified name of the class containing the
	//      * execution point represented by this stack trace element.
	//      *
	//      * @return the fully qualified name of the {@code Class} containing
	//      *         the execution point represented by this stack trace element.
	open func getClassName() -> String! {
		return declaringClass
	}

	// *
	//      * Returns the name of the method containing the execution point
	//      * represented by this stack trace element.  If the execution point is
	//      * contained in an instance or class initializer, this method will return
	//      * the appropriate <i>special method name</i>, {@code <init>} or
	//      * {@code <clinit>}, as per Section 3.9 of <i>The Java Virtual
	//      * Machine Specification</i>.
	//      *
	//      * @return the name of the method containing the execution point
	//      *         represented by this stack trace element.
	open func getMethodName() -> String! {
		return methodName
	}

	// *
	//      * Returns true if the method containing the execution point
	//      * represented by this stack trace element is a native method.
	//      *
	//      * @return {@code true} if the method containing the execution point
	//      *         represented by this stack trace element is a native method.
	open func isNativeMethod() -> Bool {
		return lineNumber == -2
	}

	// *
	//      * Returns a string representation of this stack trace element.  The
	//      * format of this string depends on the implementation, but the following
	//      * examples may be regarded as typical:
	//      * <ul>
	//      * <li>
	//      *   {@code "MyClass.mash(MyClass.java:9)"} - Here, {@code "MyClass"}
	//      *   is the <i>fully-qualified name</i> of the class containing the
	//      *   execution point represented by this stack trace element,
	//      *   {@code "mash"} is the name of the method containing the execution
	//      *   point, {@code "MyClass.java"} is the source file containing the
	//      *   execution point, and {@code "9"} is the line number of the source
	//      *   line containing the execution point.
	//      * <li>
	//      *   {@code "MyClass.mash(MyClass.java)"} - As above, but the line
	//      *   number is unavailable.
	//      * <li>
	//      *   {@code "MyClass.mash(Unknown Source)"} - As above, but neither
	//      *   the file name nor the line  number are available.
	//      * <li>
	//      *   {@code "MyClass.mash(Native Method)"} - As above, but neither
	//      *   the file name nor the line  number are available, and the method
	//      *   containing the execution point is known to be a native method.
	//      * </ul>
	//      * @see    Throwable#printStackTrace()
	open func toString() -> String! {
		//  BEGIN Android-changed: Fall back Unknown Source:<dex_pc> for unknown lineNumber.
		//  http://b/30183883
		//  The only behavior change is that "Unknown Source" is followed by a number
		//  (the value of the dex program counter, dex_pc), which never occurs on the
		//  RI. This value isn't a line number, but can be useful for debugging and
		//  avoids the need to ship line number information along with the dex code to
		//  get an accurate stack trace.
		//  Formatting it in this way might be more digestible to automated tools that
		//  are not specifically written to expect this behavior.
		// 
		//         return getClassName() + "." + methodName +
		//             (isNativeMethod() ? "(Native Method)" :
		//              (fileName != null && lineNumber >= 0 ?
		//               "(" + fileName + ":" + lineNumber + ")" :
		//               (fileName != null ?  "("+fileName+")" : "(Unknown Source)")));
		//         
		var result: StringBuilder! = StringBuilder()
		result.append(getClassName()).append(".").append(methodName)
		if isNativeMethod() {
			result.append("(Native Method)")
		} else {
			if fileName != nil {
				if lineNumber >= 0 {
					result.append("(").append(fileName).append(":").append(lineNumber).append(")")
				} else {
					result.append("(").append(fileName).append(")")
				}
			} else {
				if lineNumber >= 0 {
					//  The line number is actually the dex pc.
					result.append("(Unknown Source:").append(lineNumber).append(")")
				} else {
					result.append("(Unknown Source)")
				}
			}
		}
		return result.toString()
		//  END Android-changed: Fall back Unknown Source:<dex_pc> for unknown lineNumber.
	}

	// *
	//      * Returns true if the specified object is another
	//      * {@code StackTraceElement} instance representing the same execution
	//      * point as this instance.  Two stack trace elements {@code a} and
	//      * {@code b} are equal if and only if:
	//      * <pre>{@code
	//      *     equals(a.getFileName(), b.getFileName()) &&
	//      *     a.getLineNumber() == b.getLineNumber()) &&
	//      *     equals(a.getClassName(), b.getClassName()) &&
	//      *     equals(a.getMethodName(), b.getMethodName())
	//      * }</pre>
	//      * where {@code equals} has the semantics of {@link
	//      * java.util.Objects#equals(Object, Object) Objects.equals}.
	//      *
	//      * @param  obj the object to be compared with this stack trace element.
	//      * @return true if the specified object is another
	//      *         {@code StackTraceElement} instance representing the same
	//      *         execution point as this instance.
	open func equals(_ obj: Object!) -> Bool {
		if obj == self {
			return true
		}
		if !obj is StackTraceElement! {
			return false
		}
		var e: StackTraceElement! = (obj as? StackTraceElement)
		return e.declaringClass.equals(declaringClass) & (e.lineNumber == lineNumber) & Objects.equals(methodName, e.methodName) & Objects.equals(fileName, e.fileName)
	}

	// *
	//      * Returns a hash code value for this stack trace element.
	open func hashCode() -> Int32 {
		var result: Int32 = (31 * declaringClass.hashCode()) + methodName.hashCode()
		result = (31 * result) + Objects.hashCode(fileName)
		result = (31 * result) + lineNumber
		return result
	}
}

