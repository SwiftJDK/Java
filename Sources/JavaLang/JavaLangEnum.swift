//
//  JavaLangEnum.swift
//  JavaLang
//
//  Created by Alsey Coleman Miller on 10/17/18.
//

/**
 * This is the common base class of all Java language enumeration types.
 *
 * More information about enums, including descriptions of the
 * implicitly declared methods synthesized by the compiler, can be
 * found in section 8.9 of
 * <cite>The Java&trade; Language Specification</cite>.
 *
 * <p> Note that when using an enumeration type as the type of a set
 * or as the type of the keys in a map, specialized and efficient
 * {@linkplain java.util.EnumSet set} and {@linkplain
 * java.util.EnumMap map} implementations are available.
 */
open class JavaLangEnum: JavaLangObject {
    
    /*!
     @brief The name of this enum constant, as declared in the enum declaration.
     Most programmers should use the `toString` method rather than
     accessing this field.
     */
    public let name: String
    
    /*!
     The ordinal of this enumeration constant (its position
     in the enum declaration, where the initial constant is assigned
     an ordinal of zero).
     Most programmers will have no use for this field.  It is designed
     for use by sophisticated enum-based data structures, such as
     `java.util.EnumSet` and `java.util.EnumMap`.
     */
    public let ordinal: CInt
    
    /**
     * Sole constructor.  Programmers cannot invoke this constructor.
     * It is for use by code emitted by the compiler in response to
     * enum type declarations.
     *
     * @param name - The name of this enum constant, which is the identifier
     *               used to declare it.
     * @param ordinal - The ordinal of this enumeration constant (its position
     *         in the enum declaration, where the initial constant is assigned
     *         an ordinal of zero).
     */
    public init(name: String, ordinal: CInt) {
        
        self.name = name
        self.ordinal = ordinal
    }
    
    /**
     * Returns the name of this enum constant, as contained in the
     * declaration.  This method may be overridden, though it typically
     * isn't necessary or desirable.  An enum type should override this
     * method when a more "programmer-friendly" string form exists.
     *
     * @return the name of this enum constant
     */
    open override func toString() -> String {
        return name
    }
}
