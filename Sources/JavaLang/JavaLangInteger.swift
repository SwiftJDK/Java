//
//  JavaLangInteger.swift
//  JavaLang
//
//  Created by Alsey Coleman Miller on 10/17/18.
//

/**
 * The {@code Integer} class wraps a value of the primitive type
 * {@code int} in an object. An object of type {@code Integer}
 * contains a single field whose type is {@code int}.
 *
 * <p>In addition, this class provides several methods for converting
 * an {@code int} to a {@code String} and a {@code String} to an
 * {@code int}, as well as other constants and methods useful when
 * dealing with an {@code int}.
 *
 * <p>Implementation note: The implementations of the "bit twiddling"
 * methods (such as {@link #highestOneBit(int) highestOneBit} and
 * {@link #numberOfTrailingZeros(int) numberOfTrailingZeros}) are
 * based on material from Henry S. Warren, Jr.'s <i>Hacker's
 * Delight</i>, (Addison Wesley, 2002).
 *
 */
public final class JavaLangInteger: JavaLangNumber {
    
    private let value: CInt
    
    public init(_ value: CInt) {
        
        self.value = value
    }
    
    public init(_ string: String) throws {
        
        fatalError()
    }
    
    open override func byteValue() -> UInt8 {
        return UInt8(value)
    }
    
    /**
     * Compares this object to the specified object.  The result is
     * {@code true} if and only if the argument is not
     * {@code null} and is an {@code Integer} object that
     * contains the same {@code int} value as this object.
     *
     * @param   obj   the object to compare with.
     * @return  {@code true} if the objects are the same;
     *          {@code false} otherwise.
     */
    public override func equals(_ other: JavaLangObject) throws -> Bool {
        
        guard let integer = other as? JavaLangInteger
            else { return false }
        
        return integer.value == self.value
    }
}
