
// import android.system
// import dalvik.system
// import java.lang.annotation
// import java.nio.channels
// import java.nio.channels.spi
// import java.util
// import libcore.icu
// import libcore.io
// import libcore.util
// import sun.reflect
// import sun.security.util

public final class System { 
	// *
	//      * The "standard" input stream. This stream is already
	//      * open and ready to supply input data. Typically this stream
	//      * corresponds to keyboard input or another input source specified by
	//      * the host environment or user.
	//      
	// 
	public let `in`: InputStream!
	// *
	//      * The "standard" output stream. This stream is already
	//      * open and ready to accept output data. Typically this stream
	//      * corresponds to display output or another output destination
	//      * specified by the host environment or user.
	//      * <p>
	//      * For simple stand-alone Java applications, a typical way to write
	//      * a line of output data is:
	//      * <blockquote><pre>
	//      *     System.out.println(data)
	//      * </pre></blockquote>
	//      * <p>
	//      * See the <code>println</code> methods in class <code>PrintStream</code>.
	//      *
	//      * @see     java.io.PrintStream#println()
	//      * @see     java.io.PrintStream#println(boolean)
	//      * @see     java.io.PrintStream#println(char)
	//      * @see     java.io.PrintStream#println(char[])
	//      * @see     java.io.PrintStream#println(double)
	//      * @see     java.io.PrintStream#println(float)
	//      * @see     java.io.PrintStream#println(int)
	//      * @see     java.io.PrintStream#println(long)
	//      * @see     java.io.PrintStream#println(java.lang.Object)
	//      * @see     java.io.PrintStream#println(java.lang.String)
	//      
	// 
	public let out: PrintStream!
	// *
	//      * The "standard" error output stream. This stream is already
	//      * open and ready to accept output data.
	//      * <p>
	//      * Typically this stream corresponds to display output or another
	//      * output destination specified by the host environment or user. By
	//      * convention, this output stream is used to display error messages
	//      * or other information that should come to the immediate attention
	//      * of a user even if the principal output stream, the value of the
	//      * variable <code>out</code>, has been redirected to a file or other
	//      * destination that is typically not continuously monitored.
	//      
	// 
	public let err: PrintStream!
	// *
	//      * Dedicated lock for GC / Finalization logic.
	//      
	// 
	private let LOCK: Object! = Object()
	// *
	//      * Whether or not we need to do a GC before running the finalizers.
	//      
	// 
	private static var runGC: Bool = false
	// *
	//      * If we just ran finalization, we might want to do a GC to free the finalized objects.
	//      * This lets us do gc/runFinlization/gc sequences but prevents back to back System.gc().
	//      
	// 
	private static var justRanFinalization: Bool = false
	private static var cons: Console! = nil
	//  BEGIN Android-changed
	// *
	//      * The char array length threshold below which to use a Java
	//      * (non-native) version of arraycopy() instead of the native
	//      * version. See b/7103825.
	//      
	// 
	private let ARRAYCOPY_SHORT_CHAR_ARRAY_THRESHOLD: Int32 = 32
	// *
	//      * The byte array length threshold below which to use a Java
	//      * (non-native) version of arraycopy() instead of the native
	//      * version. See b/7103825.
	//      
	// 
	private let ARRAYCOPY_SHORT_BYTE_ARRAY_THRESHOLD: Int32 = 32
	// *
	//      * The short array length threshold below which to use a Java
	//      * (non-native) version of arraycopy() instead of the native
	//      * version. See b/7103825.
	//      
	// 
	private let ARRAYCOPY_SHORT_SHORT_ARRAY_THRESHOLD: Int32 = 32
	// *
	//      * The short array length threshold below which to use a Java
	//      * (non-native) version of arraycopy() instead of the native
	//      * version. See b/7103825.
	//      
	// 
	private let ARRAYCOPY_SHORT_INT_ARRAY_THRESHOLD: Int32 = 32
	// *
	//      * The short array length threshold below which to use a Java
	//      * (non-native) version of arraycopy() instead of the native
	//      * version. See b/7103825.
	//      
	// 
	private let ARRAYCOPY_SHORT_LONG_ARRAY_THRESHOLD: Int32 = 32
	// *
	//      * The short array length threshold below which to use a Java
	//      * (non-native) version of arraycopy() instead of the native
	//      * version. See b/7103825.
	//      
	// 
	private let ARRAYCOPY_SHORT_FLOAT_ARRAY_THRESHOLD: Int32 = 32
	// *
	//      * The short array length threshold below which to use a Java
	//      * (non-native) version of arraycopy() instead of the native
	//      * version. See b/7103825.
	//      
	// 
	private let ARRAYCOPY_SHORT_DOUBLE_ARRAY_THRESHOLD: Int32 = 32
	// *
	//      * The short array length threshold below which to use a Java
	//      * (non-native) version of arraycopy() instead of the native
	//      * version. See b/7103825.
	//      
	// 
	private let ARRAYCOPY_SHORT_BOOLEAN_ARRAY_THRESHOLD: Int32 = 32
	// *
	//      * System properties. The following properties are guaranteed to be defined:
	//      * <dl>
	//      * <dt>java.version         <dd>Java version number
	//      * <dt>java.vendor          <dd>Java vendor specific string
	//      * <dt>java.vendor.url      <dd>Java vendor URL
	//      * <dt>java.home            <dd>Java installation directory
	//      * <dt>java.class.version   <dd>Java class version number
	//      * <dt>java.class.path      <dd>Java classpath
	//      * <dt>os.name              <dd>Operating System Name
	//      * <dt>os.arch              <dd>Operating System Architecture
	//      * <dt>os.version           <dd>Operating System Version
	//      * <dt>file.separator       <dd>File separator ("/" on Unix)
	//      * <dt>path.separator       <dd>Path separator (":" on Unix)
	//      * <dt>line.separator       <dd>Line separator ("\n" on Unix)
	//      * <dt>user.name            <dd>User account name
	//      * <dt>user.home            <dd>User home directory
	//      * <dt>user.dir             <dd>User's current working directory
	//      * </dl>
	//      
	// 
	private static var props: Properties!
	private static var unchangeableProps: Properties!
	private static var lineSeparator: String!

	// * Don't let anyone instantiate this class
	private init() {
	}

	// *
	//      * Reassigns the "standard" input stream.
	//      *
	//      * <p>First, if there is a security manager, its <code>checkPermission</code>
	//      * method is called with a <code>RuntimePermission("setIO")</code> permission
	//      *  to see if it's ok to reassign the "standard" input stream.
	//      * <p>
	//      *
	//      * @param in the new standard input stream.
	//      *
	//      * @throws SecurityException
	//      *        if a security manager exists and its
	//      *        <code>checkPermission</code> method doesn't allow
	//      *        reassigning of the standard input stream.
	//      *
	//      * @see SecurityManager#checkPermission
	//      * @see java.lang.RuntimePermission
	//      *
	//      * @since   JDK1.1
	public static func setIn(_ `in`: InputStream!) {
		setIn0(`in`)
	}

	// *
	//      * Reassigns the "standard" output stream.
	//      *
	//      * <p>First, if there is a security manager, its <code>checkPermission</code>
	//      * method is called with a <code>RuntimePermission("setIO")</code> permission
	//      *  to see if it's ok to reassign the "standard" output stream.
	//      *
	//      * @param out the new standard output stream
	//      *
	//      * @throws SecurityException
	//      *        if a security manager exists and its
	//      *        <code>checkPermission</code> method doesn't allow
	//      *        reassigning of the standard output stream.
	//      *
	//      * @see SecurityManager#checkPermission
	//      * @see java.lang.RuntimePermission
	//      *
	//      * @since   JDK1.1
	public static func setOut(_ out: PrintStream!) {
		setOut0(out)
	}

	// *
	//      * Reassigns the "standard" error output stream.
	//      *
	//      * <p>First, if there is a security manager, its <code>checkPermission</code>
	//      * method is called with a <code>RuntimePermission("setIO")</code> permission
	//      *  to see if it's ok to reassign the "standard" error output stream.
	//      *
	//      * @param err the new standard error output stream.
	//      *
	//      * @throws SecurityException
	//      *        if a security manager exists and its
	//      *        <code>checkPermission</code> method doesn't allow
	//      *        reassigning of the standard error output stream.
	//      *
	//      * @see SecurityManager#checkPermission
	//      * @see java.lang.RuntimePermission
	//      *
	//      * @since   JDK1.1
	public static func setErr(_ err: PrintStream!) {
		setErr0(err)
	}

	// *
	//      * Returns the unique {@link java.io.Console Console} object associated
	//      * with the current Java virtual machine, if any.
	//      *
	//      * @return  The system console, if any, otherwise <tt>null</tt>.
	//      *
	//      * @since   1.6
	public static func console() -> Console! {
		//  Android-changed: Added proper double checked locking for cons access
		if cons == nil {
		}
		return cons
	}

	// *
	//      * Returns the channel inherited from the entity that created this
	//      * Java virtual machine.
	//      *
	//      * <p> This method returns the channel obtained by invoking the
	//      * {@link java.nio.channels.spi.SelectorProvider#inheritedChannel
	//      * inheritedChannel} method of the system-wide default
	//      * {@link java.nio.channels.spi.SelectorProvider} object. </p>
	//      *
	//      * <p> In addition to the network-oriented channels described in
	//      * {@link java.nio.channels.spi.SelectorProvider#inheritedChannel
	//      * inheritedChannel}, this method may return other kinds of
	//      * channels in the future.
	//      *
	//      * @return  The inherited channel, if any, otherwise <tt>null</tt>.
	//      *
	//      * @throws  IOException
	//      *          If an I/O error occurs
	//      *
	//      * @throws  SecurityException
	//      *          If a security manager is present and it does not
	//      *          permit access to the channel.
	//      *
	//      * @since 1.5
	public static func inheritedChannel() -> Channel! {
		return SelectorProvider.provider().inheritedChannel()
	}

	private static __extern func setIn0(_ `in`: InputStream!)

	private static __extern func setOut0(_ out: PrintStream!)

	private static __extern func setErr0(_ err: PrintStream!)

	// *
	//      * Throws {@code SecurityException} (except in case {@code sm == null}).
	//      *
	//      * <p>Security managers do <i>not</i> provide a secure environment for
	//      * executing untrusted code and are unsupported on Android. Untrusted code
	//      * cannot be safely isolated within a single VM on Android, so this method
	//      * <i>always</i> throws a {@code SecurityException} when passed a non-null SecurityManager
	//      *
	//      * @param s a security manager
	//      * @throws SecurityException always, unless {@code sm == null}
	public static func setSecurityManager(_ s: SecurityManager!) {
		if s != nil {
			throw SecurityException()
		}
	}

	// *
	//      * Always returns {@code null} in Android
	//      *
	//      * @return  {@code null} in Android
	public static func getSecurityManager() -> SecurityManager! {
		//  No-op on android.
		return nil
	}

	// *
	//      * Returns the current time in milliseconds.  Note that
	//      * while the unit of time of the return value is a millisecond,
	//      * the granularity of the value depends on the underlying
	//      * operating system and may be larger.  For example, many
	//      * operating systems measure time in units of tens of
	//      * milliseconds.
	//      *
	//      * <p> See the description of the class <code>Date</code> for
	//      * a discussion of slight discrepancies that may arise between
	//      * "computer time" and coordinated universal time (UTC).
	//      *
	//      * @return  the difference, measured in milliseconds, between
	//      *          the current time and midnight, January 1, 1970 UTC.
	//      * @see     java.util.Date
	public static __extern func currentTimeMillis() -> Int64

	// *
	//      * Returns the current value of the running Java Virtual Machine's
	//      * high-resolution time source, in nanoseconds.
	//      *
	//      * <p>This method can only be used to measure elapsed time and is
	//      * not related to any other notion of system or wall-clock time.
	//      * The value returned represents nanoseconds since some fixed but
	//      * arbitrary <i>origin</i> time (perhaps in the future, so values
	//      * may be negative).  The same origin is used by all invocations of
	//      * this method in an instance of a Java virtual machine; other
	//      * virtual machine instances are likely to use a different origin.
	//      *
	//      * <p>This method provides nanosecond precision, but not necessarily
	//      * nanosecond resolution (that is, how frequently the value changes)
	//      * - no guarantees are made except that the resolution is at least as
	//      * good as that of {@link #currentTimeMillis()}.
	//      *
	//      * <p>Differences in successive calls that span greater than
	//      * approximately 292 years (2<sup>63</sup> nanoseconds) will not
	//      * correctly compute elapsed time due to numerical overflow.
	//      *
	//      * <p>The values returned by this method become meaningful only when
	//      * the difference between two such values, obtained within the same
	//      * instance of a Java virtual machine, is computed.
	//      *
	//      * <p> For example, to measure how long some code takes to execute:
	//      *  <pre> {@code
	//      * long startTime = System.nanoTime();
	//      * // ... the code being measured ...
	//      * long estimatedTime = System.nanoTime() - startTime;}</pre>
	//      *
	//      * <p>To compare two nanoTime values
	//      *  <pre> {@code
	//      * long t0 = System.nanoTime();
	//      * ...
	//      * long t1 = System.nanoTime();}</pre>
	//      *
	//      * one should use {@code t1 - t0 < 0}, not {@code t1 < t0},
	//      * because of the possibility of numerical overflow.
	//      *
	//      * @return the current value of the running Java Virtual Machine's
	//      *         high-resolution time source, in nanoseconds
	//      * @since 1.5
	public static __extern func nanoTime() -> Int64

	// *
	//      * Copies an array from the specified source array, beginning at the
	//      * specified position, to the specified position of the destination array.
	//      * A subsequence of array components are copied from the source
	//      * array referenced by <code>src</code> to the destination array
	//      * referenced by <code>dest</code>. The number of components copied is
	//      * equal to the <code>length</code> argument. The components at
	//      * positions <code>srcPos</code> through
	//      * <code>srcPos+length-1</code> in the source array are copied into
	//      * positions <code>destPos</code> through
	//      * <code>destPos+length-1</code>, respectively, of the destination
	//      * array.
	//      * <p>
	//      * If the <code>src</code> and <code>dest</code> arguments refer to the
	//      * same array object, then the copying is performed as if the
	//      * components at positions <code>srcPos</code> through
	//      * <code>srcPos+length-1</code> were first copied to a temporary
	//      * array with <code>length</code> components and then the contents of
	//      * the temporary array were copied into positions
	//      * <code>destPos</code> through <code>destPos+length-1</code> of the
	//      * destination array.
	//      * <p>
	//      * If <code>dest</code> is <code>null</code>, then a
	//      * <code>NullPointerException</code> is thrown.
	//      * <p>
	//      * If <code>src</code> is <code>null</code>, then a
	//      * <code>NullPointerException</code> is thrown and the destination
	//      * array is not modified.
	//      * <p>
	//      * Otherwise, if any of the following is true, an
	//      * <code>ArrayStoreException</code> is thrown and the destination is
	//      * not modified:
	//      * <ul>
	//      * <li>The <code>src</code> argument refers to an object that is not an
	//      *     array.
	//      * <li>The <code>dest</code> argument refers to an object that is not an
	//      *     array.
	//      * <li>The <code>src</code> argument and <code>dest</code> argument refer
	//      *     to arrays whose component types are different primitive types.
	//      * <li>The <code>src</code> argument refers to an array with a primitive
	//      *    component type and the <code>dest</code> argument refers to an array
	//      *     with a reference component type.
	//      * <li>The <code>src</code> argument refers to an array with a reference
	//      *    component type and the <code>dest</code> argument refers to an array
	//      *     with a primitive component type.
	//      * </ul>
	//      * <p>
	//      * Otherwise, if any of the following is true, an
	//      * <code>IndexOutOfBoundsException</code> is
	//      * thrown and the destination is not modified:
	//      * <ul>
	//      * <li>The <code>srcPos</code> argument is negative.
	//      * <li>The <code>destPos</code> argument is negative.
	//      * <li>The <code>length</code> argument is negative.
	//      * <li><code>srcPos+length</code> is greater than
	//      *     <code>src.length</code>, the length of the source array.
	//      * <li><code>destPos+length</code> is greater than
	//      *     <code>dest.length</code>, the length of the destination array.
	//      * </ul>
	//      * <p>
	//      * Otherwise, if any actual component of the source array from
	//      * position <code>srcPos</code> through
	//      * <code>srcPos+length-1</code> cannot be converted to the component
	//      * type of the destination array by assignment conversion, an
	//      * <code>ArrayStoreException</code> is thrown. In this case, let
	//      * <b><i>k</i></b> be the smallest nonnegative integer less than
	//      * length such that <code>src[srcPos+</code><i>k</i><code>]</code>
	//      * cannot be converted to the component type of the destination
	//      * array; when the exception is thrown, source array components from
	//      * positions <code>srcPos</code> through
	//      * <code>srcPos+</code><i>k</i><code>-1</code>
	//      * will already have been copied to destination array positions
	//      * <code>destPos</code> through
	//      * <code>destPos+</code><i>k</I><code>-1</code> and no other
	//      * positions of the destination array will have been modified.
	//      * (Because of the restrictions already itemized, this
	//      * paragraph effectively applies only to the situation where both
	//      * arrays have component types that are reference types.)
	//      *
	//      * @param      src      the source array.
	//      * @param      srcPos   starting position in the source array.
	//      * @param      dest     the destination array.
	//      * @param      destPos  starting position in the destination data.
	//      * @param      length   the number of array elements to be copied.
	//      * @exception  IndexOutOfBoundsException  if copying would cause
	//      *               access of data outside array bounds.
	//      * @exception  ArrayStoreException  if an element in the <code>src</code>
	//      *               array could not be stored into the <code>dest</code> array
	//      *               because of a type mismatch.
	//      * @exception  NullPointerException if either <code>src</code> or
	//      *               <code>dest</code> is <code>null</code>.
	@FastNative
	public static __extern func arraycopy(_ src: Object!, _ srcPos: Int32, _ dest: Object!, _ destPos: Int32, _ length: Int32)

	// *
	//      * The char[] specialized version of arraycopy().
	//      * Note: This method is required for runtime ART compiler optimizations.
	//      * Do not remove or change the signature.
	@SuppressWarnings("unused")
	private static func arraycopy(_ src: AnsiChar[], _ srcPos: Int32, _ dst: AnsiChar[], _ dstPos: Int32, _ length: Int32) {
		if src == nil {
			throw NullPointerException("src == null")
		}
		if dst == nil {
			throw NullPointerException("dst == null")
		}
		if (srcPos < 0) | (dstPos < 0) | (length < 0) | (srcPos > (src.length - length)) | (dstPos > (dst.length - length)) {
			throw ArrayIndexOutOfBoundsException("src.length=" + src.length + " srcPos=" + srcPos + " dst.length=" + dst.length + " dstPos=" + dstPos + " length=" + length)
		}
		if length <= ARRAYCOPY_SHORT_CHAR_ARRAY_THRESHOLD {
			//  Copy char by char for shorter arrays.
			if (src == dst) & (srcPos < dstPos) & (dstPos < (srcPos + length)) {
				var i: Int32 = length - 1
				while i >= 0 {
					dst[dstPos + i] = src[srcPos + i]
					dec(i)
				}} else {
				var i: Int32 = 0
				while i < length {
					dst[dstPos + i] = src[srcPos + i]
					inc(i)
				}}
		} else {
			//  Call the native version for longer arrays.
			arraycopyCharUnchecked(src, srcPos, dst, dstPos, length)
		}
	}

	// *
	//      * The char[] specialized, unchecked, native version of
	//      * arraycopy(). This assumes error checking has been done.
	@FastNative
	private static __extern func arraycopyCharUnchecked(_ src: AnsiChar[], _ srcPos: Int32, _ dst: AnsiChar[], _ dstPos: Int32, _ length: Int32)

	// *
	//      * The byte[] specialized version of arraycopy().
	//      * Note: This method is required for runtime ART compiler optimizations.
	//      * Do not remove or change the signature.
	//      * Note: Unlike the others, this variant is public due to a dependency we
	//      * are working on removing. b/74103559
	//      *
	//      * @hide
	@SuppressWarnings("unused")
	public static func arraycopy(_ src: Int8[], _ srcPos: Int32, _ dst: Int8[], _ dstPos: Int32, _ length: Int32) {
		if src == nil {
			throw NullPointerException("src == null")
		}
		if dst == nil {
			throw NullPointerException("dst == null")
		}
		if (srcPos < 0) | (dstPos < 0) | (length < 0) | (srcPos > (src.length - length)) | (dstPos > (dst.length - length)) {
			throw ArrayIndexOutOfBoundsException("src.length=" + src.length + " srcPos=" + srcPos + " dst.length=" + dst.length + " dstPos=" + dstPos + " length=" + length)
		}
		if length <= ARRAYCOPY_SHORT_BYTE_ARRAY_THRESHOLD {
			//  Copy byte by byte for shorter arrays.
			if (src == dst) & (srcPos < dstPos) & (dstPos < (srcPos + length)) {
				var i: Int32 = length - 1
				while i >= 0 {
					dst[dstPos + i] = src[srcPos + i]
					dec(i)
				}} else {
				var i: Int32 = 0
				while i < length {
					dst[dstPos + i] = src[srcPos + i]
					inc(i)
				}}
		} else {
			//  Call the native version for longer arrays.
			arraycopyByteUnchecked(src, srcPos, dst, dstPos, length)
		}
	}

	// *
	//      * The byte[] specialized, unchecked, native version of
	//      * arraycopy(). This assumes error checking has been done.
	@FastNative
	private static __extern func arraycopyByteUnchecked(_ src: Int8[], _ srcPos: Int32, _ dst: Int8[], _ dstPos: Int32, _ length: Int32)

	// *
	//      * The short[] specialized version of arraycopy().
	//      * Note: This method is required for runtime ART compiler optimizations.
	//      * Do not remove or change the signature.
	@SuppressWarnings("unused")
	private static func arraycopy(_ src: Int16[], _ srcPos: Int32, _ dst: Int16[], _ dstPos: Int32, _ length: Int32) {
		if src == nil {
			throw NullPointerException("src == null")
		}
		if dst == nil {
			throw NullPointerException("dst == null")
		}
		if (srcPos < 0) | (dstPos < 0) | (length < 0) | (srcPos > (src.length - length)) | (dstPos > (dst.length - length)) {
			throw ArrayIndexOutOfBoundsException("src.length=" + src.length + " srcPos=" + srcPos + " dst.length=" + dst.length + " dstPos=" + dstPos + " length=" + length)
		}
		if length <= ARRAYCOPY_SHORT_SHORT_ARRAY_THRESHOLD {
			//  Copy short by short for shorter arrays.
			if (src == dst) & (srcPos < dstPos) & (dstPos < (srcPos + length)) {
				var i: Int32 = length - 1
				while i >= 0 {
					dst[dstPos + i] = src[srcPos + i]
					dec(i)
				}} else {
				var i: Int32 = 0
				while i < length {
					dst[dstPos + i] = src[srcPos + i]
					inc(i)
				}}
		} else {
			//  Call the native version for longer arrays.
			arraycopyShortUnchecked(src, srcPos, dst, dstPos, length)
		}
	}

	// *
	//      * The short[] specialized, unchecked, native version of
	//      * arraycopy(). This assumes error checking has been done.
	@FastNative
	private static __extern func arraycopyShortUnchecked(_ src: Int16[], _ srcPos: Int32, _ dst: Int16[], _ dstPos: Int32, _ length: Int32)

	// *
	//      * The int[] specialized version of arraycopy().
	//      * Note: This method is required for runtime ART compiler optimizations.
	//      * Do not remove or change the signature.
	@SuppressWarnings("unused")
	private static func arraycopy(_ src: Int32[], _ srcPos: Int32, _ dst: Int32[], _ dstPos: Int32, _ length: Int32) {
		if src == nil {
			throw NullPointerException("src == null")
		}
		if dst == nil {
			throw NullPointerException("dst == null")
		}
		if (srcPos < 0) | (dstPos < 0) | (length < 0) | (srcPos > (src.length - length)) | (dstPos > (dst.length - length)) {
			throw ArrayIndexOutOfBoundsException("src.length=" + src.length + " srcPos=" + srcPos + " dst.length=" + dst.length + " dstPos=" + dstPos + " length=" + length)
		}
		if length <= ARRAYCOPY_SHORT_INT_ARRAY_THRESHOLD {
			//  Copy int by int for shorter arrays.
			if (src == dst) & (srcPos < dstPos) & (dstPos < (srcPos + length)) {
				var i: Int32 = length - 1
				while i >= 0 {
					dst[dstPos + i] = src[srcPos + i]
					dec(i)
				}} else {
				var i: Int32 = 0
				while i < length {
					dst[dstPos + i] = src[srcPos + i]
					inc(i)
				}}
		} else {
			//  Call the native version for longer arrays.
			arraycopyIntUnchecked(src, srcPos, dst, dstPos, length)
		}
	}

	// *
	//      * The int[] specialized, unchecked, native version of
	//      * arraycopy(). This assumes error checking has been done.
	@FastNative
	private static __extern func arraycopyIntUnchecked(_ src: Int32[], _ srcPos: Int32, _ dst: Int32[], _ dstPos: Int32, _ length: Int32)

	// *
	//      * The long[] specialized version of arraycopy().
	//      * Note: This method is required for runtime ART compiler optimizations.
	//      * Do not remove or change the signature.
	@SuppressWarnings("unused")
	private static func arraycopy(_ src: Int64[], _ srcPos: Int32, _ dst: Int64[], _ dstPos: Int32, _ length: Int32) {
		if src == nil {
			throw NullPointerException("src == null")
		}
		if dst == nil {
			throw NullPointerException("dst == null")
		}
		if (srcPos < 0) | (dstPos < 0) | (length < 0) | (srcPos > (src.length - length)) | (dstPos > (dst.length - length)) {
			throw ArrayIndexOutOfBoundsException("src.length=" + src.length + " srcPos=" + srcPos + " dst.length=" + dst.length + " dstPos=" + dstPos + " length=" + length)
		}
		if length <= ARRAYCOPY_SHORT_LONG_ARRAY_THRESHOLD {
			//  Copy long by long for shorter arrays.
			if (src == dst) & (srcPos < dstPos) & (dstPos < (srcPos + length)) {
				var i: Int32 = length - 1
				while i >= 0 {
					dst[dstPos + i] = src[srcPos + i]
					dec(i)
				}} else {
				var i: Int32 = 0
				while i < length {
					dst[dstPos + i] = src[srcPos + i]
					inc(i)
				}}
		} else {
			//  Call the native version for longer arrays.
			arraycopyLongUnchecked(src, srcPos, dst, dstPos, length)
		}
	}

	// *
	//      * The long[] specialized, unchecked, native version of
	//      * arraycopy(). This assumes error checking has been done.
	@FastNative
	private static __extern func arraycopyLongUnchecked(_ src: Int64[], _ srcPos: Int32, _ dst: Int64[], _ dstPos: Int32, _ length: Int32)

	// *
	//      * The float[] specialized version of arraycopy().
	//      * Note: This method is required for runtime ART compiler optimizations.
	//      * Do not remove or change the signature.
	@SuppressWarnings("unused")
	private static func arraycopy(_ src: Float32[], _ srcPos: Int32, _ dst: Float32[], _ dstPos: Int32, _ length: Int32) {
		if src == nil {
			throw NullPointerException("src == null")
		}
		if dst == nil {
			throw NullPointerException("dst == null")
		}
		if (srcPos < 0) | (dstPos < 0) | (length < 0) | (srcPos > (src.length - length)) | (dstPos > (dst.length - length)) {
			throw ArrayIndexOutOfBoundsException("src.length=" + src.length + " srcPos=" + srcPos + " dst.length=" + dst.length + " dstPos=" + dstPos + " length=" + length)
		}
		if length <= ARRAYCOPY_SHORT_FLOAT_ARRAY_THRESHOLD {
			//  Copy float by float for shorter arrays.
			if (src == dst) & (srcPos < dstPos) & (dstPos < (srcPos + length)) {
				var i: Int32 = length - 1
				while i >= 0 {
					dst[dstPos + i] = src[srcPos + i]
					dec(i)
				}} else {
				var i: Int32 = 0
				while i < length {
					dst[dstPos + i] = src[srcPos + i]
					inc(i)
				}}
		} else {
			//  Call the native version for floater arrays.
			arraycopyFloatUnchecked(src, srcPos, dst, dstPos, length)
		}
	}

	// *
	//      * The float[] specialized, unchecked, native version of
	//      * arraycopy(). This assumes error checking has been done.
	@FastNative
	private static __extern func arraycopyFloatUnchecked(_ src: Float32[], _ srcPos: Int32, _ dst: Float32[], _ dstPos: Int32, _ length: Int32)

	// *
	//      * The double[] specialized version of arraycopy().
	//      * Note: This method is required for runtime ART compiler optimizations.
	//      * Do not remove or change the signature.
	@SuppressWarnings("unused")
	private static func arraycopy(_ src: Float64[], _ srcPos: Int32, _ dst: Float64[], _ dstPos: Int32, _ length: Int32) {
		if src == nil {
			throw NullPointerException("src == null")
		}
		if dst == nil {
			throw NullPointerException("dst == null")
		}
		if (srcPos < 0) | (dstPos < 0) | (length < 0) | (srcPos > (src.length - length)) | (dstPos > (dst.length - length)) {
			throw ArrayIndexOutOfBoundsException("src.length=" + src.length + " srcPos=" + srcPos + " dst.length=" + dst.length + " dstPos=" + dstPos + " length=" + length)
		}
		if length <= ARRAYCOPY_SHORT_DOUBLE_ARRAY_THRESHOLD {
			//  Copy double by double for shorter arrays.
			if (src == dst) & (srcPos < dstPos) & (dstPos < (srcPos + length)) {
				var i: Int32 = length - 1
				while i >= 0 {
					dst[dstPos + i] = src[srcPos + i]
					dec(i)
				}} else {
				var i: Int32 = 0
				while i < length {
					dst[dstPos + i] = src[srcPos + i]
					inc(i)
				}}
		} else {
			//  Call the native version for floater arrays.
			arraycopyDoubleUnchecked(src, srcPos, dst, dstPos, length)
		}
	}

	// *
	//      * The double[] specialized, unchecked, native version of
	//      * arraycopy(). This assumes error checking has been done.
	@FastNative
	private static __extern func arraycopyDoubleUnchecked(_ src: Float64[], _ srcPos: Int32, _ dst: Float64[], _ dstPos: Int32, _ length: Int32)

	// *
	//      * The boolean[] specialized version of arraycopy().
	//      * Note: This method is required for runtime ART compiler optimizations.
	//      * Do not remove or change the signature.
	@SuppressWarnings("unused")
	private static func arraycopy(_ src: Bool[], _ srcPos: Int32, _ dst: Bool[], _ dstPos: Int32, _ length: Int32) {
		if src == nil {
			throw NullPointerException("src == null")
		}
		if dst == nil {
			throw NullPointerException("dst == null")
		}
		if (srcPos < 0) | (dstPos < 0) | (length < 0) | (srcPos > (src.length - length)) | (dstPos > (dst.length - length)) {
			throw ArrayIndexOutOfBoundsException("src.length=" + src.length + " srcPos=" + srcPos + " dst.length=" + dst.length + " dstPos=" + dstPos + " length=" + length)
		}
		if length <= ARRAYCOPY_SHORT_BOOLEAN_ARRAY_THRESHOLD {
			//  Copy boolean by boolean for shorter arrays.
			if (src == dst) & (srcPos < dstPos) & (dstPos < (srcPos + length)) {
				var i: Int32 = length - 1
				while i >= 0 {
					dst[dstPos + i] = src[srcPos + i]
					dec(i)
				}} else {
				var i: Int32 = 0
				while i < length {
					dst[dstPos + i] = src[srcPos + i]
					inc(i)
				}}
		} else {
			//  Call the native version for floater arrays.
			arraycopyBooleanUnchecked(src, srcPos, dst, dstPos, length)
		}
	}

	// *
	//      * The boolean[] specialized, unchecked, native version of
	//      * arraycopy(). This assumes error checking has been done.
	@FastNative
	private static __extern func arraycopyBooleanUnchecked(_ src: Bool[], _ srcPos: Int32, _ dst: Bool[], _ dstPos: Int32, _ length: Int32)

	// END Android-changed
	// *
	//      * Returns the same hash code for the given object as
	//      * would be returned by the default method hashCode(),
	//      * whether or not the given object's class overrides
	//      * hashCode().
	//      * The hash code for the null reference is zero.
	//      *
	//      * @param x object for which the hashCode is to be calculated
	//      * @return  the hashCode
	//      * @since   JDK1.1
	public static func identityHashCode(_ x: Object!) -> Int32 {
		if x == nil {
			return 0
		}
		return Object.identityHashCode(x)
	}

	private static __extern func specialProperties() -> String![]

	private static func parsePropertyAssignments(_ p: Properties!, _ assignments: String![]) {
		for assignment in assignments {
			var split: Int32 = assignment.indexOf("=")
			var key: String! = assignment.substring(0, split)
			var value: String! = assignment.substring(split + 1)
			p.put(key, value)
		}
	}

	private static func initUnchangeableSystemProperties() -> Properties! {
		var runtime: VMRuntime! = VMRuntime.getRuntime()
		var p: Properties! = Properties()
		//  Set non-static properties.
		p.put("java.boot.class.path", runtime.bootClassPath())
		p.put("java.class.path", runtime.classPath())
		//  TODO: does this make any sense? Should we just leave java.home unset?
		var javaHome: String! = getenv("JAVA_HOME")
		if javaHome == nil {
			javaHome = "/system"
		}
		p.put("java.home", javaHome)
		p.put("java.vm.version", runtime.vmVersion())
		__try {
			var passwd: StructPasswd! = Libcore.os.getpwuid(Libcore.os.getuid())
			p.put("user.name", passwd.pw_name)
		}
		__catch exception: ErrnoException {
			throw AssertionError(exception)
		}
		var info: StructUtsname! = Libcore.os.uname()
		p.put("os.arch", info.machine)
		if p.`get`("os.name") != nil & !p.`get`("os.name").equals(info.sysname) {
			logE("Wrong compile-time assumption for os.name: " + p.`get`("os.name") + " vs " + info.sysname)
			p.put("os.name", info.sysname)
		}
		p.put("os.version", info.release)
		//  Android-added: Undocumented properties that exist only on Android.
		p.put("android.icu.library.version", ICU.getIcuVersion())
		p.put("android.icu.unicode.version", ICU.getUnicodeVersion())
		p.put("android.icu.cldr.version", ICU.getCldrVersion())
		//  Property override for ICU4J : this is the location of the ICU4C data. This
		//  is prioritized over the properties in ICUConfig.properties. The issue with using
		//  that is that it doesn't play well with jarjar and it needs complicated build rules
		//  to change its default value.
		var icuDataPath: String! = TimeZoneDataFiles.generateIcuDataPath()
		p.put("android.icu.impl.ICUBinary.dataPath", icuDataPath)
		parsePropertyAssignments(p, specialProperties())
		//  Override built-in properties with settings from the command line.
		//  Note: it is not possible to override hardcoded values.
		parsePropertyAssignments(p, runtime.properties())
		//  Set static hardcoded properties.
		//  These come last, as they must be guaranteed to agree with what a backend compiler
		//  may assume when compiling the boot image on Android.
		for pair in AndroidHardcodedSystemProperties.STATIC_PROPERTIES {
			if p.containsKey(pair[0]) {
				logE("Ignoring command line argument: -D" + pair[0])
			}
			if pair[1] == nil {
				p.remove(pair[0])
			} else {
				p.put(pair[0], pair[1])
			}
		}
		return p
	}

	private static func initProperties() -> Properties! {
		var p: Properties! = PropertiesWithNonOverrideableDefaults(unchangeableProps)
		setDefaultChangeableProperties(p)
		return p
	}

	private static func setDefaultChangeableProperties(_ p: Properties!) -> Properties! {
		//  On Android, each app gets its own temporary directory.
		//  (See android.app.ActivityThread.) This is just a fallback default,
		//  useful only on the host.
		//  We check first if the property has not been set already: note that it
		//  can only be set from the command line through the '-Djava.io.tmpdir=' option.
		if !unchangeableProps.containsKey("java.io.tmpdir") {
			p.put("java.io.tmpdir", "/tmp")
		}
		//  Android has always had an empty "user.home" (see docs for getProperty).
		//  This is not useful for normal android apps which need to use android specific
		//  APIs such as {@code Context.getFilesDir} and {@code Context.getCacheDir} but
		//  we make it changeable for backward compatibility, so that they can change it
		//  to a writeable location if required.
		//  We check first if the property has not been set already: note that it
		//  can only be set from the command line through the '-Duser.home=' option.
		if !unchangeableProps.containsKey("user.home") {
			p.put("user.home", "")
		}
		return p
	}

	// *
	//      * Inits an unchangeable system property with the given value.
	//      *
	//      * This is called from native code when the environment needs to change under native
	//      * bridge emulation.
	//      *
	//      * @hide also visible for tests.
	public static func setUnchangeableSystemProperty(_ key: String!, _ value: String!) {
		checkKey(key)
		unchangeableProps.put(key, value)
	}

	private static func addLegacyLocaleSystemProperties() {
		var locale: String! = getProperty("user.locale", "")
		if !locale.isEmpty() {
			var l: Locale! = Locale.forLanguageTag(locale)
			setUnchangeableSystemProperty("user.language", l.getLanguage())
			setUnchangeableSystemProperty("user.region", l.getCountry())
			setUnchangeableSystemProperty("user.variant", l.getVariant())
		} else {
			var language: String! = getProperty("user.language", "")
			var region: String! = getProperty("user.region", "")
			if language.isEmpty() {
				setUnchangeableSystemProperty("user.language", "en")
			}
			if region.isEmpty() {
				setUnchangeableSystemProperty("user.region", "US")
			}
		}
	}

	// *
	//      * Determines the current system properties.
	//      *
	//      *
	//      * <p>The following properties are always provided by the Dalvik VM:</p>
	//      * <p><table BORDER="1" WIDTH="100%" CELLPADDING="3" CELLSPACING="0" SUMMARY="">
	//      * <tr BGCOLOR="#CCCCFF" CLASS="TableHeadingColor">
	//      *     <td><b>Name</b></td>        <td><b>Meaning</b></td>                    <td><b>Example</b></td></tr>
	//      * <tr><td>file.separator</td>     <td>{@link java.io.File#separator}</td>    <td>{@code /}</td></tr>
	//      *
	//      * <tr><td>java.class.path</td>    <td>System class path</td>                 <td>{@code .}</td></tr>
	//      * <tr><td>java.class.version</td> <td>(Not useful on Android)</td>           <td>{@code 50.0}</td></tr>
	//      * <tr><td>java.compiler</td>      <td>(Not useful on Android)</td>           <td>Empty</td></tr>
	//      * <tr><td>java.ext.dirs</td>      <td>(Not useful on Android)</td>           <td>Empty</td></tr>
	//      * <tr><td>java.home</td>          <td>Location of the VM on the file system</td> <td>{@code /system}</td></tr>
	//      * <tr><td>java.io.tmpdir</td>     <td>See {@link java.io.File#createTempFile}</td> <td>{@code /sdcard}</td></tr>
	//      * <tr><td>java.library.path</td>  <td>Search path for JNI libraries</td>     <td>{@code /vendor/lib:/system/lib}</td></tr>
	//      * <tr><td>java.vendor</td>        <td>Human-readable VM vendor</td>          <td>{@code The Android Project}</td></tr>
	//      * <tr><td>java.vendor.url</td>    <td>URL for VM vendor's web site</td>      <td>{@code http://www.android.com/}</td></tr>
	//      * <tr><td>java.version</td>       <td>(Not useful on Android)</td>           <td>{@code 0}</td></tr>
	//      *
	//      * <tr><td>java.specification.version</td>    <td>VM libraries version</td>        <td>{@code 0.9}</td></tr>
	//      * <tr><td>java.specification.vendor</td>     <td>VM libraries vendor</td>         <td>{@code The Android Project}</td></tr>
	//      * <tr><td>java.specification.name</td>       <td>VM libraries name</td>           <td>{@code Dalvik Core Library}</td></tr>
	//      * <tr><td>java.vm.version</td>               <td>VM implementation version</td>   <td>{@code 1.2.0}</td></tr>
	//      * <tr><td>java.vm.vendor</td>                <td>VM implementation vendor</td>    <td>{@code The Android Project}</td></tr>
	//      * <tr><td>java.vm.name</td>                  <td>VM implementation name</td>      <td>{@code Dalvik}</td></tr>
	//      * <tr><td>java.vm.specification.version</td> <td>VM specification version</td>    <td>{@code 0.9}</td></tr>
	//      * <tr><td>java.vm.specification.vendor</td>  <td>VM specification vendor</td>     <td>{@code The Android Project}</td></tr>
	//      * <tr><td>java.vm.specification.name</td>    <td>VM specification name</td>       <td>{@code Dalvik Virtual Machine Specification}</td></tr>
	//      *
	//      * <tr><td>line.separator</td>     <td>The system line separator</td>         <td>{@code \n}</td></tr>
	//      *
	//      * <tr><td>os.arch</td>            <td>OS architecture</td>                   <td>{@code armv7l}</td></tr>
	//      * <tr><td>os.name</td>            <td>OS (kernel) name</td>                  <td>{@code Linux}</td></tr>
	//      * <tr><td>os.version</td>         <td>OS (kernel) version</td>               <td>{@code 2.6.32.9-g103d848}</td></tr>
	//      *
	//      * <tr><td>path.separator</td>     <td>See {@link java.io.File#pathSeparator}</td> <td>{@code :}</td></tr>
	//      *
	//      * <tr><td>user.dir</td>           <td>Base of non-absolute paths</td>        <td>{@code /}</td></tr>
	//      * <tr><td>user.home</td>          <td>(Not useful on Android)</td>           <td>Empty</td></tr>
	//      * <tr><td>user.name</td>          <td>(Not useful on Android)</td>           <td>Empty</td></tr>
	//      *
	//      * </table>
	//      * <p>
	//      * Multiple paths in a system property value are separated by the path
	//      * separator character of the platform.
	//      * <p>
	//      * Note that even if the security manager does not permit the
	//      * <code>getProperties</code> operation, it may choose to permit the
	//      * {@link #getProperty(String)} operation.
	//      *
	//      * @return     the system properties
	//      * @exception  SecurityException  if a security manager exists and its
	//      *             <code>checkPropertiesAccess</code> method doesn't allow access
	//      *              to the system properties.
	//      * @see        #setProperties
	//      * @see        java.lang.SecurityException
	//      * @see        java.lang.SecurityManager#checkPropertiesAccess()
	//      * @see        java.util.Properties
	public static func getProperties() -> Properties! {
		var sm: SecurityManager! = getSecurityManager()
		if sm != nil {
			sm.checkPropertiesAccess()
		}
		return props
	}

	// *
	//      * Returns the system-dependent line separator string.  It always
	//      * returns the same value - the initial value of the {@linkplain
	//      * #getProperty(String) system property} {@code line.separator}.
	//      *
	//      * <p>On UNIX systems, it returns {@code "\n"}; on Microsoft
	//      * Windows systems it returns {@code "\r\n"}.
	//      *
	//      * @return the system-dependent line separator string
	//      * @since 1.7
	public static func lineSeparator() -> String! {
		return lineSeparator
	}

	// Comment replaced with android one.
	// *
	//      * Attempts to set all system properties. Copies all properties from
	//      * {@code p} and discards system properties that are read only and cannot
	//      * be modified. See {@link #getProperty} for a list of such properties.
	public static func setProperties(_ props: Properties!) {
		var baseProperties: Properties! = PropertiesWithNonOverrideableDefaults(unchangeableProps)
		if props != nil {
			baseProperties.putAll(props)
		} else {
			setDefaultChangeableProperties(baseProperties)
		}
		System.props = baseProperties
	}

	// *
	//      * Gets the system property indicated by the specified key.
	//      * <p>
	//      * First, if there is a security manager, its
	//      * <code>checkPropertyAccess</code> method is called with the key as
	//      * its argument. This may result in a SecurityException.
	//      * <p>
	//      * If there is no current set of system properties, a set of system
	//      * properties is first created and initialized in the same manner as
	//      * for the <code>getProperties</code> method.
	//      *
	//      * @param      key   the name of the system property.
	//      * @return     the string value of the system property,
	//      *             or <code>null</code> if there is no property with that key.
	//      *
	//      * @exception  SecurityException  if a security manager exists and its
	//      *             <code>checkPropertyAccess</code> method doesn't allow
	//      *              access to the specified system property.
	//      * @exception  NullPointerException if <code>key</code> is
	//      *             <code>null</code>.
	//      * @exception  IllegalArgumentException if <code>key</code> is empty.
	//      * @see        #setProperty
	//      * @see        java.lang.SecurityException
	//      * @see        java.lang.SecurityManager#checkPropertyAccess(java.lang.String)
	//      * @see        java.lang.System#getProperties()
	public static func getProperty(_ key: String!) -> String! {
		checkKey(key)
		var sm: SecurityManager! = getSecurityManager()
		if sm != nil {
			sm.checkPropertyAccess(key)
		}
		return props.getProperty(key)
	}

	// *
	//      * Gets the system property indicated by the specified key.
	//      * <p>
	//      * First, if there is a security manager, its
	//      * <code>checkPropertyAccess</code> method is called with the
	//      * <code>key</code> as its argument.
	//      * <p>
	//      * If there is no current set of system properties, a set of system
	//      * properties is first created and initialized in the same manner as
	//      * for the <code>getProperties</code> method.
	//      *
	//      * @param      key   the name of the system property.
	//      * @param      def   a default value.
	//      * @return     the string value of the system property,
	//      *             or the default value if there is no property with that key.
	//      *
	//      * @exception  SecurityException  if a security manager exists and its
	//      *             <code>checkPropertyAccess</code> method doesn't allow
	//      *             access to the specified system property.
	//      * @exception  NullPointerException if <code>key</code> is
	//      *             <code>null</code>.
	//      * @exception  IllegalArgumentException if <code>key</code> is empty.
	//      * @see        #setProperty
	//      * @see        java.lang.SecurityManager#checkPropertyAccess(java.lang.String)
	//      * @see        java.lang.System#getProperties()
	public static func getProperty(_ key: String!, _ def: String!) -> String! {
		checkKey(key)
		var sm: SecurityManager! = getSecurityManager()
		if sm != nil {
			sm.checkPropertyAccess(key)
		}
		return props.getProperty(key, def)
	}

	// *
	//      * Sets the system property indicated by the specified key.
	//      * <p>
	//      * First, if a security manager exists, its
	//      * <code>SecurityManager.checkPermission</code> method
	//      * is called with a <code>PropertyPermission(key, "write")</code>
	//      * permission. This may result in a SecurityException being thrown.
	//      * If no exception is thrown, the specified property is set to the given
	//      * value.
	//      * <p>
	//      *
	//      * @param      key   the name of the system property.
	//      * @param      value the value of the system property.
	//      * @return     the previous value of the system property,
	//      *             or <code>null</code> if it did not have one.
	//      *
	//      * @exception  SecurityException  if a security manager exists and its
	//      *             <code>checkPermission</code> method doesn't allow
	//      *             setting of the specified property.
	//      * @exception  NullPointerException if <code>key</code> or
	//      *             <code>value</code> is <code>null</code>.
	//      * @exception  IllegalArgumentException if <code>key</code> is empty.
	//      * @see        #getProperty
	//      * @see        java.lang.System#getProperty(java.lang.String)
	//      * @see        java.lang.System#getProperty(java.lang.String, java.lang.String)
	//      * @see        java.util.PropertyPermission
	//      * @see        SecurityManager#checkPermission
	//      * @since      1.2
	public static func setProperty(_ key: String!, _ value: String!) -> String! {
		checkKey(key)
		var sm: SecurityManager! = getSecurityManager()
		if sm != nil {
			sm.checkPermission(PropertyPermission(key, SecurityConstants.PROPERTY_WRITE_ACTION))
		}
		return (props.setProperty(key, value) as? String)
	}

	// *
	//      * Removes the system property indicated by the specified key.
	//      * <p>
	//      * First, if a security manager exists, its
	//      * <code>SecurityManager.checkPermission</code> method
	//      * is called with a <code>PropertyPermission(key, "write")</code>
	//      * permission. This may result in a SecurityException being thrown.
	//      * If no exception is thrown, the specified property is removed.
	//      * <p>
	//      *
	//      * @param      key   the name of the system property to be removed.
	//      * @return     the previous string value of the system property,
	//      *             or <code>null</code> if there was no property with that key.
	//      *
	//      * @exception  SecurityException  if a security manager exists and its
	//      *             <code>checkPropertyAccess</code> method doesn't allow
	//      *              access to the specified system property.
	//      * @exception  NullPointerException if <code>key</code> is
	//      *             <code>null</code>.
	//      * @exception  IllegalArgumentException if <code>key</code> is empty.
	//      * @see        #getProperty
	//      * @see        #setProperty
	//      * @see        java.util.Properties
	//      * @see        java.lang.SecurityException
	//      * @see        java.lang.SecurityManager#checkPropertiesAccess()
	//      * @since 1.5
	public static func clearProperty(_ key: String!) -> String! {
		checkKey(key)
		var sm: SecurityManager! = getSecurityManager()
		if sm != nil {
			sm.checkPermission(PropertyPermission(key, "write"))
		}
		return (props.remove(key) as? String)
	}

	private static func checkKey(_ key: String!) {
		if key == nil {
			throw NullPointerException("key can\'t be null")
		}
		if key.equals("") {
			throw IllegalArgumentException("key can\'t be empty")
		}
	}

	// *
	//      * Gets the value of the specified environment variable. An
	//      * environment variable is a system-dependent external named
	//      * value.
	//      *
	//      * <p>If a security manager exists, its
	//      * {@link SecurityManager#checkPermission checkPermission}
	//      * method is called with a
	//      * <code>{@link RuntimePermission}("getenv."+name)</code>
	//      * permission.  This may result in a {@link SecurityException}
	//      * being thrown.  If no exception is thrown the value of the
	//      * variable <code>name</code> is returned.
	//      *
	//      * <p><a name="EnvironmentVSSystemProperties"><i>System
	//      * properties</i> and <i>environment variables</i></a> are both
	//      * conceptually mappings between names and values.  Both
	//      * mechanisms can be used to pass user-defined information to a
	//      * Java process.  Environment variables have a more global effect,
	//      * because they are visible to all descendants of the process
	//      * which defines them, not just the immediate Java subprocess.
	//      * They can have subtly different semantics, such as case
	//      * insensitivity, on different operating systems.  For these
	//      * reasons, environment variables are more likely to have
	//      * unintended side effects.  It is best to use system properties
	//      * where possible.  Environment variables should be used when a
	//      * global effect is desired, or when an external system interface
	//      * requires an environment variable (such as <code>PATH</code>).
	//      *
	//      * <p>On UNIX systems the alphabetic case of <code>name</code> is
	//      * typically significant, while on Microsoft Windows systems it is
	//      * typically not.  For example, the expression
	//      * <code>System.getenv("FOO").equals(System.getenv("foo"))</code>
	//      * is likely to be true on Microsoft Windows.
	//      *
	//      * @param  name the name of the environment variable
	//      * @return the string value of the variable, or <code>null</code>
	//      *         if the variable is not defined in the system environment
	//      * @throws NullPointerException if <code>name</code> is <code>null</code>
	//      * @throws SecurityException
	//      *         if a security manager exists and its
	//      *         {@link SecurityManager#checkPermission checkPermission}
	//      *         method doesn't allow access to the environment variable
	//      *         <code>name</code>
	//      * @see    #getenv()
	//      * @see    ProcessBuilder#environment()
	public static func getenv(_ name: String!) -> String! {
		if name == nil {
			throw NullPointerException("name == null")
		}
		return Libcore.os.getenv(name)
	}

	// *
	//      * Returns an unmodifiable string map view of the current system environment.
	//      * The environment is a system-dependent mapping from names to
	//      * values which is passed from parent to child processes.
	//      *
	//      * <p>If the system does not support environment variables, an
	//      * empty map is returned.
	//      *
	//      * <p>The returned map will never contain null keys or values.
	//      * Attempting to query the presence of a null key or value will
	//      * throw a {@link NullPointerException}.  Attempting to query
	//      * the presence of a key or value which is not of type
	//      * {@link String} will throw a {@link ClassCastException}.
	//      *
	//      * <p>The returned map and its collection views may not obey the
	//      * general contract of the {@link Object#equals} and
	//      * {@link Object#hashCode} methods.
	//      *
	//      * <p>The returned map is typically case-sensitive on all platforms.
	//      *
	//      * <p>If a security manager exists, its
	//      * {@link SecurityManager#checkPermission checkPermission}
	//      * method is called with a
	//      * <code>{@link RuntimePermission}("getenv.*")</code>
	//      * permission.  This may result in a {@link SecurityException} being
	//      * thrown.
	//      *
	//      * <p>When passing information to a Java subprocess,
	//      * <a href=#EnvironmentVSSystemProperties>system properties</a>
	//      * are generally preferred over environment variables.
	//      *
	//      * @return the environment as a map of variable names to values
	//      * @throws SecurityException
	//      *         if a security manager exists and its
	//      *         {@link SecurityManager#checkPermission checkPermission}
	//      *         method doesn't allow access to the process environment
	//      * @see    #getenv(String)
	//      * @see    ProcessBuilder#environment()
	//      * @since  1.5
	public static func getenv() -> java.util.Map<String!,String!>! {
		var sm: SecurityManager! = getSecurityManager()
		if sm != nil {
			sm.checkPermission(RuntimePermission("getenv.*"))
		}
		return ProcessEnvironment.getenv()
	}

	// *
	//      * Terminates the currently running Java Virtual Machine. The
	//      * argument serves as a status code; by convention, a nonzero status
	//      * code indicates abnormal termination.
	//      * <p>
	//      * This method calls the <code>exit</code> method in class
	//      * <code>Runtime</code>. This method never returns normally.
	//      * <p>
	//      * The call <code>System.exit(n)</code> is effectively equivalent to
	//      * the call:
	//      * <blockquote><pre>
	//      * Runtime.getRuntime().exit(n)
	//      * </pre></blockquote>
	//      *
	//      * @param      status   exit status.
	//      * @throws  SecurityException
	//      *        if a security manager exists and its <code>checkExit</code>
	//      *        method doesn't allow exit with the specified status.
	//      * @see        java.lang.Runtime#exit(int)
	public static func exit(_ status: Int32) {
		Runtime.getRuntime().exit(status)
	}

	// *
	//      * Runs the garbage collector.
	//      * <p>
	//      * Calling the <code>gc</code> method suggests that the Java Virtual
	//      * Machine expend effort toward recycling unused objects in order to
	//      * make the memory they currently occupy available for quick reuse.
	//      * When control returns from the method call, the Java Virtual
	//      * Machine has made a best effort to reclaim space from all discarded
	//      * objects.
	//      * <p>
	//      * The call <code>System.gc()</code> is effectively equivalent to the
	//      * call:
	//      * <blockquote><pre>
	//      * Runtime.getRuntime().gc()
	//      * </pre></blockquote>
	//      *
	//      * @see     java.lang.Runtime#gc()
	public static func gc() {
		var shouldRunGC: Bool
		if shouldRunGC {
			Runtime.getRuntime().gc()
		}
	}

	// *
	//      * Runs the finalization methods of any objects pending finalization.
	//      * <p>
	//      * Calling this method suggests that the Java Virtual Machine expend
	//      * effort toward running the <code>finalize</code> methods of objects
	//      * that have been found to be discarded but whose <code>finalize</code>
	//      * methods have not yet been run. When control returns from the
	//      * method call, the Java Virtual Machine has made a best effort to
	//      * complete all outstanding finalizations.
	//      * <p>
	//      * The call <code>System.runFinalization()</code> is effectively
	//      * equivalent to the call:
	//      * <blockquote><pre>
	//      * Runtime.getRuntime().runFinalization()
	//      * </pre></blockquote>
	//      *
	//      * @see     java.lang.Runtime#runFinalization()
	public static func runFinalization() {
		var shouldRunGC: Bool
		if shouldRunGC {
			Runtime.getRuntime().gc()
		}
		Runtime.getRuntime().runFinalization()
	}

	// *
	//      * Enable or disable finalization on exit; doing so specifies that the
	//      * finalizers of all objects that have finalizers that have not yet been
	//      * automatically invoked are to be run before the Java runtime exits.
	//      * By default, finalization on exit is disabled.
	//      *
	//      * <p>If there is a security manager,
	//      * its <code>checkExit</code> method is first called
	//      * with 0 as its argument to ensure the exit is allowed.
	//      * This could result in a SecurityException.
	//      *
	//      * @deprecated  This method is inherently unsafe.  It may result in
	//      *      finalizers being called on live objects while other threads are
	//      *      concurrently manipulating those objects, resulting in erratic
	//      *      behavior or deadlock.
	//      * @param value indicating enabling or disabling of finalization
	//      * @throws  SecurityException
	//      *        if a security manager exists and its <code>checkExit</code>
	//      *        method doesn't allow the exit.
	//      *
	//      * @see     java.lang.Runtime#exit(int)
	//      * @see     java.lang.Runtime#gc()
	//      * @see     java.lang.SecurityManager#checkExit(int)
	//      * @since   JDK1.1
	@Deprecated
	public static func runFinalizersOnExit(_ value: Bool) {
		Runtime.runFinalizersOnExit(value)
	}

	// *
	//      * Loads the native library specified by the filename argument.  The filename
	//      * argument must be an absolute path name.
	//      *
	//      * If the filename argument, when stripped of any platform-specific library
	//      * prefix, path, and file extension, indicates a library whose name is,
	//      * for example, L, and a native library called L is statically linked
	//      * with the VM, then the JNI_OnLoad_L function exported by the library
	//      * is invoked rather than attempting to load a dynamic library.
	//      * A filename matching the argument does not have to exist in the
	//      * file system.
	//      * See the JNI Specification for more details.
	//      *
	//      * Otherwise, the filename argument is mapped to a native library image in
	//      * an implementation-dependent manner.
	//      *
	//      * <p>
	//      * The call <code>System.load(name)</code> is effectively equivalent
	//      * to the call:
	//      * <blockquote><pre>
	//      * Runtime.getRuntime().load(name)
	//      * </pre></blockquote>
	//      *
	//      * @param      filename   the file to load.
	//      * @exception  SecurityException  if a security manager exists and its
	//      *             <code>checkLink</code> method doesn't allow
	//      *             loading of the specified dynamic library
	//      * @exception  UnsatisfiedLinkError  if either the filename is not an
	//      *             absolute path name, the native library is not statically
	//      *             linked with the VM, or the library cannot be mapped to
	//      *             a native library image by the host system.
	//      * @exception  NullPointerException if <code>filename</code> is
	//      *             <code>null</code>
	//      * @see        java.lang.Runtime#load(java.lang.String)
	//      * @see        java.lang.SecurityManager#checkLink(java.lang.String)
	@CallerSensitive
	public static func load(_ filename: String!) {
		Runtime.getRuntime().load0(Reflection.getCallerClass(), filename)
	}

	// *
	//      * Loads the native library specified by the <code>libname</code>
	//      * argument.  The <code>libname</code> argument must not contain any platform
	//      * specific prefix, file extension or path. If a native library
	//      * called <code>libname</code> is statically linked with the VM, then the
	//      * JNI_OnLoad_<code>libname</code> function exported by the library is invoked.
	//      * See the JNI Specification for more details.
	//      *
	//      * Otherwise, the libname argument is loaded from a system library
	//      * location and mapped to a native library image in an implementation-
	//      * dependent manner.
	//      * <p>
	//      * The call <code>System.loadLibrary(name)</code> is effectively
	//      * equivalent to the call
	//      * <blockquote><pre>
	//      * Runtime.getRuntime().loadLibrary(name)
	//      * </pre></blockquote>
	//      *
	//      * @param      libname   the name of the library.
	//      * @exception  SecurityException  if a security manager exists and its
	//      *             <code>checkLink</code> method doesn't allow
	//      *             loading of the specified dynamic library
	//      * @exception  UnsatisfiedLinkError if either the libname argument
	//      *             contains a file path, the native library is not statically
	//      *             linked with the VM,  or the library cannot be mapped to a
	//      *             native library image by the host system.
	//      * @exception  NullPointerException if <code>libname</code> is
	//      *             <code>null</code>
	//      * @see        java.lang.Runtime#loadLibrary(java.lang.String)
	//      * @see        java.lang.SecurityManager#checkLink(java.lang.String)
	@CallerSensitive
	public static func loadLibrary(_ libname: String!) {
		Runtime.getRuntime().loadLibrary0(Reflection.getCallerClass(), libname)
	}

	// *
	//      * Maps a library name into a platform-specific string representing
	//      * a native library.
	//      *
	//      * @param      libname the name of the library.
	//      * @return     a platform-dependent native library name.
	//      * @exception  NullPointerException if <code>libname</code> is
	//      *             <code>null</code>
	//      * @see        java.lang.System#loadLibrary(java.lang.String)
	//      * @see        java.lang.ClassLoader#findLibrary(java.lang.String)
	//      * @since      1.2
	public static __extern func mapLibraryName(_ libname: String!) -> String!

	// *
	//      * Create PrintStream for stdout/err based on encoding.
	private static func newPrintStream(_ fos: FileOutputStream!, _ enc: String!) -> PrintStream! {
		if enc != nil {
			__try {
				return PrintStream(BufferedOutputStream(fos, 128), true, enc)
			}
			__catch uee: UnsupportedEncodingException {
			}
		}
		return PrintStream(BufferedOutputStream(fos, 128), true)
	}

	// *
	//      * @hide internal use only
	public static func logE(_ message: String!) {
		log("E", message, nil)
	}

	// *
	//      * @hide internal use only
	public static func logE(_ message: String!, _ th: Throwable!) {
		log("E", message, th)
	}

	// *
	//      * @hide internal use only
	public static func logI(_ message: String!) {
		log("I", message, nil)
	}

	// *
	//      * @hide internal use only
	public static func logI(_ message: String!, _ th: Throwable!) {
		log("I", message, th)
	}

	// *
	//      * @hide internal use only
	public static func logW(_ message: String!) {
		log("W", message, nil)
	}

	// *
	//      * @hide internal use only
	public static func logW(_ message: String!, _ th: Throwable!) {
		log("W", message, th)
	}

	private static __extern func log(_ type: AnsiChar, _ message: String!, _ th: Throwable!)

	private init() {
		unchangeableProps = initUnchangeableSystemProperties()
		props = initProperties()
		addLegacyLocaleSystemProperties()
		sun.misc.Version.initSystemProperties()
		//  TODO: Confirm that this isn't something super important.
		//  sun.misc.VM.saveAndRemoveProperties(props);
		lineSeparator = props.getProperty("line.separator")
		var fdIn: FileInputStream! = FileInputStream(FileDescriptor.`in`)
		var fdOut: FileOutputStream! = FileOutputStream(FileDescriptor.out)
		var fdErr: FileOutputStream! = FileOutputStream(FileDescriptor.err)
		//  BEGIN Android-changed: lower buffer size.
		//  in = new BufferedInputStream(fdIn);
		`in` = BufferedInputStream(fdIn, 128)
		//  END Android-changed: lower buffer size.
		out = newPrintStream(fdOut, props.getProperty("sun.stdout.encoding"))
		err = newPrintStream(fdErr, props.getProperty("sun.stderr.encoding"))
		//  Initialize any miscellenous operating system settings that need to be
		//  set for the class libraries. Currently this is no-op everywhere except
		//  for Windows where the process-wide error mode is set before the java.io
		//  classes are used.
		sun.misc.VM.initializeOSEnvironment()
		//  Subsystems that are invoked during initialization can invoke
		//  sun.misc.VM.isBooted() in order to avoid doing things that should
		//  wait until the application class loader has been set up.
		//  IMPORTANT: Ensure that this remains the last initialization action!
		sun.misc.VM.booted()
	}

	internal final class PropertiesWithNonOverrideableDefaults : Properties { 
		internal init(_ defaults: Properties!) {
			super.init(defaults)
		}

		// @Override
		public func put(_ key: Object!, _ value: Object!) -> Object! {
			if defaults.containsKey(key) {
				logE("Ignoring attempt to set property \"" + key + "\" to value \"" + value + "\".")
				return defaults.`get`(key)
			}
			return super.put(key, value)
		}

		// @Override
		public func remove(_ key: Object!) -> Object! {
			if defaults.containsKey(key) {
				logE("Ignoring attempt to remove property \"" + key + "\".")
				return nil
			}
			return super.remove(key)
		}
	}
}

