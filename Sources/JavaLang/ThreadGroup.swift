
  

// import java.io
// import java.util
// import sun.misc

open class ThreadGroup : Thread.UncaughtExceptionHandler { 
	//  the runtime uses these directly; do not rename 
	// 
	internal let systemThreadGroup: ThreadGroup! = ThreadGroup()
	internal let mainThreadGroup: ThreadGroup! = ThreadGroup(systemThreadGroup, "main")
	private let parent: ThreadGroup!
	internal var name: String!
	internal var maxPriority: Int32 = 0
	internal var destroyed: Bool = false
	internal var daemon: Bool = false
	internal var vmAllowSuspension: Bool = false
	internal var nUnstartedThreads: Int32 = 0
	internal var nthreads: Int32 = 0
	internal var threads: Thread![]
	internal var ngroups: Int32 = 0
	internal var groups: ThreadGroup![]

	// *
	//      * Creates an empty Thread group that is not in any Thread group.
	//      * This method is used to create the system Thread group.
	private init() {
		//  called from C code
		self.name = "system"
		self.maxPriority = Thread.MAX_PRIORITY
		self.parent = nil
	}

	// *
	//      * Constructs a new thread group. The parent of this new group is
	//      * the thread group of the currently running thread.
	//      * <p>
	//      * The <code>checkAccess</code> method of the parent thread group is
	//      * called with no arguments; this may result in a security exception.
	//      *
	//      * @param   name   the name of the new thread group.
	//      * @exception  SecurityException  if the current thread cannot create a
	//      *               thread in the specified thread group.
	//      * @see     java.lang.ThreadGroup#checkAccess()
	//      * @since   JDK1.0
	public init(_ name: String!) {
		self.(Thread.currentThread().getThreadGroup(), name)
	}

	// *
	//      * Creates a new thread group. The parent of this new group is the
	//      * specified thread group.
	//      * <p>
	//      * The <code>checkAccess</code> method of the parent thread group is
	//      * called with no arguments; this may result in a security exception.
	//      *
	//      * @param     parent   the parent thread group.
	//      * @param     name     the name of the new thread group.
	//      * @exception  NullPointerException  if the thread group argument is
	//      *               <code>null</code>.
	//      * @exception  SecurityException  if the current thread cannot create a
	//      *               thread in the specified thread group.
	//      * @see     java.lang.SecurityException
	//      * @see     java.lang.ThreadGroup#checkAccess()
	//      * @since   JDK1.0
	public init(_ parent: ThreadGroup!, _ name: String!) {
		self.(checkParentAccess(parent), parent, name)
	}

	private init(_ unused: Void!, _ parent: ThreadGroup!, _ name: String!) {
		self.name = name
		self.maxPriority = parent.maxPriority
		self.daemon = parent.daemon
		self.vmAllowSuspension = parent.vmAllowSuspension
		self.parent = parent
		parent.add(self)
	}

	// * @throws  NullPointerException  if the parent argument is {@code null}
	//      * @throws  SecurityException     if the current thread cannot create a
	//      *                                thread in the specified thread group.
	private static func checkParentAccess(_ parent: ThreadGroup!) -> Void! {
		parent.checkAccess()
		return nil
	}

	// *
	//      * Returns the name of this thread group.
	//      *
	//      * @return  the name of this thread group.
	//      * @since   JDK1.0
	public func getName() -> String! {
		return name
	}

	// *
	//      * Returns the parent of this thread group.
	//      * <p>
	//      * First, if the parent is not <code>null</code>, the
	//      * <code>checkAccess</code> method of the parent thread group is
	//      * called with no arguments; this may result in a security exception.
	//      *
	//      * @return  the parent of this thread group. The top-level thread group
	//      *          is the only thread group whose parent is <code>null</code>.
	//      * @exception  SecurityException  if the current thread cannot modify
	//      *               this thread group.
	//      * @see        java.lang.ThreadGroup#checkAccess()
	//      * @see        java.lang.SecurityException
	//      * @see        java.lang.RuntimePermission
	//      * @since   JDK1.0
	public func getParent() -> ThreadGroup! {
		if parent != nil {
			parent.checkAccess()
		}
		return parent
	}

	// *
	//      * Returns the maximum priority of this thread group. Threads that are
	//      * part of this group cannot have a higher priority than the maximum
	//      * priority.
	//      *
	//      * @return  the maximum priority that a thread in this thread group
	//      *          can have.
	//      * @see     #setMaxPriority
	//      * @since   JDK1.0
	public func getMaxPriority() -> Int32 {
		return maxPriority
	}

	// *
	//      * Tests if this thread group is a daemon thread group. A
	//      * daemon thread group is automatically destroyed when its last
	//      * thread is stopped or its last thread group is destroyed.
	//      *
	//      * @return  <code>true</code> if this thread group is a daemon thread group;
	//      *          <code>false</code> otherwise.
	//      * @since   JDK1.0
	public func isDaemon() -> Bool {
		return daemon
	}

	// *
	//      * Tests if this thread group has been destroyed.
	//      *
	//      * @return  true if this object is destroyed
	//      * @since   JDK1.1
	open func isDestroyed() -> Bool {
		return destroyed
	}

	// *
	//      * Changes the daemon status of this thread group.
	//      * <p>
	//      * First, the <code>checkAccess</code> method of this thread group is
	//      * called with no arguments; this may result in a security exception.
	//      * <p>
	//      * A daemon thread group is automatically destroyed when its last
	//      * thread is stopped or its last thread group is destroyed.
	//      *
	//      * @param      daemon   if <code>true</code>, marks this thread group as
	//      *                      a daemon thread group; otherwise, marks this
	//      *                      thread group as normal.
	//      * @exception  SecurityException  if the current thread cannot modify
	//      *               this thread group.
	//      * @see        java.lang.SecurityException
	//      * @see        java.lang.ThreadGroup#checkAccess()
	//      * @since      JDK1.0
	public func setDaemon(_ daemon: Bool) {
		checkAccess()
		self.daemon = daemon
	}

	// *
	//      * Sets the maximum priority of the group. Threads in the thread
	//      * group that already have a higher priority are not affected.
	//      * <p>
	//      * First, the <code>checkAccess</code> method of this thread group is
	//      * called with no arguments; this may result in a security exception.
	//      * <p>
	//      * If the <code>pri</code> argument is less than
	//      * {@link Thread#MIN_PRIORITY} or greater than
	//      * {@link Thread#MAX_PRIORITY}, it is clamped to those values.
	//      * <p>
	//      * Otherwise, the priority of this ThreadGroup object is set to the
	//      * smaller of the specified <code>pri</code> and the maximum permitted
	//      * priority of the parent of this thread group. (If this thread group
	//      * is the system thread group, which has no parent, then its maximum
	//      * priority is simply set to <code>pri</code>.) Then this method is
	//      * called recursively, with <code>pri</code> as its argument, for
	//      * every thread group that belongs to this thread group.
	//      *
	//      * @param      pri   the new priority of the thread group.
	//      * @exception  SecurityException  if the current thread cannot modify
	//      *               this thread group.
	//      * @see        #getMaxPriority
	//      * @see        java.lang.SecurityException
	//      * @see        java.lang.ThreadGroup#checkAccess()
	//      * @since      JDK1.0
	public func setMaxPriority(_ pri: Int32) {
		var ngroupsSnapshot: Int32
		var groupsSnapshot: ThreadGroup![]
		for i in 0 ... ngroupsSnapshot - 1 {
			groupsSnapshot[i].setMaxPriority(pri)
		}
	}

	// *
	//      * Tests if this thread group is either the thread group
	//      * argument or one of its ancestor thread groups.
	//      *
	//      * @param   g   a thread group.
	//      * @return  <code>true</code> if this thread group is the thread group
	//      *          argument or one of its ancestor thread groups;
	//      *          <code>false</code> otherwise.
	//      * @since   JDK1.0
	public func parentOf(_ g: ThreadGroup!) -> Bool {
		while g != nil {
			if g == self {
				return true
			}
			g = g.parent
		}return false
	}

	// *
	//      * Determines if the currently running thread has permission to
	//      * modify this thread group.
	//      * <p>
	//      * If there is a security manager, its <code>checkAccess</code> method
	//      * is called with this thread group as its argument. This may result
	//      * in throwing a <code>SecurityException</code>.
	//      *
	//      * @exception  SecurityException  if the current thread is not allowed to
	//      *               access this thread group.
	//      * @see        java.lang.SecurityManager#checkAccess(java.lang.ThreadGroup)
	//      * @since      JDK1.0
	public func checkAccess() {
		//  Android-removed: SecurityManager stubbed out on Android.
		//  SecurityManager security = System.getSecurityManager();
		//  if (security != null) {
		//      security.checkAccess(this);
		//  }
		// 
	}

	// *
	//      * Returns an estimate of the number of active threads in this thread
	//      * group and its subgroups. Recursively iterates over all subgroups in
	//      * this thread group.
	//      *
	//      * <p> The value returned is only an estimate because the number of
	//      * threads may change dynamically while this method traverses internal
	//      * data structures, and might be affected by the presence of certain
	//      * system threads. This method is intended primarily for debugging
	//      * and monitoring purposes.
	//      *
	//      * @return  an estimate of the number of active threads in this thread
	//      *          group and in any other thread group that has this thread
	//      *          group as an ancestor
	//      *
	//      * @since   JDK1.0
	open func activeCount() -> Int32 {
		var result: Int32
		//  Snapshot sub-group data so we don't hold this lock
		//  while our children are computing.
		var ngroupsSnapshot: Int32
		var groupsSnapshot: ThreadGroup![]
		for i in 0 ... ngroupsSnapshot - 1 {
			result = result + groupsSnapshot[i].activeCount()
		}
		return result
	}

	// *
	//      * Copies into the specified array every active thread in this
	//      * thread group and its subgroups.
	//      *
	//      * <p> An invocation of this method behaves in exactly the same
	//      * way as the invocation
	//      *
	//      * <blockquote>
	//      * {@linkplain #enumerate(Thread[], boolean) enumerate}{@code (list, true)}
	//      * </blockquote>
	//      *
	//      * @param  list
	//      *         an array into which to put the list of threads
	//      *
	//      * @return  the number of threads put into the array
	//      *
	//      * @throws  SecurityException
	//      *          if {@linkplain #checkAccess checkAccess} determines that
	//      *          the current thread cannot access this thread group
	//      *
	//      * @since   JDK1.0
	open func enumerate(_ list: Thread![]) -> Int32 {
		checkAccess()
		return enumerate(list, 0, true)
	}

	// *
	//      * Copies into the specified array every active thread in this
	//      * thread group. If {@code recurse} is {@code true},
	//      * this method recursively enumerates all subgroups of this
	//      * thread group and references to every active thread in these
	//      * subgroups are also included. If the array is too short to
	//      * hold all the threads, the extra threads are silently ignored.
	//      *
	//      * <p> An application might use the {@linkplain #activeCount activeCount}
	//      * method to get an estimate of how big the array should be, however
	//      * <i>if the array is too short to hold all the threads, the extra threads
	//      * are silently ignored.</i>  If it is critical to obtain every active
	//      * thread in this thread group, the caller should verify that the returned
	//      * int value is strictly less than the length of {@code list}.
	//      *
	//      * <p> Due to the inherent race condition in this method, it is recommended
	//      * that the method only be used for debugging and monitoring purposes.
	//      *
	//      * @param  list
	//      *         an array into which to put the list of threads
	//      *
	//      * @param  recurse
	//      *         if {@code true}, recursively enumerate all subgroups of this
	//      *         thread group
	//      *
	//      * @return  the number of threads put into the array
	//      *
	//      * @throws  SecurityException
	//      *          if {@linkplain #checkAccess checkAccess} determines that
	//      *          the current thread cannot access this thread group
	//      *
	//      * @since   JDK1.0
	open func enumerate(_ list: Thread![], _ recurse: Bool) -> Int32 {
		checkAccess()
		return enumerate(list, 0, recurse)
	}

	private func enumerate(_ list: Thread![], _ n: Int32, _ recurse: Bool) -> Int32 {
		var ngroupsSnapshot: Int32 = 0
		var groupsSnapshot: ThreadGroup![] = nil
		if recurse {
			for i in 0 ... ngroupsSnapshot - 1 {
				n = groupsSnapshot[i].enumerate(list, n, true)
			}
		}
		return n
	}

	// *
	//      * Returns an estimate of the number of active groups in this
	//      * thread group and its subgroups. Recursively iterates over
	//      * all subgroups in this thread group.
	//      *
	//      * <p> The value returned is only an estimate because the number of
	//      * thread groups may change dynamically while this method traverses
	//      * internal data structures. This method is intended primarily for
	//      * debugging and monitoring purposes.
	//      *
	//      * @return  the number of active thread groups with this thread group as
	//      *          an ancestor
	//      *
	//      * @since   JDK1.0
	open func activeGroupCount() -> Int32 {
		var ngroupsSnapshot: Int32
		var groupsSnapshot: ThreadGroup![]
		var n: Int32 = ngroupsSnapshot
		for i in 0 ... ngroupsSnapshot - 1 {
			n = n + groupsSnapshot[i].activeGroupCount()
		}
		return n
	}

	// *
	//      * Copies into the specified array references to every active
	//      * subgroup in this thread group and its subgroups.
	//      *
	//      * <p> An invocation of this method behaves in exactly the same
	//      * way as the invocation
	//      *
	//      * <blockquote>
	//      * {@linkplain #enumerate(ThreadGroup[], boolean) enumerate}{@code (list, true)}
	//      * </blockquote>
	//      *
	//      * @param  list
	//      *         an array into which to put the list of thread groups
	//      *
	//      * @return  the number of thread groups put into the array
	//      *
	//      * @throws  SecurityException
	//      *          if {@linkplain #checkAccess checkAccess} determines that
	//      *          the current thread cannot access this thread group
	//      *
	//      * @since   JDK1.0
	open func enumerate(_ list: ThreadGroup![]) -> Int32 {
		checkAccess()
		return enumerate(list, 0, true)
	}

	// *
	//      * Copies into the specified array references to every active
	//      * subgroup in this thread group. If {@code recurse} is
	//      * {@code true}, this method recursively enumerates all subgroups of this
	//      * thread group and references to every active thread group in these
	//      * subgroups are also included.
	//      *
	//      * <p> An application might use the
	//      * {@linkplain #activeGroupCount activeGroupCount} method to
	//      * get an estimate of how big the array should be, however <i>if the
	//      * array is too short to hold all the thread groups, the extra thread
	//      * groups are silently ignored.</i>  If it is critical to obtain every
	//      * active subgroup in this thread group, the caller should verify that
	//      * the returned int value is strictly less than the length of
	//      * {@code list}.
	//      *
	//      * <p> Due to the inherent race condition in this method, it is recommended
	//      * that the method only be used for debugging and monitoring purposes.
	//      *
	//      * @param  list
	//      *         an array into which to put the list of thread groups
	//      *
	//      * @param  recurse
	//      *         if {@code true}, recursively enumerate all subgroups
	//      *
	//      * @return  the number of thread groups put into the array
	//      *
	//      * @throws  SecurityException
	//      *          if {@linkplain #checkAccess checkAccess} determines that
	//      *          the current thread cannot access this thread group
	//      *
	//      * @since   JDK1.0
	open func enumerate(_ list: ThreadGroup![], _ recurse: Bool) -> Int32 {
		checkAccess()
		return enumerate(list, 0, recurse)
	}

	private func enumerate(_ list: ThreadGroup![], _ n: Int32, _ recurse: Bool) -> Int32 {
		var ngroupsSnapshot: Int32 = 0
		var groupsSnapshot: ThreadGroup![] = nil
		if recurse {
			for i in 0 ... ngroupsSnapshot - 1 {
				n = groupsSnapshot[i].enumerate(list, n, true)
			}
		}
		return n
	}

	// *
	//      * Stops all threads in this thread group.
	//      * <p>
	//      * First, the <code>checkAccess</code> method of this thread group is
	//      * called with no arguments; this may result in a security exception.
	//      * <p>
	//      * This method then calls the <code>stop</code> method on all the
	//      * threads in this thread group and in all of its subgroups.
	//      *
	//      * @exception  SecurityException  if the current thread is not allowed
	//      *               to access this thread group or any of the threads in
	//      *               the thread group.
	//      * @see        java.lang.SecurityException
	//      * @see        java.lang.Thread#stop()
	//      * @see        java.lang.ThreadGroup#checkAccess()
	//      * @since      JDK1.0
	//      * @deprecated    This method is inherently unsafe.  See
	//      *     {@link Thread#stop} for details.
	@Deprecated
	public func stop() {
		if stopOrSuspend(false) {
			Thread.currentThread().stop()
		}
	}

	// *
	//      * Interrupts all threads in this thread group.
	//      * <p>
	//      * First, the <code>checkAccess</code> method of this thread group is
	//      * called with no arguments; this may result in a security exception.
	//      * <p>
	//      * This method then calls the <code>interrupt</code> method on all the
	//      * threads in this thread group and in all of its subgroups.
	//      *
	//      * @exception  SecurityException  if the current thread is not allowed
	//      *               to access this thread group or any of the threads in
	//      *               the thread group.
	//      * @see        java.lang.Thread#interrupt()
	//      * @see        java.lang.SecurityException
	//      * @see        java.lang.ThreadGroup#checkAccess()
	//      * @since      1.2
	public func interrupt() {
		var ngroupsSnapshot: Int32
		var groupsSnapshot: ThreadGroup![]
		for i in 0 ... ngroupsSnapshot - 1 {
			groupsSnapshot[i].interrupt()
		}
	}

	// *
	//      * Suspends all threads in this thread group.
	//      * <p>
	//      * First, the <code>checkAccess</code> method of this thread group is
	//      * called with no arguments; this may result in a security exception.
	//      * <p>
	//      * This method then calls the <code>suspend</code> method on all the
	//      * threads in this thread group and in all of its subgroups.
	//      *
	//      * @exception  SecurityException  if the current thread is not allowed
	//      *               to access this thread group or any of the threads in
	//      *               the thread group.
	//      * @see        java.lang.Thread#suspend()
	//      * @see        java.lang.SecurityException
	//      * @see        java.lang.ThreadGroup#checkAccess()
	//      * @since      JDK1.0
	//      * @deprecated    This method is inherently deadlock-prone.  See
	//      *     {@link Thread#suspend} for details.
	@Deprecated
	@SuppressWarnings("deprecation")
	public func suspend() {
		if stopOrSuspend(true) {
			Thread.currentThread().suspend()
		}
	}

	// *
	//      * Helper method: recursively stops or suspends (as directed by the
	//      * boolean argument) all of the threads in this thread group and its
	//      * subgroups, except the current thread.  This method returns true
	//      * if (and only if) the current thread is found to be in this thread
	//      * group or one of its subgroups.
	@SuppressWarnings("deprecation")
	private func stopOrSuspend(_ suspend: Bool) -> Bool {
		var suicide: Bool = false
		var us: Thread! = Thread.currentThread()
		var ngroupsSnapshot: Int32
		var groupsSnapshot: ThreadGroup![] = nil
		for i in 0 ... ngroupsSnapshot - 1 {
			suicide = groupsSnapshot[i].stopOrSuspend(suspend) | suicide
		}
		return suicide
	}

	// *
	//      * Resumes all threads in this thread group.
	//      * <p>
	//      * First, the <code>checkAccess</code> method of this thread group is
	//      * called with no arguments; this may result in a security exception.
	//      * <p>
	//      * This method then calls the <code>resume</code> method on all the
	//      * threads in this thread group and in all of its sub groups.
	//      *
	//      * @exception  SecurityException  if the current thread is not allowed to
	//      *               access this thread group or any of the threads in the
	//      *               thread group.
	//      * @see        java.lang.SecurityException
	//      * @see        java.lang.Thread#resume()
	//      * @see        java.lang.ThreadGroup#checkAccess()
	//      * @since      JDK1.0
	//      * @deprecated    This method is used solely in conjunction with
	//      *      <tt>Thread.suspend</tt> and <tt>ThreadGroup.suspend</tt>,
	//      *       both of which have been deprecated, as they are inherently
	//      *       deadlock-prone.  See {@link Thread#suspend} for details.
	@Deprecated
	@SuppressWarnings("deprecation")
	public func resume() {
		var ngroupsSnapshot: Int32
		var groupsSnapshot: ThreadGroup![]
		for i in 0 ... ngroupsSnapshot - 1 {
			groupsSnapshot[i].resume()
		}
	}

	// *
	//      * Destroys this thread group and all of its subgroups. This thread
	//      * group must be empty, indicating that all threads that had been in
	//      * this thread group have since stopped.
	//      * <p>
	//      * First, the <code>checkAccess</code> method of this thread group is
	//      * called with no arguments; this may result in a security exception.
	//      *
	//      * @exception  IllegalThreadStateException  if the thread group is not
	//      *               empty or if the thread group has already been destroyed.
	//      * @exception  SecurityException  if the current thread cannot modify this
	//      *               thread group.
	//      * @see        java.lang.ThreadGroup#checkAccess()
	//      * @since      JDK1.0
	public func destroy() {
		var ngroupsSnapshot: Int32
		var groupsSnapshot: ThreadGroup![]
		var i: Int32 = 0
		while i < ngroupsSnapshot {
			groupsSnapshot[i].destroy()
			i = i + 1
		}if parent != nil {
			parent.remove(self)
		}
	}

	// *
	//      * Adds the specified Thread group to this group.
	//      * @param g the specified Thread group to be added
	//      * @exception IllegalThreadStateException If the Thread group has been destroyed.
	private func add(_ g: ThreadGroup!) {
	}

	// *
	//      * Removes the specified Thread group from this group.
	//      * @param g the Thread group to be removed
	//      * @return if this Thread has already been destroyed.
	private func remove(_ g: ThreadGroup!) {
	}

	// *
	//      * Increments the count of unstarted threads in the thread group.
	//      * Unstarted threads are not added to the thread group so that they
	//      * can be collected if they are never started, but they must be
	//      * counted so that daemon thread groups with unstarted threads in
	//      * them are not destroyed.
	internal func addUnstarted() {
	}

	// *
	//      * Adds the specified thread to this thread group.
	//      *
	//      * <p> Note: This method is called from both library code
	//      * and the Virtual Machine. It is called from VM to add
	//      * certain system threads to the system thread group.
	//      *
	//      * @param  t
	//      *         the Thread to be added
	//      *
	//      * @throws  IllegalThreadStateException
	//      *          if the Thread group has been destroyed
	internal func add(_ t: Thread!) {
	}

	// *
	//      * Notifies the group that the thread {@code t} has failed
	//      * an attempt to start.
	//      *
	//      * <p> The state of this thread group is rolled back as if the
	//      * attempt to start the thread has never occurred. The thread is again
	//      * considered an unstarted member of the thread group, and a subsequent
	//      * attempt to start the thread is permitted.
	//      *
	//      * @param  t
	//      *         the Thread whose start method was invoked
	internal func threadStartFailed(_ t: Thread!) {
	}

	// *
	//      * Notifies the group that the thread {@code t} has terminated.
	//      *
	//      * <p> Destroy the group if all of the following conditions are
	//      * true: this is a daemon thread group; there are no more alive
	//      * or unstarted threads in the group; there are no subgroups in
	//      * this thread group.
	//      *
	//      * @param  t
	//      *         the Thread that has terminated
	internal func threadTerminated(_ t: Thread!) {
	}

	// *
	//      * Removes the specified Thread from this group. Invoking this method
	//      * on a thread group that has been destroyed has no effect.
	//      *
	//      * @param  t
	//      *         the Thread to be removed
	private func remove(_ t: Thread!) {
	}

	// *
	//      * Prints information about this thread group to the standard
	//      * output. This method is useful only for debugging.
	//      *
	//      * @since   JDK1.0
	open func list() {
		list(System.out, 0)
	}

	internal func list(_ out: PrintStream!, _ indent: Int32) {
		var ngroupsSnapshot: Int32
		var groupsSnapshot: ThreadGroup![]
		for i in 0 ... ngroupsSnapshot - 1 {
			groupsSnapshot[i].list(out, indent)
		}
	}

	// *
	//      * Called by the Java Virtual Machine when a thread in this
	//      * thread group stops because of an uncaught exception, and the thread
	//      * does not have a specific {@link Thread.UncaughtExceptionHandler}
	//      * installed.
	//      * <p>
	//      * The <code>uncaughtException</code> method of
	//      * <code>ThreadGroup</code> does the following:
	//      * <ul>
	//      * <li>If this thread group has a parent thread group, the
	//      *     <code>uncaughtException</code> method of that parent is called
	//      *     with the same two arguments.
	//      * <li>Otherwise, this method checks to see if there is a
	//      *     {@linkplain Thread#getDefaultUncaughtExceptionHandler default
	//      *     uncaught exception handler} installed, and if so, its
	//      *     <code>uncaughtException</code> method is called with the same
	//      *     two arguments.
	//      * <li>Otherwise, this method determines if the <code>Throwable</code>
	//      *     argument is an instance of {@link ThreadDeath}. If so, nothing
	//      *     special is done. Otherwise, a message containing the
	//      *     thread's name, as returned from the thread's {@link
	//      *     Thread#getName getName} method, and a stack backtrace,
	//      *     using the <code>Throwable</code>'s {@link
	//      *     Throwable#printStackTrace printStackTrace} method, is
	//      *     printed to the {@linkplain System#err standard error stream}.
	//      * </ul>
	//      * <p>
	//      * Applications can override this method in subclasses of
	//      * <code>ThreadGroup</code> to provide alternative handling of
	//      * uncaught exceptions.
	//      *
	//      * @param   t   the thread that is about to exit.
	//      * @param   e   the uncaught exception.
	//      * @since   JDK1.0
	open func uncaughtException(_ t: Thread!, _ e: Throwable!) {
		if parent != nil {
			parent.uncaughtException(t, e)
		} else {
			var ueh: Thread.UncaughtExceptionHandler! = Thread.getDefaultUncaughtExceptionHandler()
			if ueh != nil {
				ueh.uncaughtException(t, e)
			} else {
				if !e is ThreadDeath! {
					System.err.print("Exception in thread \"" + t.getName() + "\" ")
					e.printStackTrace(System.err)
				}
			}
		}
	}

	// *
	//      * Used by VM to control lowmem implicit suspension.
	//      *
	//      * @param b boolean to allow or disallow suspension
	//      * @return true on success
	//      * @since   JDK1.1
	//      * @deprecated The definition of this call depends on {@link #suspend},
	//      *             which is deprecated.  Further, the behavior of this call
	//      *             was never specified.
	@Deprecated
	open func allowThreadSuspension(_ b: Bool) -> Bool {
		self.vmAllowSuspension = b
		if !b {
			VM.unsuspendSomeThreads()
		}
		return true
	}

	// *
	//      * Returns a string representation of this Thread group.
	//      *
	//      * @return  a string representation of this thread group.
	//      * @since   JDK1.0
	open func toString() -> String! {
		return getClass().getName() + "[name=" + getName() + ",maxpri=" + maxPriority + "]"
	}
}

