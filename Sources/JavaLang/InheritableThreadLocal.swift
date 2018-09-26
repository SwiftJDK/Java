
open class InheritableThreadLocal : ThreadLocal<T!> { 
	// *
	//      * Computes the child's initial value for this inheritable thread-local
	//      * variable as a function of the parent's value at the time the child
	//      * thread is created.  This method is called from within the parent
	//      * thread before the child is started.
	//      * <p>
	//      * This method merely returns its input argument, and should be overridden
	//      * if a different behavior is desired.
	//      *
	//      * @param parentValue the parent thread's value
	//      * @return the child thread's initial value
	open func childValue(_ parentValue: T!) -> T! {
		return parentValue
	}

	// *
	//      * Get the map associated with a ThreadLocal.
	//      *
	//      * @param t the current thread
	internal func getMap(_ t: Thread!) -> ThreadLocalMap! {
		return t.inheritableThreadLocals
	}

	// *
	//      * Create the map associated with a ThreadLocal.
	//      *
	//      * @param t the current thread
	//      * @param firstValue value for the initial entry of the table.
	internal func createMap(_ t: Thread!, _ firstValue: T!) {
		t.inheritableThreadLocals = ThreadLocalMap(self, firstValue)
	}
}

