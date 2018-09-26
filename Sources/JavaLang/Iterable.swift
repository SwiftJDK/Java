
// import java.util
// import java.util.function

public protocol Iterable { 
	// *
	//      * Returns an iterator over elements of type {@code T}.
	//      *
	//      * @return an Iterator.
	func iterator() -> Iterator<T!>!

	// *
	//      * Performs the given action for each element of the {@code Iterable}
	//      * until all elements have been processed or the action throws an
	//      * exception.  Unless otherwise specified by the implementing class,
	//      * actions are performed in the order of iteration (if an iteration order
	//      * is specified).  Exceptions thrown by the action are relayed to the
	//      * caller.
	//      *
	//      * @implSpec
	//      * <p>The default implementation behaves as if:
	//      * <pre>{@code
	//      *     for (T t : this)
	//      *         action.accept(t);
	//      * }</pre>
	//      *
	//      * @param action The action to be performed for each element
	//      * @throws NullPointerException if the specified action is null
	//      * @since 1.8
	func forEach(_ action: Consumer!)

	// *
	//      * Creates a {@link Spliterator} over the elements described by this
	//      * {@code Iterable}.
	//      *
	//      * @implSpec
	//      * The default implementation creates an
	//      * <em><a href="Spliterator.html#binding">early-binding</a></em>
	//      * spliterator from the iterable's {@code Iterator}.  The spliterator
	//      * inherits the <em>fail-fast</em> properties of the iterable's iterator.
	//      *
	//      * @implNote
	//      * The default implementation should usually be overridden.  The
	//      * spliterator returned by the default implementation has poor splitting
	//      * capabilities, is unsized, and does not report any spliterator
	//      * characteristics. Implementing classes can nearly always provide a
	//      * better implementation.
	//      *
	//      * @return a {@code Spliterator} over the elements described by this
	//      * {@code Iterable}.
	//      * @since 1.8
	func spliterator() -> Spliterator<T!>!
}

