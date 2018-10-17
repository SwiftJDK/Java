//
//  CloneNotSupportedException.swift
//  JavaLang
//
//  Created by Alsey Coleman Miller on 10/17/18.
//

import Foundation

/**
 Thrown to indicate that the clone method in class Object has been called to clone an object, but that the object's class does not implement the Cloneable interface.
 
 Applications that override the clone method can also throw this exception to indicate that an object could not or should not be cloned.
 
 */
open class JavaLangCloneNotSupportedException: JavaLangException { }
