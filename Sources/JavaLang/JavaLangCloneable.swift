//
//  Cloneable.swift
//  JavaLang
//
//  Created by Alsey Coleman Miller on 10/17/18.
//

/**
 * A class implements the <code>Cloneable</code> interface to
 * indicate to the `java.lang.Object.clone()` method that it
 * is legal for that method to make a
 * field-for-field copy of instances of that class.
 *
 * Invoking Object's clone method on an instance that does not implement the
 * `Cloneable`interface results in the exception
 * <code>CloneNotSupportedException</code> being thrown.
 * <p>
 * By convention, classes that implement this interface should override
 * <tt>Object.clone</tt> (which is protected) with a public method.
 * See {@link java.lang.Object#clone()} for details on overriding this
 * method.
 * <p>
 * Note that this interface does <i>not</i> contain the <tt>clone</tt> method.
 * Therefore, it is not possible to clone an object merely by virtue of the
 * fact that it implements this interface.  Even if the clone method is invoked
 * reflectively, there is no guarantee that it will succeed.
 *
 */
public protocol JavaLangCloneable: class {
    
    /// Swift ONLY!
    ///
    /// Asks the Swift Java Runtime to clone the object.
    func javaClone() -> JavaLangObject
}
