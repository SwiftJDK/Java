

// import java.lang.ref
// import java.security
// import java.util
// import java.util.concurrent
// import java.util.concurrent.locks
// import sun.nio.ch
// import sun.reflect
// import dalvik.system
// import libcore.util

open class Thread : Runnable { 
	//  Android-removed: registerNatives() not used on Android.
	// 
	//     /* Make sure registerNatives is the first thing <clinit> does. *
	//     private static native void registerNatives();
	//     static {
	//         registerNatives();
	//     }
	//     
	//  BEGIN Android-added: Android specific fields, lock, nativePeer.
	// *
	//      * The synchronization object responsible for this thread's join/sleep/park operations.
	//      
	// 
	private let lock: Object! = Object()
	// *
	//      * Reference to the native thread object.
	//      *
	//      * <p>Is 0 if the native thread has not yet been created/started, or has been destroyed.
	//      
	// 
	private var nativePeer: Int64 = 0
	//  END Android-added: Android specific fields, lock, nativePeer, started.
	// 
	private var name: String!
	private var priority: Int32 = 0
	private var threadQ: Thread!
	private var eetop: Int64 = 0
	//  Whether or not to single_step this thread. 
	// 
	private var single_step: Bool = false
	//  Whether or not the thread is a daemon thread. 
	// 
	private var daemon: Bool = false
	//  JVM state 
	// 
	private var stillborn: Bool = false
	//  What will be run. 
	// 
	private var target: Runnable!
	//  The group of this thread 
	// 
	private var group: ThreadGroup!
	//  The context ClassLoader for this thread 
	// 
	private var contextClassLoader: ClassLoader!
	//  The inherited AccessControlContext of this thread 
	// 
	private var inheritedAccessControlContext: AccessControlContext!
	//  For autonumbering anonymous threads. 
	// 
	private static var threadInitNumber: Int32 = 0
	//  ThreadLocal values pertaining to this thread. This map is maintained
	//      * by the ThreadLocal class. 
	// 
	internal var threadLocals: ThreadLocal.ThreadLocalMap! = nil
	// 
	//      * InheritableThreadLocal values pertaining to this thread. This map is
	//      * maintained by the InheritableThreadLocal class.
	//      
	// 
	internal var inheritableThreadLocals: ThreadLocal.ThreadLocalMap! = nil
	// 
	//      * The requested stack size for this thread, or 0 if the creator did
	//      * not specify a stack size.  It is up to the VM to do whatever it
	//      * likes with this number; some VMs will ignore it.
	//      
	// 
	private var stackSize: Int64 = 0
	// 
	//      * JVM-private state that persists after native thread termination.
	//      
	// 
	private var nativeParkEventPointer: Int64 = 0
	// 
	//      * Thread ID
	//      
	// 
	private var tid: Int64 = 0
	//  For generating thread ID 
	// 
	private static var threadSeqNumber: Int64 = 0
	//  Java thread status for tools,
	//      * initialized to indicate thread 'not yet started'
	//      
	//  BEGIN Android-changed: Replace unused threadStatus field with started field.
	//  Upstream this is modified by the native code and read in the start() and getState() methods
	//  but in Android it is unused. The threadStatus is essentially an internal representation of
	//  the Thread.State enum. Android uses two sources for that information, the native thread
	//  state and the started field. The reason two sources are needed is because the native thread
	//  is created when the thread is started and destroyed when the thread is stopped. That means
	//  that the native thread state does not exist before the Thread has started (in State.NEW) or
	//  after it has been stopped (in State.TERMINATED). In that case (i.e. when the nativePeer = 0)
	//  the started field differentiates between the two states, i.e. if started = false then the
	//  thread is in State.NEW and if started = true then the thread is in State.TERMINATED.
	//  private volatile int threadStatus = 0;
	// *
	//      * True if the the Thread has been started, even it has since been stopped.
	//      
	// 
	internal var started: Bool = false
	// *
	//      * The argument supplied to the current call to
	//      * java.util.concurrent.locks.LockSupport.park.
	//      * Set by (private) java.util.concurrent.locks.LockSupport.setBlocker
	//      * Accessed using java.util.concurrent.locks.LockSupport.getBlocker
	//      
	// 
	internal var parkBlocker: Object!
	//  The object in which this thread is blocked in an interruptible I/O
	//      * operation, if any.  The blocker's interrupt method should be invoked
	//      * after setting this thread's interrupt status.
	//      
	// 
	private var blocker: Interruptible!
	private let blockerLock: Object! = Object()
	// *
	//      * The minimum priority that a thread can have.
	//      
	// 
	public let MIN_PRIORITY: Int32 = 1
	// *
	//      * The default priority that is assigned to a thread.
	//      
	// 
	public let NORM_PRIORITY: Int32 = 5
	// *
	//      * The maximum priority that a thread can have.
	//      
	// 
	public let MAX_PRIORITY: Int32 = 10
	private let EMPTY_STACK_TRACE: StackTraceElement![] = StackTraceElement[](count: 0)
	private let SUBCLASS_IMPLEMENTATION_PERMISSION: RuntimePermission! = RuntimePermission("enableContextClassLoaderOverride")
	//  null unless explicitly set
	// 
	private var uncaughtExceptionHandler: UncaughtExceptionHandler!
	//  null unless explicitly set
	// 
	private static var defaultUncaughtExceptionHandler: UncaughtExceptionHandler!
	//  BEGIN Android-added: uncaughtExceptionPreHandler for use by platform.
	//  See http://b/29624607 for background information.
	//  null unless explicitly set
	// 
	private static var uncaughtExceptionPreHandler: UncaughtExceptionHandler!
	//  The following three initially uninitialized fields are exclusively
	//  managed by class java.util.concurrent.ThreadLocalRandom. These
	//  fields are used to build the high-performance PRNGs in the
	//  concurrent code, and we can not risk accidental false sharing.
	//  Hence, the fields are isolated with @Contended.
	//  BEGIN Android-changed: @sun.misc.Contended is not supported on Android.
	// * The current seed for a ThreadLocalRandom 
	//  @sun.misc.Contended("tlr")
	// 
	internal var threadLocalRandomSeed: Int64 = 0
	// * Probe hash value; nonzero if threadLocalRandomSeed initialized 
	//  @sun.misc.Contended("tlr")
	// 
	internal var threadLocalRandomProbe: Int32 = 0
	// * Secondary seed isolated from public ThreadLocalRandom sequence 
	//   @sun.misc.Contended("tlr")
	// 
	internal var threadLocalRandomSecondarySeed: Int32 = 0
	private let NANOS_PER_MILLI: Int32 = 1000000
	// * the park state of the thread 
	// 
	private var parkState: Int32 = ParkState.UNPARKED

	private static func nextThreadNum() -> Int32 {
		return inc(threadInitNumber)
	}

	// END Android-changed: Replace unused threadStatus field with started field.
	private static func nextThreadID() -> Int64 {
		return inc(threadSeqNumber)
	}

	// * Set the blocker field
	//      * @hide
	//      
	//  Android-changed: Make blockedOn() @hide public, for internal use.
	//  Used by java.nio.channels.spi.AbstractInterruptibleChannel.
	open func blockedOn(_ b: Interruptible!) {
	}

	// *
	//      * Returns a reference to the currently executing thread object.
	//      *
	//      * @return  the currently executing thread.
	@FastNative
	public static __extern func currentThread() -> Thread!

	// *
	//      * A hint to the scheduler that the current thread is willing to yield
	//      * its current use of a processor. The scheduler is free to ignore this
	//      * hint.
	//      *
	//      * <p> Yield is a heuristic attempt to improve relative progression
	//      * between threads that would otherwise over-utilise a CPU. Its use
	//      * should be combined with detailed profiling and benchmarking to
	//      * ensure that it actually has the desired effect.
	//      *
	//      * <p> It is rarely appropriate to use this method. It may be useful
	//      * for debugging or testing purposes, where it may help to reproduce
	//      * bugs due to race conditions. It may also be useful when designing
	//      * concurrency control constructs such as the ones in the
	//      * {@link java.util.concurrent.locks} package.
	public static __extern func yield()

	// *
	//      * Causes the currently executing thread to sleep (temporarily cease
	//      * execution) for the specified number of milliseconds, subject to
	//      * the precision and accuracy of system timers and schedulers. The thread
	//      * does not lose ownership of any monitors.
	//      *
	//      * @param  millis
	//      *         the length of time to sleep in milliseconds
	//      *
	//      * @throws  IllegalArgumentException
	//      *          if the value of {@code millis} is negative
	//      *
	//      * @throws  InterruptedException
	//      *          if any thread has interrupted the current thread. The
	//      *          <i>interrupted status</i> of the current thread is
	//      *          cleared when this exception is thrown.
	//      
	//  BEGIN Android-changed: Implement sleep() methods using a shared native implementation.
	public static func sleep(_ millis: Int64) {
		sleep(millis, 0)
	}

	@FastNative
	private static __extern func sleep(_ lock: Object!, _ millis: Int64, _ nanos: Int32)

	// END Android-changed: Implement sleep() methods using a shared native implementation.
	// *
	//      * Causes the currently executing thread to sleep (temporarily cease
	//      * execution) for the specified number of milliseconds plus the specified
	//      * number of nanoseconds, subject to the precision and accuracy of system
	//      * timers and schedulers. The thread does not lose ownership of any
	//      * monitors.
	//      *
	//      * @param  millis
	//      *         the length of time to sleep in milliseconds
	//      *
	//      * @param  nanos
	//      *         {@code 0-999999} additional nanoseconds to sleep
	//      *
	//      * @throws  IllegalArgumentException
	//      *          if the value of {@code millis} is negative, or the value of
	//      *          {@code nanos} is not in the range {@code 0-999999}
	//      *
	//      * @throws  InterruptedException
	//      *          if any thread has interrupted the current thread. The
	//      *          <i>interrupted status</i> of the current thread is
	//      *          cleared when this exception is thrown.
	public static func sleep(_ millis: Int64, _ nanos: Int32) {
		//  BEGIN Android-changed: Improve exception messages.
		// 
		//         if (millis < 0) {
		//             throw new IllegalArgumentException("timeout value is negative");
		//         }
		// 
		//         if (nanos < 0 || nanos > 999999) {
		//             throw new IllegalArgumentException(
		//                                 "nanosecond timeout value out of range");
		//         }
		//         
		if millis < 0 {
			throw IllegalArgumentException("millis < 0: " + millis)
		}
		if nanos < 0 {
			throw IllegalArgumentException("nanos < 0: " + nanos)
		}
		if nanos > 999999 {
			throw IllegalArgumentException("nanos > 999999: " + nanos)
		}
		//  END Android-changed: Improve exception messages.
		//  BEGIN Android-changed: Implement sleep() methods using a shared native implementation.
		//  Attempt nanosecond rather than millisecond accuracy for sleep();
		//  RI code rounds to the nearest millisecond.
		// 
		//         if (nanos >= 500000 || (nanos != 0 && millis == 0)) {
		//             millis++;
		//         }
		// 
		//         sleep(millis);
		//         
		//  The JLS 3rd edition, section 17.9 says: "...sleep for zero
		//  time...need not have observable effects."
		if (millis == 0) & (nanos == 0) {
			//  ...but we still have to handle being interrupted.
			if Thread.interrupted() {
				throw InterruptedException()
			}
			return
		}
		var start: Int64 = System.nanoTime()
		var duration: Int64 = (millis * NANOS_PER_MILLI) + nanos
		var lock: Object! = currentThread().lock
		//  The native sleep(...) method actually performs a special type of wait, which may return
		//  early, so loop until sleep duration passes.
		//  END Android-changed: Implement sleep() methods using a shared native implementation.
	}

	// *
	//      * Initializes a Thread with the current AccessControlContext.
	//      * @see #init(ThreadGroup,Runnable,String,long,AccessControlContext)
	private func `init`(_ g: ThreadGroup!, _ target: Runnable!, _ name: String!, _ stackSize: Int64) {
		`init`(g, target, name, stackSize, nil)
	}

	// *
	//      * Initializes a Thread.
	//      *
	//      * @param g the Thread group
	//      * @param target the object whose run() method gets called
	//      * @param name the name of the new Thread
	//      * @param stackSize the desired stack size for the new thread, or
	//      *        zero to indicate that this parameter is to be ignored.
	//      * @param acc the AccessControlContext to inherit, or
	//      *            AccessController.getContext() if null
	private func `init`(_ g: ThreadGroup!, _ target: Runnable!, _ name: String!, _ stackSize: Int64, _ acc: AccessControlContext!) {
		if name == nil {
			throw NullPointerException("name cannot be null")
		}
		self.name = name
		var parent: Thread! = currentThread()
		//  Android-removed: SecurityManager stubbed out on Android
		//  SecurityManager security = System.getSecurityManager();
		if g == nil {
			//  Android-changed: SecurityManager stubbed out on Android
			// 
			//             /* Determine if it's an applet or not *
			// 
			//             /* If there is a security manager, ask the security manager
			//                what to do. *
			//             if (security != null) {
			//                 g = security.getThreadGroup();
			//             }
			// 
			//             /* If the security doesn't have a strong opinion of the matter
			//                use the parent thread group. *
			//             if (g == null) {
			//             
			g = parent.getThreadGroup()
			//  }
		}
		//  Android-removed: SecurityManager stubbed out on Android
		// 
		//         /* checkAccess regardless of whether or not threadgroup is
		//            explicitly passed in. *
		//         g.checkAccess();
		// 
		//         /*
		//          * Do we have the required permissions?
		//          *
		//         if (security != null) {
		//             if (isCCLOverridden(getClass())) {
		//                 security.checkPermission(SUBCLASS_IMPLEMENTATION_PERMISSION);
		//             }
		//         }
		//         
		g.addUnstarted()
		self.group = g
		self.daemon = parent.isDaemon()
		self.priority = parent.getPriority()
		//  Android-changed: Moved into init2(Thread) helper method.
		// 
		//         if (security == null || isCCLOverridden(parent.getClass()))
		//             this.contextClassLoader = parent.getContextClassLoader();
		//         else
		//             this.contextClassLoader = parent.contextClassLoader;
		//         this.inheritedAccessControlContext =
		//                 acc != null ? acc : AccessController.getContext();
		//         
		self.target = target
		//  Android-removed: The priority parameter is unchecked on Android.
		//  It is unclear why this is not being done (b/80180276).
		//  setPriority(priority);
		//  Android-changed: Moved into init2(Thread) helper method.
		//  if (parent.inheritableThreadLocals != null)
		//      this.inheritableThreadLocals =
		//          ThreadLocal.createInheritedMap(parent.inheritableThreadLocals);
		init2(parent)
		//  Stash the specified stack size in case the VM cares 
		self.stackSize = stackSize
		//  Set thread ID 
		tid = nextThreadID()
	}

	// *
	//      * Throws CloneNotSupportedException as a Thread can not be meaningfully
	//      * cloned. Construct a new Thread instead.
	//      *
	//      * @throws  CloneNotSupportedException
	//      *          always
	// @Override
	public func clone() -> Object! {
		throw CloneNotSupportedException()
	}

	// *
	//      * Allocates a new {@code Thread} object. This constructor has the same
	//      * effect as {@linkplain #Thread(ThreadGroup,Runnable,String) Thread}
	//      * {@code (null, null, gname)}, where {@code gname} is a newly generated
	//      * name. Automatically generated names are of the form
	//      * {@code "Thread-"+}<i>n</i>, where <i>n</i> is an integer.
	public init() {
		`init`(nil, nil, "Thread-" + nextThreadNum(), 0)
	}

	// *
	//      * Allocates a new {@code Thread} object. This constructor has the same
	//      * effect as {@linkplain #Thread(ThreadGroup,Runnable,String) Thread}
	//      * {@code (null, target, gname)}, where {@code gname} is a newly generated
	//      * name. Automatically generated names are of the form
	//      * {@code "Thread-"+}<i>n</i>, where <i>n</i> is an integer.
	//      *
	//      * @param  target
	//      *         the object whose {@code run} method is invoked when this thread
	//      *         is started. If {@code null}, this classes {@code run} method does
	//      *         nothing.
	public init(_ target: Runnable!) {
		`init`(nil, target, "Thread-" + nextThreadNum(), 0)
	}

	// *
	//      * Creates a new Thread that inherits the given AccessControlContext.
	//      * This is not a public constructor.
	internal init(_ target: Runnable!, _ acc: AccessControlContext!) {
		`init`(nil, target, "Thread-" + nextThreadNum(), 0, acc)
	}

	// *
	//      * Allocates a new {@code Thread} object. This constructor has the same
	//      * effect as {@linkplain #Thread(ThreadGroup,Runnable,String) Thread}
	//      * {@code (group, target, gname)} ,where {@code gname} is a newly generated
	//      * name. Automatically generated names are of the form
	//      * {@code "Thread-"+}<i>n</i>, where <i>n</i> is an integer.
	//      *
	//      * @param  group
	//      *         the thread group. If {@code null} and there is a security
	//      *         manager, the group is determined by {@linkplain
	//      *         SecurityManager#getThreadGroup SecurityManager.getThreadGroup()}.
	//      *         If there is not a security manager or {@code
	//      *         SecurityManager.getThreadGroup()} returns {@code null}, the group
	//      *         is set to the current thread's thread group.
	//      *
	//      * @param  target
	//      *         the object whose {@code run} method is invoked when this thread
	//      *         is started. If {@code null}, this thread's run method is invoked.
	//      *
	//      * @throws  SecurityException
	//      *          if the current thread cannot create a thread in the specified
	//      *          thread group
	public init(_ group: ThreadGroup!, _ target: Runnable!) {
		`init`(group, target, "Thread-" + nextThreadNum(), 0)
	}

	// *
	//      * Allocates a new {@code Thread} object. This constructor has the same
	//      * effect as {@linkplain #Thread(ThreadGroup,Runnable,String) Thread}
	//      * {@code (null, null, name)}.
	//      *
	//      * @param   name
	//      *          the name of the new thread
	public init(_ name: String!) {
		`init`(nil, nil, name, 0)
	}

	// *
	//      * Allocates a new {@code Thread} object. This constructor has the same
	//      * effect as {@linkplain #Thread(ThreadGroup,Runnable,String) Thread}
	//      * {@code (group, null, name)}.
	//      *
	//      * @param  group
	//      *         the thread group. If {@code null} and there is a security
	//      *         manager, the group is determined by {@linkplain
	//      *         SecurityManager#getThreadGroup SecurityManager.getThreadGroup()}.
	//      *         If there is not a security manager or {@code
	//      *         SecurityManager.getThreadGroup()} returns {@code null}, the group
	//      *         is set to the current thread's thread group.
	//      *
	//      * @param  name
	//      *         the name of the new thread
	//      *
	//      * @throws  SecurityException
	//      *          if the current thread cannot create a thread in the specified
	//      *          thread group
	public init(_ group: ThreadGroup!, _ name: String!) {
		`init`(group, nil, name, 0)
	}

	// * @hide 
	//  Android-added: Private constructor - used by the runtime.
	internal init(_ group: ThreadGroup!, _ name: String!, _ priority: Int32, _ daemon: Bool) {
		self.group = group
		self.group.addUnstarted()
		//  Must be tolerant of threads without a name.
		if name == nil {
			name = "Thread-" + nextThreadNum()
		}
		//  NOTE: Resist the temptation to call setName() here. This constructor is only called
		//  by the runtime to construct peers for threads that have attached via JNI and it's
		//  undesirable to clobber their natively set name.
		self.name = name
		self.priority = priority
		self.daemon = daemon
		init2(currentThread())
		tid = nextThreadID()
	}

	// Android-added: Helper method for previous constructor and init(...) method.
	private func init2(_ parent: Thread!) {
		self.contextClassLoader = parent.getContextClassLoader()
		self.inheritedAccessControlContext = AccessController.getContext()
		if parent.inheritableThreadLocals != nil {
			self.inheritableThreadLocals = ThreadLocal.createInheritedMap(parent.inheritableThreadLocals)
		}
	}

	// *
	//      * Allocates a new {@code Thread} object. This constructor has the same
	//      * effect as {@linkplain #Thread(ThreadGroup,Runnable,String) Thread}
	//      * {@code (null, target, name)}.
	//      *
	//      * @param  target
	//      *         the object whose {@code run} method is invoked when this thread
	//      *         is started. If {@code null}, this thread's run method is invoked.
	//      *
	//      * @param  name
	//      *         the name of the new thread
	public init(_ target: Runnable!, _ name: String!) {
		`init`(nil, target, name, 0)
	}

	// *
	//      * Allocates a new {@code Thread} object so that it has {@code target}
	//      * as its run object, has the specified {@code name} as its name,
	//      * and belongs to the thread group referred to by {@code group}.
	//      *
	//      * <p>If there is a security manager, its
	//      * {@link SecurityManager#checkAccess(ThreadGroup) checkAccess}
	//      * method is invoked with the ThreadGroup as its argument.
	//      *
	//      * <p>In addition, its {@code checkPermission} method is invoked with
	//      * the {@code RuntimePermission("enableContextClassLoaderOverride")}
	//      * permission when invoked directly or indirectly by the constructor
	//      * of a subclass which overrides the {@code getContextClassLoader}
	//      * or {@code setContextClassLoader} methods.
	//      *
	//      * <p>The priority of the newly created thread is set equal to the
	//      * priority of the thread creating it, that is, the currently running
	//      * thread. The method {@linkplain #setPriority setPriority} may be
	//      * used to change the priority to a new value.
	//      *
	//      * <p>The newly created thread is initially marked as being a daemon
	//      * thread if and only if the thread creating it is currently marked
	//      * as a daemon thread. The method {@linkplain #setDaemon setDaemon}
	//      * may be used to change whether or not a thread is a daemon.
	//      *
	//      * @param  group
	//      *         the thread group. If {@code null} and there is a security
	//      *         manager, the group is determined by {@linkplain
	//      *         SecurityManager#getThreadGroup SecurityManager.getThreadGroup()}.
	//      *         If there is not a security manager or {@code
	//      *         SecurityManager.getThreadGroup()} returns {@code null}, the group
	//      *         is set to the current thread's thread group.
	//      *
	//      * @param  target
	//      *         the object whose {@code run} method is invoked when this thread
	//      *         is started. If {@code null}, this thread's run method is invoked.
	//      *
	//      * @param  name
	//      *         the name of the new thread
	//      *
	//      * @throws  SecurityException
	//      *          if the current thread cannot create a thread in the specified
	//      *          thread group or cannot override the context class loader methods.
	public init(_ group: ThreadGroup!, _ target: Runnable!, _ name: String!) {
		`init`(group, target, name, 0)
	}

	// *
	//      * Allocates a new {@code Thread} object so that it has {@code target}
	//      * as its run object, has the specified {@code name} as its name,
	//      * and belongs to the thread group referred to by {@code group}, and has
	//      * the specified <i>stack size</i>.
	//      *
	//      * <p>This constructor is identical to {@link
	//      * #Thread(ThreadGroup,Runnable,String)} with the exception of the fact
	//      * that it allows the thread stack size to be specified.  The stack size
	//      * is the approximate number of bytes of address space that the virtual
	//      * machine is to allocate for this thread's stack.  <b>The effect of the
	//      * {@code stackSize} parameter, if any, is highly platform dependent.</b>
	//      *
	//      * <p>On some platforms, specifying a higher value for the
	//      * {@code stackSize} parameter may allow a thread to achieve greater
	//      * recursion depth before throwing a {@link StackOverflowError}.
	//      * Similarly, specifying a lower value may allow a greater number of
	//      * threads to exist concurrently without throwing an {@link
	//      * OutOfMemoryError} (or other internal error).  The details of
	//      * the relationship between the value of the <tt>stackSize</tt> parameter
	//      * and the maximum recursion depth and concurrency level are
	//      * platform-dependent.  <b>On some platforms, the value of the
	//      * {@code stackSize} parameter may have no effect whatsoever.</b>
	//      *
	//      * <p>The virtual machine is free to treat the {@code stackSize}
	//      * parameter as a suggestion.  If the specified value is unreasonably low
	//      * for the platform, the virtual machine may instead use some
	//      * platform-specific minimum value; if the specified value is unreasonably
	//      * high, the virtual machine may instead use some platform-specific
	//      * maximum.  Likewise, the virtual machine is free to round the specified
	//      * value up or down as it sees fit (or to ignore it completely).
	//      *
	//      * <p>Specifying a value of zero for the {@code stackSize} parameter will
	//      * cause this constructor to behave exactly like the
	//      * {@code Thread(ThreadGroup, Runnable, String)} constructor.
	//      *
	//      * <p><i>Due to the platform-dependent nature of the behavior of this
	//      * constructor, extreme care should be exercised in its use.
	//      * The thread stack size necessary to perform a given computation will
	//      * likely vary from one JRE implementation to another.  In light of this
	//      * variation, careful tuning of the stack size parameter may be required,
	//      * and the tuning may need to be repeated for each JRE implementation on
	//      * which an application is to run.</i>
	//      *
	//      * <p>Implementation note: Java platform implementers are encouraged to
	//      * document their implementation's behavior with respect to the
	//      * {@code stackSize} parameter.
	//      *
	//      *
	//      * @param  group
	//      *         the thread group. If {@code null} and there is a security
	//      *         manager, the group is determined by {@linkplain
	//      *         SecurityManager#getThreadGroup SecurityManager.getThreadGroup()}.
	//      *         If there is not a security manager or {@code
	//      *         SecurityManager.getThreadGroup()} returns {@code null}, the group
	//      *         is set to the current thread's thread group.
	//      *
	//      * @param  target
	//      *         the object whose {@code run} method is invoked when this thread
	//      *         is started. If {@code null}, this thread's run method is invoked.
	//      *
	//      * @param  name
	//      *         the name of the new thread
	//      *
	//      * @param  stackSize
	//      *         the desired stack size for the new thread, or zero to indicate
	//      *         that this parameter is to be ignored.
	//      *
	//      * @throws  SecurityException
	//      *          if the current thread cannot create a thread in the specified
	//      *          thread group
	//      *
	//      * @since 1.4
	public init(_ group: ThreadGroup!, _ target: Runnable!, _ name: String!, _ stackSize: Int64) {
		`init`(group, target, name, stackSize)
	}

	// *
	//      * Causes this thread to begin execution; the Java Virtual Machine
	//      * calls the <code>run</code> method of this thread.
	//      * <p>
	//      * The result is that two threads are running concurrently: the
	//      * current thread (which returns from the call to the
	//      * <code>start</code> method) and the other thread (which executes its
	//      * <code>run</code> method).
	//      * <p>
	//      * It is never legal to start a thread more than once.
	//      * In particular, a thread may not be restarted once it has completed
	//      * execution.
	//      *
	//      * @exception  IllegalThreadStateException  if the thread was already
	//      *               started.
	//      * @see        #run()
	//      * @see        #stop()
	open func start() {
		// *
		//          * This method is not invoked for the main method thread or "system"
		//          * group threads created/set up by the VM. Any new functionality added
		//          * to this method in the future may have to also be added to the VM.
		//          *
		//          * A zero status value corresponds to state "NEW".
		//          
		//  Android-changed: Replace unused threadStatus field with started field.
		//  The threadStatus field is unused on Android.
		if started {
			throw IllegalThreadStateException()
		}
		//  Notify the group that this thread is about to be started
		//          * so that it can be added to the group's list of threads
		//          * and the group's unstarted count can be decremented. 
		group.add(self)
		//  Android-changed: Use field instead of local variable.
		//  It is necessary to remember the state of this across calls to this method so that it
		//  can throw an IllegalThreadStateException if this method is called on an already
		//  started thread.
		started = false
		__try {
			//  Android-changed: Use Android specific nativeCreate() method to create/start thread.
			//  start0();
			nativeCreate(self, stackSize, daemon)
			started = true
		}
		__finally {
			__try {
				if !started {
					group.threadStartFailed(self)
				}
			}
			__catch ignore: Throwable {
			}
		}
	}

	// Android-changed: Use Android specific nativeCreate() method to create/start thread.
	//  The upstream native method start0() only takes a reference to this object and so must obtain
	//  the stack size and daemon status directly from the field whereas Android supplies the values
	//  explicitly on the method call.
	//  private native void start0();
	private static __extern func nativeCreate(_ t: Thread!, _ stackSize: Int64, _ daemon: Bool)

	// *
	//      * If this thread was constructed using a separate
	//      * <code>Runnable</code> run object, then that
	//      * <code>Runnable</code> object's <code>run</code> method is called;
	//      * otherwise, this method does nothing and returns.
	//      * <p>
	//      * Subclasses of <code>Thread</code> should override this method.
	//      *
	//      * @see     #start()
	//      * @see     #stop()
	//      * @see     #Thread(ThreadGroup, Runnable, String)
	// @Override
	public func run() {
		if target != nil {
			target.run()
		}
	}

	// *
	//      * This method is called by the system to give a Thread
	//      * a chance to clean up before it actually exits.
	private func exit() {
		if group != nil {
			group.threadTerminated(self)
			group = nil
		}
		//  Aggressively null out all reference fields: see bug 4006245 
		target = nil
		//  Speed the release of some of these resources 
		threadLocals = nil
		inheritableThreadLocals = nil
		inheritedAccessControlContext = nil
		blocker = nil
		uncaughtExceptionHandler = nil
	}

	// Android-changed: Throws UnsupportedOperationException.
	// *
	//      * Throws {@code UnsupportedOperationException}.
	//      *
	//      * @deprecated This method was originally designed to force a thread to stop
	//      *       and throw a {@code ThreadDeath} as an exception. It was inherently unsafe.
	//      *       Stopping a thread with
	//      *       Thread.stop causes it to unlock all of the monitors that it
	//      *       has locked (as a natural consequence of the unchecked
	//      *       <code>ThreadDeath</code> exception propagating up the stack).  If
	//      *       any of the objects previously protected by these monitors were in
	//      *       an inconsistent state, the damaged objects become visible to
	//      *       other threads, potentially resulting in arbitrary behavior.  Many
	//      *       uses of <code>stop</code> should be replaced by code that simply
	//      *       modifies some variable to indicate that the target thread should
	//      *       stop running.  The target thread should check this variable
	//      *       regularly, and return from its run method in an orderly fashion
	//      *       if the variable indicates that it is to stop running.  If the
	//      *       target thread waits for long periods (on a condition variable,
	//      *       for example), the <code>interrupt</code> method should be used to
	//      *       interrupt the wait.
	//      *       For more information, see
	//      *       <a href="{@docRoot}openjdk-redirect.html?v=8&path=/technotes/guides/concurrency/threadPrimitiveDeprecation.html">Why
	//      *       are Thread.stop, Thread.suspend and Thread.resume Deprecated?</a>.
	@Deprecated
	public func stop() {
		// 
		//         SecurityManager security = System.getSecurityManager();
		//         if (security != null) {
		//             checkAccess();
		//             if (this != Thread.currentThread()) {
		//                 security.checkPermission(SecurityConstants.STOP_THREAD_PERMISSION);
		//             }
		//         }
		//         // A zero status value corresponds to "NEW", it can't change to
		//         // not-NEW because we hold the lock.
		//         if (threadStatus != 0) {
		//             resume(); // Wake up thread if it was suspended; no-op otherwise
		//         }
		// 
		//         // The VM can handle all thread states
		//         stop0(new ThreadDeath());
		//         
		throw UnsupportedOperationException()
	}

	// *
	//      * Throws {@code UnsupportedOperationException}.
	//      *
	//      * @param obj ignored
	//      *
	//      * @deprecated This method was originally designed to force a thread to stop
	//      *        and throw a given {@code Throwable} as an exception. It was
	//      *        inherently unsafe (see {@link #stop()} for details), and furthermore
	//      *        could be used to generate exceptions that the target thread was
	//      *        not prepared to handle.
	//      *        For more information, see
	//      *        <a href="{@docRoot}openjdk-redirect.html?v=8&path=/technotes/guides/concurrency/threadPrimitiveDeprecation.html">Why
	//      *        are Thread.stop, Thread.suspend and Thread.resume Deprecated?</a>.
	@Deprecated
	public func stop(_ obj: Throwable!) {
		throw UnsupportedOperationException()
	}

	// *
	//      * Interrupts this thread.
	//      *
	//      * <p> Unless the current thread is interrupting itself, which is
	//      * always permitted, the {@link #checkAccess() checkAccess} method
	//      * of this thread is invoked, which may cause a {@link
	//      * SecurityException} to be thrown.
	//      *
	//      * <p> If this thread is blocked in an invocation of the {@link
	//      * Object#wait() wait()}, {@link Object#wait(long) wait(long)}, or {@link
	//      * Object#wait(long, int) wait(long, int)} methods of the {@link Object}
	//      * class, or of the {@link #join()}, {@link #join(long)}, {@link
	//      * #join(long, int)}, {@link #sleep(long)}, or {@link #sleep(long, int)},
	//      * methods of this class, then its interrupt status will be cleared and it
	//      * will receive an {@link InterruptedException}.
	//      *
	//      * <p> If this thread is blocked in an I/O operation upon an {@link
	//      * java.nio.channels.InterruptibleChannel InterruptibleChannel}
	//      * then the channel will be closed, the thread's interrupt
	//      * status will be set, and the thread will receive a {@link
	//      * java.nio.channels.ClosedByInterruptException}.
	//      *
	//      * <p> If this thread is blocked in a {@link java.nio.channels.Selector}
	//      * then the thread's interrupt status will be set and it will return
	//      * immediately from the selection operation, possibly with a non-zero
	//      * value, just as if the selector's {@link
	//      * java.nio.channels.Selector#wakeup wakeup} method were invoked.
	//      *
	//      * <p> If none of the previous conditions hold then this thread's interrupt
	//      * status will be set. </p>
	//      *
	//      * <p> Interrupting a thread that is not alive need not have any effect.
	//      *
	//      * @throws  SecurityException
	//      *          if the current thread cannot modify this thread
	//      *
	//      * @revised 6.0
	//      * @spec JSR-51
	open func interrupt() {
		if self != Thread.currentThread() {
			checkAccess()
		}
		interrupt0()
	}

	// *
	//      * Tests whether the current thread has been interrupted.  The
	//      * <i>interrupted status</i> of the thread is cleared by this method.  In
	//      * other words, if this method were to be called twice in succession, the
	//      * second call would return false (unless the current thread were
	//      * interrupted again, after the first call had cleared its interrupted
	//      * status and before the second call had examined it).
	//      *
	//      * <p>A thread interruption ignored because a thread was not alive
	//      * at the time of the interrupt will be reflected by this method
	//      * returning false.
	//      *
	//      * @return  <code>true</code> if the current thread has been interrupted;
	//      *          <code>false</code> otherwise.
	//      * @see #isInterrupted()
	//      * @revised 6.0
	//      
	//  Android-changed: Use native interrupted()/isInterrupted() methods.
	//  Upstream has one native method for both these methods that takes a boolean parameter that
	//  determines whether the interrupted status of the thread should be cleared after reading
	//  it. While that approach does allow code reuse it is less efficient/more complex than having
	//  a native implementation of each method because:
	//  * The pure Java interrupted() method requires two native calls, one to get the current
	//    thread and one to get its interrupted status.
	//  * Updating the interrupted flag is more complex than simply reading it. Knowing that only
	//    the current thread can clear the interrupted status makes the code simpler as it does not
	//    need to be concerned about multiple threads trying to clear the status simultaneously.
	//  public static boolean interrupted() {
	//      return currentThread().isInterrupted(true);
	//  }
	@FastNative
	public static __extern func interrupted() -> Bool

	// *
	//      * Tests whether this thread has been interrupted.  The <i>interrupted
	//      * status</i> of the thread is unaffected by this method.
	//      *
	//      * <p>A thread interruption ignored because a thread was not alive
	//      * at the time of the interrupt will be reflected by this method
	//      * returning false.
	//      *
	//      * @return  <code>true</code> if this thread has been interrupted;
	//      *          <code>false</code> otherwise.
	//      * @see     #interrupted()
	//      * @revised 6.0
	//      
	//  Android-changed: Use native interrupted()/isInterrupted() methods.
	//  public boolean isInterrupted() {
	//      return isInterrupted(false);
	//  }
	@FastNative
	open __extern func isInterrupted() -> Bool

	// Android-removed: Use native interrupted()/isInterrupted() methods.
	// 
	//     /**
	//      * Tests if some Thread has been interrupted.  The interrupted state
	//      * is reset or not based on the value of ClearInterrupted that is
	//      * passed.
	//      *
	//     private native boolean isInterrupted(boolean ClearInterrupted);
	//     
	//  Android-changed: Throw UnsupportedOperationException instead of NoSuchMethodError.
	// *
	//      * Throws {@link UnsupportedOperationException}.
	//      *
	//      * @deprecated This method was originally designed to destroy this
	//      *     thread without any cleanup. Any monitors it held would have
	//      *     remained locked. However, the method was never implemented.
	//      *     If if were to be implemented, it would be deadlock-prone in
	//      *     much the manner of {@link #suspend}. If the target thread held
	//      *     a lock protecting a critical system resource when it was
	//      *     destroyed, no thread could ever access this resource again.
	//      *     If another thread ever attempted to lock this resource, deadlock
	//      *     would result. Such deadlocks typically manifest themselves as
	//      *     "frozen" processes. For more information, see
	//      *     <a href="{@docRoot}openjdk-redirect.html?v=8&path=/technotes/guides/concurrency/threadPrimitiveDeprecation.html">
	//      *     Why are Thread.stop, Thread.suspend and Thread.resume Deprecated?</a>.
	//      * @throws UnsupportedOperationException always
	@Deprecated
	open func destroy() {
		throw UnsupportedOperationException()
	}

	// *
	//      * Tests if this thread is alive. A thread is alive if it has
	//      * been started and has not yet died.
	//      *
	//      * @return  <code>true</code> if this thread is alive;
	//      *          <code>false</code> otherwise.
	//      
	//  Android-changed: Provide pure Java implementation of isAlive().
	public func isAlive() -> Bool {
		return nativePeer != 0
	}

	// Android-changed: Updated JavaDoc as it always throws an UnsupportedOperationException.
	// *
	//      * Throws {@link UnsupportedOperationException}.
	//      *
	//      * @deprecated   This method was designed to suspend the Thread but it was
	//      *   inherently deadlock-prone.  If the target thread holds a lock on the
	//      *   monitor protecting a critical system resource when it is suspended, no
	//      *   thread can access this resource until the target thread is resumed. If
	//      *   the thread that would resume the target thread attempts to lock this
	//      *   monitor prior to calling <code>resume</code>, deadlock results.  Such
	//      *   deadlocks typically manifest themselves as "frozen" processes.
	//      *   For more information, see
	//      *   <a href="{@docRoot}openjdk-redirect.html?v=8&path=/technotes/guides/concurrency/threadPrimitiveDeprecation.html">Why
	//      *   are Thread.stop, Thread.suspend and Thread.resume Deprecated?</a>.
	//      * @throws UnsupportedOperationException always
	@Deprecated
	public func suspend() {
		//  Android-changed: Unsupported on Android.
		//  checkAccess();
		//  suspend0();
		throw UnsupportedOperationException()
	}

	// Android-changed: Updated JavaDoc as it always throws an UnsupportedOperationException.
	// *
	//      * Throws {@link UnsupportedOperationException}.
	//      *
	//      * @deprecated This method exists solely for use with {@link #suspend},
	//      *     which has been deprecated because it is deadlock-prone.
	//      *     For more information, see
	//      *     <a href="{@docRoot}openjdk-redirect.html?v=8&path=/technotes/guides/concurrency/threadPrimitiveDeprecation.html">Why
	//      *     are Thread.stop, Thread.suspend and Thread.resume Deprecated?</a>.
	//      * @throws UnsupportedOperationException always
	@Deprecated
	public func resume() {
		//  Android-changed: Unsupported on Android.
		//  checkAccess();
		//  resume0();
		throw UnsupportedOperationException()
	}

	// *
	//      * Changes the priority of this thread.
	//      * <p>
	//      * First the <code>checkAccess</code> method of this thread is called
	//      * with no arguments. This may result in throwing a
	//      * <code>SecurityException</code>.
	//      * <p>
	//      * Otherwise, the priority of this thread is set to the smaller of
	//      * the specified <code>newPriority</code> and the maximum permitted
	//      * priority of the thread's thread group.
	//      *
	//      * @param newPriority priority to set this thread to
	//      * @exception  IllegalArgumentException  If the priority is not in the
	//      *               range <code>MIN_PRIORITY</code> to
	//      *               <code>MAX_PRIORITY</code>.
	//      * @exception  SecurityException  if the current thread cannot modify
	//      *               this thread.
	//      * @see        #getPriority
	//      * @see        #checkAccess()
	//      * @see        #getThreadGroup()
	//      * @see        #MAX_PRIORITY
	//      * @see        #MIN_PRIORITY
	//      * @see        ThreadGroup#getMaxPriority()
	public func setPriority(_ newPriority: Int32) {
		var g: ThreadGroup!
		checkAccess()
		if (newPriority > MAX_PRIORITY) | (newPriority < MIN_PRIORITY) {
			//  Android-changed: Improve exception message when the new priority is out of bounds.
			throw IllegalArgumentException("Priority out of range: " + newPriority)
		}
		if g = getThreadGroup() != nil {
			if newPriority > g.getMaxPriority() {
				newPriority = g.getMaxPriority()
			}
			//  Android-changed: Avoid native call if Thread is not yet started.
			//  setPriority0(priority = newPriority);
		}
	}

	// *
	//      * Returns this thread's priority.
	//      *
	//      * @return  this thread's priority.
	//      * @see     #setPriority
	public func getPriority() -> Int32 {
		return priority
	}

	// *
	//      * Changes the name of this thread to be equal to the argument
	//      * <code>name</code>.
	//      * <p>
	//      * First the <code>checkAccess</code> method of this thread is called
	//      * with no arguments. This may result in throwing a
	//      * <code>SecurityException</code>.
	//      *
	//      * @param      name   the new name for this thread.
	//      * @exception  SecurityException  if the current thread cannot modify this
	//      *               thread.
	//      * @see        #getName
	//      * @see        #checkAccess()
	public func setName(_ name: String!) {
		checkAccess()
		if name == nil {
			throw NullPointerException("name cannot be null")
		}
		self.name = name
		//  Android-changed: Use isAlive() not threadStatus to check whether Thread has started.
		//  The threadStatus field is not used in Android.
		//  if (threadStatus != 0) {
		if isAlive() {
			setNativeName(name)
		}
	}

	// *
	//      * Returns this thread's name.
	//      *
	//      * @return  this thread's name.
	//      * @see     #setName(String)
	public func getName() -> String! {
		return name
	}

	// *
	//      * Returns the thread group to which this thread belongs.
	//      * This method returns null if this thread has died
	//      * (been stopped).
	//      *
	//      * @return  this thread's thread group.
	public func getThreadGroup() -> ThreadGroup! {
		//  BEGIN Android-added: Work around exit() not being called.
		//  Android runtime does not call exit() when a Thread exits so the group field is not
		//  set to null so it needs to pretend as if it did. If we are not going to call exit()
		//  then this should probably just check isAlive() here rather than getState() as the
		//  latter requires a native call.
		if getState() == Thread.State.TERMINATED {
			return nil
		}
		//  END Android-added: Work around exit() not being called.
		return group
	}

	// *
	//      * Returns an estimate of the number of active threads in the current
	//      * thread's {@linkplain java.lang.ThreadGroup thread group} and its
	//      * subgroups. Recursively iterates over all subgroups in the current
	//      * thread's thread group.
	//      *
	//      * <p> The value returned is only an estimate because the number of
	//      * threads may change dynamically while this method traverses internal
	//      * data structures, and might be affected by the presence of certain
	//      * system threads. This method is intended primarily for debugging
	//      * and monitoring purposes.
	//      *
	//      * @return  an estimate of the number of active threads in the current
	//      *          thread's thread group and in any other thread group that
	//      *          has the current thread's thread group as an ancestor
	public static func activeCount() -> Int32 {
		return currentThread().getThreadGroup().activeCount()
	}

	// *
	//      * Copies into the specified array every active thread in the current
	//      * thread's thread group and its subgroups. This method simply
	//      * invokes the {@link java.lang.ThreadGroup#enumerate(Thread[])}
	//      * method of the current thread's thread group.
	//      *
	//      * <p> An application might use the {@linkplain #activeCount activeCount}
	//      * method to get an estimate of how big the array should be, however
	//      * <i>if the array is too short to hold all the threads, the extra threads
	//      * are silently ignored.</i>  If it is critical to obtain every active
	//      * thread in the current thread's thread group and its subgroups, the
	//      * invoker should verify that the returned int value is strictly less
	//      * than the length of {@code tarray}.
	//      *
	//      * <p> Due to the inherent race condition in this method, it is recommended
	//      * that the method only be used for debugging and monitoring purposes.
	//      *
	//      * @param  tarray
	//      *         an array into which to put the list of threads
	//      *
	//      * @return  the number of threads put into the array
	//      *
	//      * @throws  SecurityException
	//      *          if {@link java.lang.ThreadGroup#checkAccess} determines that
	//      *          the current thread cannot access its thread group
	public static func enumerate(_ tarray: Thread![]) -> Int32 {
		return currentThread().getThreadGroup().enumerate(tarray)
	}

	// *
	//      * Counts the number of stack frames in this thread. The thread must
	//      * be suspended.
	//      *
	//      * @return     the number of stack frames in this thread.
	//      * @exception  IllegalThreadStateException  if this thread is not
	//      *             suspended.
	//      * @deprecated The definition of this call depends on {@link #suspend},
	//      *             which is deprecated.  Further, the results of this call
	//      *             were never well-defined.
	@Deprecated // Android-changed: Provide non-native implementation of countStackFrames().
 public native int countStackFrames();
	open func countStackFrames() -> Int32 {
		return getStackTrace().length
	}

	// *
	//      * Waits at most {@code millis} milliseconds for this thread to
	//      * die. A timeout of {@code 0} means to wait forever.
	//      *
	//      * <p> This implementation uses a loop of {@code this.wait} calls
	//      * conditioned on {@code this.isAlive}. As a thread terminates the
	//      * {@code this.notifyAll} method is invoked. It is recommended that
	//      * applications not use {@code wait}, {@code notify}, or
	//      * {@code notifyAll} on {@code Thread} instances.
	//      *
	//      * @param  millis
	//      *         the time to wait in milliseconds
	//      *
	//      * @throws  IllegalArgumentException
	//      *          if the value of {@code millis} is negative
	//      *
	//      * @throws  InterruptedException
	//      *          if any thread has interrupted the current thread. The
	//      *          <i>interrupted status</i> of the current thread is
	//      *          cleared when this exception is thrown.
	//      
	//  BEGIN Android-changed: Synchronize on separate lock object not this Thread.
	//  public final synchronized void join(long millis)
	public func join(_ millis: Int64) {
	}

	// END Android-changed: Synchronize on separate lock object not this Thread.
	// *
	//      * Waits at most {@code millis} milliseconds plus
	//      * {@code nanos} nanoseconds for this thread to die.
	//      *
	//      * <p> This implementation uses a loop of {@code this.wait} calls
	//      * conditioned on {@code this.isAlive}. As a thread terminates the
	//      * {@code this.notifyAll} method is invoked. It is recommended that
	//      * applications not use {@code wait}, {@code notify}, or
	//      * {@code notifyAll} on {@code Thread} instances.
	//      *
	//      * @param  millis
	//      *         the time to wait in milliseconds
	//      *
	//      * @param  nanos
	//      *         {@code 0-999999} additional nanoseconds to wait
	//      *
	//      * @throws  IllegalArgumentException
	//      *          if the value of {@code millis} is negative, or the value
	//      *          of {@code nanos} is not in the range {@code 0-999999}
	//      *
	//      * @throws  InterruptedException
	//      *          if any thread has interrupted the current thread. The
	//      *          <i>interrupted status</i> of the current thread is
	//      *          cleared when this exception is thrown.
	//      
	//  BEGIN Android-changed: Synchronize on separate lock object not this Thread.
	//  public final synchronized void join(long millis, int nanos)
	public func join(_ millis: Int64, _ nanos: Int32) {
	}

	// END Android-changed: Synchronize on separate lock object not this Thread.
	// *
	//      * Waits for this thread to die.
	//      *
	//      * <p> An invocation of this method behaves in exactly the same
	//      * way as the invocation
	//      *
	//      * <blockquote>
	//      * {@linkplain #join(long) join}{@code (0)}
	//      * </blockquote>
	//      *
	//      * @throws  InterruptedException
	//      *          if any thread has interrupted the current thread. The
	//      *          <i>interrupted status</i> of the current thread is
	//      *          cleared when this exception is thrown.
	public func join() {
		join(0)
	}

	// *
	//      * Prints a stack trace of the current thread to the standard error stream.
	//      * This method is used only for debugging.
	//      *
	//      * @see     Throwable#printStackTrace()
	public static func dumpStack() {
		Exception("Stack trace").printStackTrace()
	}

	// *
	//      * Marks this thread as either a {@linkplain #isDaemon daemon} thread
	//      * or a user thread. The Java Virtual Machine exits when the only
	//      * threads running are all daemon threads.
	//      *
	//      * <p> This method must be invoked before the thread is started.
	//      *
	//      * @param  on
	//      *         if {@code true}, marks this thread as a daemon thread
	//      *
	//      * @throws  IllegalThreadStateException
	//      *          if this thread is {@linkplain #isAlive alive}
	//      *
	//      * @throws  SecurityException
	//      *          if {@link #checkAccess} determines that the current
	//      *          thread cannot modify this thread
	public func setDaemon(_ on: Bool) {
		checkAccess()
		if isAlive() {
			throw IllegalThreadStateException()
		}
		daemon = on
	}

	// *
	//      * Tests if this thread is a daemon thread.
	//      *
	//      * @return  <code>true</code> if this thread is a daemon thread;
	//      *          <code>false</code> otherwise.
	//      * @see     #setDaemon(boolean)
	public func isDaemon() -> Bool {
		return daemon
	}

	// *
	//      * Determines if the currently running thread has permission to
	//      * modify this thread.
	//      * <p>
	//      * If there is a security manager, its <code>checkAccess</code> method
	//      * is called with this thread as its argument. This may result in
	//      * throwing a <code>SecurityException</code>.
	//      *
	//      * @exception  SecurityException  if the current thread is not allowed to
	//      *               access this thread.
	//      * @see        SecurityManager#checkAccess(Thread)
	public func checkAccess() {
		//  Android-removed: SecurityManager stubbed out on Android
		//  SecurityManager security = System.getSecurityManager();
		//  if (security != null) {
		//      security.checkAccess(this);
		//  }
		// 
	}

	// *
	//      * Returns a string representation of this thread, including the
	//      * thread's name, priority, and thread group.
	//      *
	//      * @return  a string representation of this thread.
	open func toString() -> String! {
		var group: ThreadGroup! = getThreadGroup()
		if group != nil {
			return "Thread[" + getName() + "," + getPriority() + "," + group.getName() + "]"
		} else {
			return "Thread[" + getName() + "," + getPriority() + "," + "" + "]"
		}
	}

	// *
	//      * Returns the context ClassLoader for this Thread. The context
	//      * ClassLoader is provided by the creator of the thread for use
	//      * by code running in this thread when loading classes and resources.
	//      * If not {@linkplain #setContextClassLoader set}, the default is the
	//      * ClassLoader context of the parent Thread. The context ClassLoader of the
	//      * primordial thread is typically set to the class loader used to load the
	//      * application.
	//      *
	//      * <p>If a security manager is present, and the invoker's class loader is not
	//      * {@code null} and is not the same as or an ancestor of the context class
	//      * loader, then this method invokes the security manager's {@link
	//      * SecurityManager#checkPermission(java.security.Permission) checkPermission}
	//      * method with a {@link RuntimePermission RuntimePermission}{@code
	//      * ("getClassLoader")} permission to verify that retrieval of the context
	//      * class loader is permitted.
	//      *
	//      * @return  the context ClassLoader for this Thread, or {@code null}
	//      *          indicating the system class loader (or, failing that, the
	//      *          bootstrap class loader)
	//      *
	//      * @throws  SecurityException
	//      *          if the current thread cannot get the context ClassLoader
	//      *
	//      * @since 1.2
	@CallerSensitive
	open func getContextClassLoader() -> ClassLoader! {
		//  Android-removed: SecurityManager stubbed out on Android
		// 
		//         if (contextClassLoader == null)
		//             return null;
		//         SecurityManager sm = System.getSecurityManager();
		//         if (sm != null) {
		//             ClassLoader.checkClassLoaderPermission(contextClassLoader,
		//                                                    Reflection.getCallerClass());
		//         }
		//         
		return contextClassLoader
	}

	// *
	//      * Sets the context ClassLoader for this Thread. The context
	//      * ClassLoader can be set when a thread is created, and allows
	//      * the creator of the thread to provide the appropriate class loader,
	//      * through {@code getContextClassLoader}, to code running in the thread
	//      * when loading classes and resources.
	//      *
	//      * <p>If a security manager is present, its {@link
	//      * SecurityManager#checkPermission(java.security.Permission) checkPermission}
	//      * method is invoked with a {@link RuntimePermission RuntimePermission}{@code
	//      * ("setContextClassLoader")} permission to see if setting the context
	//      * ClassLoader is permitted.
	//      *
	//      * @param  cl
	//      *         the context ClassLoader for this Thread, or null  indicating the
	//      *         system class loader (or, failing that, the bootstrap class loader)
	//      *
	//      * @throws  SecurityException
	//      *          if the current thread cannot set the context ClassLoader
	//      *
	//      * @since 1.2
	open func setContextClassLoader(_ cl: ClassLoader!) {
		//  Android-removed: SecurityManager stubbed out on Android
		//  SecurityManager sm = System.getSecurityManager();
		//  if (sm != null) {
		//      sm.checkPermission(new RuntimePermission("setContextClassLoader"));
		//  }
		contextClassLoader = cl
	}

	// *
	//      * Returns <tt>true</tt> if and only if the current thread holds the
	//      * monitor lock on the specified object.
	//      *
	//      * <p>This method is designed to allow a program to assert that
	//      * the current thread already holds a specified lock:
	//      * <pre>
	//      *     assert Thread.holdsLock(obj);
	//      * </pre>
	//      *
	//      * @param  obj the object on which to test lock ownership
	//      * @throws NullPointerException if obj is <tt>null</tt>
	//      * @return <tt>true</tt> if the current thread holds the monitor lock on
	//      *         the specified object.
	//      * @since 1.4
	public static __extern func holdsLock(_ obj: Object!) -> Bool

	// *
	//      * Returns an array of stack trace elements representing the stack dump
	//      * of this thread.  This method will return a zero-length array if
	//      * this thread has not started, has started but has not yet been
	//      * scheduled to run by the system, or has terminated.
	//      * If the returned array is of non-zero length then the first element of
	//      * the array represents the top of the stack, which is the most recent
	//      * method invocation in the sequence.  The last element of the array
	//      * represents the bottom of the stack, which is the least recent method
	//      * invocation in the sequence.
	//      *
	//      * <p>If there is a security manager, and this thread is not
	//      * the current thread, then the security manager's
	//      * <tt>checkPermission</tt> method is called with a
	//      * <tt>RuntimePermission("getStackTrace")</tt> permission
	//      * to see if it's ok to get the stack trace.
	//      *
	//      * <p>Some virtual machines may, under some circumstances, omit one
	//      * or more stack frames from the stack trace.  In the extreme case,
	//      * a virtual machine that has no stack trace information concerning
	//      * this thread is permitted to return a zero-length array from this
	//      * method.
	//      *
	//      * @return an array of <tt>StackTraceElement</tt>,
	//      * each represents one stack frame.
	//      *
	//      * @throws SecurityException
	//      *        if a security manager exists and its
	//      *        <tt>checkPermission</tt> method doesn't allow
	//      *        getting the stack trace of thread.
	//      * @see SecurityManager#checkPermission
	//      * @see RuntimePermission
	//      * @see Throwable#getStackTrace
	//      *
	//      * @since 1.5
	open func getStackTrace() -> StackTraceElement![] {
		//  Android-changed: Use native VMStack to get stack trace.
		StackTraceElement
		return (ste != nil ? ste : EmptyArray.STACK_TRACE_ELEMENT)
	}

	// *
	//      * Returns a map of stack traces for all live threads.
	//      * The map keys are threads and each map value is an array of
	//      * <tt>StackTraceElement</tt> that represents the stack dump
	//      * of the corresponding <tt>Thread</tt>.
	//      * The returned stack traces are in the format specified for
	//      * the {@link #getStackTrace getStackTrace} method.
	//      *
	//      * <p>The threads may be executing while this method is called.
	//      * The stack trace of each thread only represents a snapshot and
	//      * each stack trace may be obtained at different time.  A zero-length
	//      * array will be returned in the map value if the virtual machine has
	//      * no stack trace information about a thread.
	//      *
	//      * <p>If there is a security manager, then the security manager's
	//      * <tt>checkPermission</tt> method is called with a
	//      * <tt>RuntimePermission("getStackTrace")</tt> permission as well as
	//      * <tt>RuntimePermission("modifyThreadGroup")</tt> permission
	//      * to see if it is ok to get the stack trace of all threads.
	//      *
	//      * @return a <tt>Map</tt> from <tt>Thread</tt> to an array of
	//      * <tt>StackTraceElement</tt> that represents the stack trace of
	//      * the corresponding thread.
	//      *
	//      * @throws SecurityException
	//      *        if a security manager exists and its
	//      *        <tt>checkPermission</tt> method doesn't allow
	//      *        getting the stack trace of thread.
	//      * @see #getStackTrace
	//      * @see SecurityManager#checkPermission
	//      * @see RuntimePermission
	//      * @see Throwable#getStackTrace
	//      *
	//      * @since 1.5
	public static func getAllStackTraces() -> Map<Thread!,StackTraceElement![]>! {
		//  Android-removed: SecurityManager stubbed out on Android
		// 
		//         // check for getStackTrace permission
		//         SecurityManager security = System.getSecurityManager();
		//         if (security != null) {
		//             security.checkPermission(
		//                 SecurityConstants.GET_STACK_TRACE_PERMISSION);
		//             security.checkPermission(
		//                 SecurityConstants.MODIFY_THREADGROUP_PERMISSION);
		//         }
		//         
		//  Get a snapshot of the list of all threads
		//  BEGIN Android-changed: Use ThreadGroup and getStackTrace() instead of native methods.
		//  Allocate a bit more space than needed, in case new ones are just being created.
		// 
		//         Thread[] threads = getThreads();
		//         StackTraceElement[][] traces = dumpThreads(threads);
		//         Map<Thread, StackTraceElement[]> m = new HashMap<>(threads.length);
		//         for (int i = 0; i < threads.length; i++) {
		//             StackTraceElement[] stackTrace = traces[i];
		//             if (stackTrace != null) {
		//                 m.put(threads[i], stackTrace);
		//             }
		//             // else terminated so we don't put it in the map
		//         }
		//         
		var count: Int32 = ThreadGroup.systemThreadGroup.activeCount()
		var threads: Thread![] = Thread[](count: count + (count / 2))
		//  Enumerate the threads.
		count = ThreadGroup.systemThreadGroup.enumerate(threads)
		//  Collect the stacktraces
		var m: Map<Thread!,StackTraceElement![]>! = HashMap<Thread!,StackTraceElement![]>()
		for i in 0 ... count - 1 {
			var stackTrace: StackTraceElement![] = threads[i].getStackTrace()
			m.put(threads[i], stackTrace)
		}
		//  END Android-changed: Use ThreadGroup and getStackTrace() instead of native methods.
		return m
	}

	// *
	//      * Verifies that this (possibly subclass) instance can be constructed
	//      * without violating security constraints: the subclass must not override
	//      * security-sensitive non-final methods, or else the
	//      * "enableContextClassLoaderOverride" RuntimePermission is checked.
	private static func isCCLOverridden(_ cl: Class!) -> Bool {
		if cl == Thread.self {
			return false
		}
		processQueue(Caches.subclassAuditsQueue, Caches.subclassAudits)
		var key: WeakClassKey! = WeakClassKey(cl, Caches.subclassAuditsQueue)
		var result: Boolean! = Caches.subclassAudits.`get`(key)
		if result == nil {
			result = Boolean.valueOf(auditSubclass(cl))
			Caches.subclassAudits.putIfAbsent(key, result)
		}
		return result.booleanValue()
	}

	// *
	//      * Performs reflective checks on given subclass to verify that it doesn't
	//      * override security-sensitive non-final methods.  Returns true if the
	//      * subclass overrides any of the methods, false otherwise.
	private static func auditSubclass(_ subcl: Class!) -> Bool {
		var result: Boolean! = AccessController.doPrivileged(class {
			func run() {
				var cl: Class! = subcl
				while cl != Thread.self {
					__try {
						cl.getDeclaredMethod("getContextClassLoader", Class[](count: 0))
						return Boolean.TRUE
					}
					__catch ex: NoSuchMethodException {
					}
					__try {
						var params: Class![] = [ClassLoader.self]
						cl.getDeclaredMethod("setContextClassLoader", params)
						return Boolean.TRUE
					}
					__catch ex: NoSuchMethodException {
					}
					cl = cl.getSuperclass()
				}return Boolean.FALSE
			}
		})
		return result.booleanValue()
	}

	// Android-removed: Native methods that are unused on Android.
	//  private native static StackTraceElement[][] dumpThreads(Thread[] threads);
	//  private native static Thread[] getThreads();
	// *
	//      * Returns the identifier of this Thread.  The thread ID is a positive
	//      * <tt>long</tt> number generated when this thread was created.
	//      * The thread ID is unique and remains unchanged during its lifetime.
	//      * When a thread is terminated, this thread ID may be reused.
	//      *
	//      * @return this thread's ID.
	//      * @since 1.5
	open func getId() -> Int64 {
		return tid
	}

	// *
	//      * Returns the state of this thread.
	//      * This method is designed for use in monitoring of the system state,
	//      * not for synchronization control.
	//      *
	//      * @return this thread's state.
	//      * @since 1.5
	open func getState() -> State! {
		//  get current thread state
		//  Android-changed: Replace unused threadStatus field with started field.
		//  Use Android specific nativeGetStatus() method. See comment on started field for more
		//  information.
		//  return sun.misc.VM.toThreadState(threadStatus);
		return State.values()[nativeGetStatus(started)]
	}

	// *
	//      * Set the default handler invoked when a thread abruptly terminates
	//      * due to an uncaught exception, and no other handler has been defined
	//      * for that thread.
	//      *
	//      * <p>Uncaught exception handling is controlled first by the thread, then
	//      * by the thread's {@link ThreadGroup} object and finally by the default
	//      * uncaught exception handler. If the thread does not have an explicit
	//      * uncaught exception handler set, and the thread's thread group
	//      * (including parent thread groups)  does not specialize its
	//      * <tt>uncaughtException</tt> method, then the default handler's
	//      * <tt>uncaughtException</tt> method will be invoked.
	//      * <p>By setting the default uncaught exception handler, an application
	//      * can change the way in which uncaught exceptions are handled (such as
	//      * logging to a specific device, or file) for those threads that would
	//      * already accept whatever &quot;default&quot; behavior the system
	//      * provided.
	//      *
	//      * <p>Note that the default uncaught exception handler should not usually
	//      * defer to the thread's <tt>ThreadGroup</tt> object, as that could cause
	//      * infinite recursion.
	//      *
	//      * @param eh the object to use as the default uncaught exception handler.
	//      * If <tt>null</tt> then there is no default handler.
	//      *
	//      * @throws SecurityException if a security manager is present and it
	//      *         denies <tt>{@link RuntimePermission}
	//      *         (&quot;setDefaultUncaughtExceptionHandler&quot;)</tt>
	//      *
	//      * @see #setUncaughtExceptionHandler
	//      * @see #getUncaughtExceptionHandler
	//      * @see ThreadGroup#uncaughtException
	//      * @since 1.5
	public static func setDefaultUncaughtExceptionHandler(_ eh: UncaughtExceptionHandler!) {
		//  Android-removed: SecurityManager stubbed out on Android
		// 
		//         SecurityManager sm = System.getSecurityManager();
		//         if (sm != null) {
		//             sm.checkPermission(
		//                 new RuntimePermission("setDefaultUncaughtExceptionHandler")
		//                     );
		//         }
		//         
		defaultUncaughtExceptionHandler = eh
	}

	// *
	//      * Returns the default handler invoked when a thread abruptly terminates
	//      * due to an uncaught exception. If the returned value is <tt>null</tt>,
	//      * there is no default.
	//      * @since 1.5
	//      * @see #setDefaultUncaughtExceptionHandler
	//      * @return the default uncaught exception handler for all threads
	public static func getDefaultUncaughtExceptionHandler() -> UncaughtExceptionHandler! {
		return defaultUncaughtExceptionHandler
	}

	// *
	//      * Sets an {@link UncaughtExceptionHandler} that will be called before any
	//      * returned by {@link #getUncaughtExceptionHandler()}. To allow the standard
	//      * handlers to run, this handler should never terminate this process. Any
	//      * throwables thrown by the handler will be ignored by
	//      * {@link #dispatchUncaughtException(Throwable)}.
	//      *
	//      * @hide used when configuring the runtime for exception logging; see
	//      *     {@link dalvik.system.RuntimeHooks} b/29624607
	public static func setUncaughtExceptionPreHandler(_ eh: UncaughtExceptionHandler!) {
		uncaughtExceptionPreHandler = eh
	}

	// * @hide
	public static func getUncaughtExceptionPreHandler() -> UncaughtExceptionHandler! {
		return uncaughtExceptionPreHandler
	}

	// END Android-added: uncaughtExceptionPreHandler for use by platform.
	// *
	//      * Returns the handler invoked when this thread abruptly terminates
	//      * due to an uncaught exception. If this thread has not had an
	//      * uncaught exception handler explicitly set then this thread's
	//      * <tt>ThreadGroup</tt> object is returned, unless this thread
	//      * has terminated, in which case <tt>null</tt> is returned.
	//      * @since 1.5
	//      * @return the uncaught exception handler for this thread
	open func getUncaughtExceptionHandler() -> UncaughtExceptionHandler! {
		return (uncaughtExceptionHandler != nil ? uncaughtExceptionHandler : group)
	}

	// *
	//      * Set the handler invoked when this thread abruptly terminates
	//      * due to an uncaught exception.
	//      * <p>A thread can take full control of how it responds to uncaught
	//      * exceptions by having its uncaught exception handler explicitly set.
	//      * If no such handler is set then the thread's <tt>ThreadGroup</tt>
	//      * object acts as its handler.
	//      * @param eh the object to use as this thread's uncaught exception
	//      * handler. If <tt>null</tt> then this thread has no explicit handler.
	//      * @throws  SecurityException  if the current thread is not allowed to
	//      *          modify this thread.
	//      * @see #setDefaultUncaughtExceptionHandler
	//      * @see ThreadGroup#uncaughtException
	//      * @since 1.5
	open func setUncaughtExceptionHandler(_ eh: UncaughtExceptionHandler!) {
		checkAccess()
		uncaughtExceptionHandler = eh
	}

	// *
	//      * Dispatch an uncaught exception to the handler. This method is
	//      * intended to be called only by the runtime and by tests.
	//      *
	//      * @hide
	//      
	//  Android-changed: Make dispatchUncaughtException() public, for use by tests.
	public func dispatchUncaughtException(_ e: Throwable!) {
		//  BEGIN Android-added: uncaughtExceptionPreHandler for use by platform.
		var initialUeh: Thread.UncaughtExceptionHandler! = Thread.getUncaughtExceptionPreHandler()
		if initialUeh != nil {
			__try {
				initialUeh.uncaughtException(self, e)
			}
			__catch ignored: RuntimeException {
			}
		}
		//  END Android-added: uncaughtExceptionPreHandler for use by platform.
		getUncaughtExceptionHandler().uncaughtException(self, e)
	}

	// *
	//      * Removes from the specified map any keys that have been enqueued
	//      * on the specified reference queue.
	internal static func processQueue(_ queue: ReferenceQueue<Class!>!, _ map: ConcurrentMap!) {
		var ref: Reference!
		while true {
			ref = queue.poll()
			if !ref > nil {
				break
			}
			map.remove(ref)
		}}

	// END Android-changed: @sun.misc.Contended is not supported on Android.
	//  Some private helper methods
	private __extern func setPriority0(_ newPriority: Int32)

	// BEGIN Android-removed: Native methods that are unused on Android.
	// 
	//     private native void stop0(Object o);
	//     private native void suspend0();
	//     private native void resume0();
	//     
	//  END Android-removed: Native methods that are unused on Android.
	@FastNative
	private __extern func interrupt0()

	private __extern func setNativeName(_ name: String!)

	// Android-added: Android specific nativeGetStatus() method.
	private __extern func nativeGetStatus(_ hasBeenStarted: Bool) -> Int32

	// *
	//      * Unparks this thread. This unblocks the thread it if it was
	//      * previously parked, or indicates that the thread is "preemptively
	//      * unparked" if it wasn't already parked. The latter means that the
	//      * next time the thread is told to park, it will merely clear its
	//      * latent park bit and carry on without blocking.
	//      *
	//      * <p>See {@link java.util.concurrent.locks.LockSupport} for more
	//      * in-depth information of the behavior of this method.</p>
	//      *
	//      * @hide for Unsafe
	public func unpark$() {
	}

	// *
	//      * Parks the current thread for a particular number of nanoseconds, or
	//      * indefinitely. If not indefinitely, this method unparks the thread
	//      * after the given number of nanoseconds if no other thread unparks it
	//      * first. If the thread has been "preemptively unparked," this method
	//      * cancels that unparking and returns immediately. This method may
	//      * also return spuriously (that is, without the thread being told to
	//      * unpark and without the indicated amount of time elapsing).
	//      *
	//      * <p>See {@link java.util.concurrent.locks.LockSupport} for more
	//      * in-depth information of the behavior of this method.</p>
	//      *
	//      * <p>This method must only be called when <code>this</code> is the current
	//      * thread.
	//      *
	//      * @param nanos number of nanoseconds to park for or <code>0</code>
	//      * to park indefinitely
	//      * @throws IllegalArgumentException thrown if <code>nanos &lt; 0</code>
	//      *
	//      * @hide for Unsafe
	public func parkFor$(_ nanos: Int64) {
	}

	// *
	//      * Parks the current thread until the specified system time. This
	//      * method attempts to unpark the current thread immediately after
	//      * <code>System.currentTimeMillis()</code> reaches the specified
	//      * value, if no other thread unparks it first. If the thread has
	//      * been "preemptively unparked," this method cancels that
	//      * unparking and returns immediately. This method may also return
	//      * spuriously (that is, without the thread being told to unpark
	//      * and without the indicated amount of time elapsing).
	//      *
	//      * <p>See {@link java.util.concurrent.locks.LockSupport} for more
	//      * in-depth information of the behavior of this method.</p>
	//      *
	//      * <p>This method must only be called when <code>this</code> is the
	//      * current thread.
	//      *
	//      * @param time the time after which the thread should be unparked,
	//      * in absolute milliseconds-since-the-epoch
	//      *
	//      * @hide for Unsafe
	public func parkUntil$(_ time: Int64) {
	}

	class Caches { 
		// * cache of subclass security audit results 
		// 
		internal let subclassAudits: ConcurrentMap<WeakClassKey!,Boolean!>! = ConcurrentHashMap()
		// * queue for WeakReferences to audited subclasses 
		// 
		internal let subclassAuditsQueue: ReferenceQueue<Class!>! = ReferenceQueue()
	}

	public enum State { 
		case NEW
		case RUNNABLE
		case BLOCKED
		case WAITING
		case TIMED_WAITING
		case TERMINATED
	}

	@FunctionalInterface
	public protocol UncaughtExceptionHandler { 
		// *
		//          * Method invoked when the given thread terminates due to the
		//          * given uncaught exception.
		//          * <p>Any exception thrown by this method will be ignored by the
		//          * Java Virtual Machine.
		//          * @param t the thread
		//          * @param e the exception
		func uncaughtException(_ t: Thread!, _ e: Throwable!)
	}

	internal class WeakClassKey : WeakReference<Class!> { 
		// *
		//          * saved value of the referent's identity hash code, to maintain
		//          * a consistent hash code after the referent has been cleared
		//          
		// 
		private let hash: Int32 = 0

		// *
		//          * Create a new WeakClassKey to the given object, registered
		//          * with a queue.
		internal init(_ cl: Class!, _ refQueue: ReferenceQueue<Class!>!) {
			super.init(cl, refQueue)
			hash = System.identityHashCode(cl)
		}

		// *
		//          * Returns the identity hash code of the original referent.
		// @Override
		public func hashCode() -> Int32 {
			return hash
		}

		// *
		//          * Returns true if the given object is this identical
		//          * WeakClassKey instance, or, if this object's referent has not
		//          * been cleared, if the given object is another WeakClassKey
		//          * instance with the identical non-null referent as this one.
		// @Override
		public func equals(_ obj: Object!) -> Bool {
			if obj == self {
				return true
			}
			if obj is WeakClassKey! {
				var referent: Object! = `get`()
				return referent != nil & (referent == (obj as? WeakClassKey).`get`())
			} else {
				return false
			}
		}
	}

	class ParkState { 
		// * park state indicating unparked 
		// 
		private let UNPARKED: Int32 = 1
		// * park state indicating preemptively unparked 
		// 
		private let PREEMPTIVELY_UNPARKED: Int32 = 2
		// * park state indicating parked 
		// 
		private let PARKED: Int32 = 3
	}
}

