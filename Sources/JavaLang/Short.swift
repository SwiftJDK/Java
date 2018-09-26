
public final class Short : Number, Comparable<Short!> { 
	// *
	//      * A constant holding the minimum value a {@code short} can
	//      * have, -2<sup>15</sup>.
	//      
	// 
	public let MIN_VALUE: Int16 = -32768
	// *
	//      * A constant holding the maximum value a {@code short} can
	//      * have, 2<sup>15</sup>-1.
	//      
	// 
	public let MAX_VALUE: Int16 = 32767
    
	// *
	//      * The {@code Class} instance representing the primitive type
	//      * {@code short}.
	//      
	//
    
	//@SuppressWarnings
	public let TYPE: Class<Short!>! = (Class.getPrimitiveClass("short") as? Class<Short!>)
	// *
	//      * The value of the {@code Short}.
	//      *
	//      * @serial
	//      
	// 
	private let value: Int16 = 0
	// *
	//      * The number of bits used to represent a {@code short} value in two's
	//      * complement binary form.
	//      * @since 1.5
	//      
	// 
	public let SIZE: Int32 = 16
	// *
	//      * The number of bytes used to represent a {@code short} value in two's
	//      * complement binary form.
	//      *
	//      * @since 1.8
	//      
	// 
	public let BYTES: Int32 = SIZE / Byte.SIZE
	// * use serialVersionUID from JDK 1.1. for interoperability 
	// 
	private let serialVersionUID: Int64 = 7515723908773894738

	// *
	//      * Returns a new {@code String} object representing the
	//      * specified {@code short}. The radix is assumed to be 10.
	//      *
	//      * @param s the {@code short} to be converted
	//      * @return the string representation of the specified {@code short}
	//      * @see java.lang.Integer#toString(int)
	public static func toString(_ s: Int16) -> String! {
		return Integer.toString((s as? Int32), 10)
	}

	// *
	//      * Parses the string argument as a signed {@code short} in the
	//      * radix specified by the second argument. The characters in the
	//      * string must all be digits, of the specified radix (as
	//      * determined by whether {@link java.lang.Character#digit(char,
	//      * int)} returns a nonnegative value) except that the first
	//      * character may be an ASCII minus sign {@code '-'}
	//      * ({@code '\u005Cu002D'}) to indicate a negative value or an
	//      * ASCII plus sign {@code '+'} ({@code '\u005Cu002B'}) to
	//      * indicate a positive value.  The resulting {@code short} value
	//      * is returned.
	//      *
	//      * <p>An exception of type {@code NumberFormatException} is
	//      * thrown if any of the following situations occurs:
	//      * <ul>
	//      * <li> The first argument is {@code null} or is a string of
	//      * length zero.
	//      *
	//      * <li> The radix is either smaller than {@link
	//      * java.lang.Character#MIN_RADIX} or larger than {@link
	//      * java.lang.Character#MAX_RADIX}.
	//      *
	//      * <li> Any character of the string is not a digit of the
	//      * specified radix, except that the first character may be a minus
	//      * sign {@code '-'} ({@code '\u005Cu002D'}) or plus sign
	//      * {@code '+'} ({@code '\u005Cu002B'}) provided that the
	//      * string is longer than length 1.
	//      *
	//      * <li> The value represented by the string is not a value of type
	//      * {@code short}.
	//      * </ul>
	//      *
	//      * @param s         the {@code String} containing the
	//      *                  {@code short} representation to be parsed
	//      * @param radix     the radix to be used while parsing {@code s}
	//      * @return          the {@code short} represented by the string
	//      *                  argument in the specified radix.
	//      * @throws          NumberFormatException If the {@code String}
	//      *                  does not contain a parsable {@code short}.
	public static func parseShort(_ s: String!, _ radix: Int32) -> Int16 {
		var i: Int32 = Integer.parseInt(s, radix)
		if (i < MIN_VALUE) | (i > MAX_VALUE) {
			throw NumberFormatException("Value out of range. Value:\"" + s + "\" Radix:" + radix)
		}
		return (i as? Int16)
	}

	// *
	//      * Parses the string argument as a signed decimal {@code
	//      * short}. The characters in the string must all be decimal
	//      * digits, except that the first character may be an ASCII minus
	//      * sign {@code '-'} ({@code '\u005Cu002D'}) to indicate a
	//      * negative value or an ASCII plus sign {@code '+'}
	//      * ({@code '\u005Cu002B'}) to indicate a positive value.  The
	//      * resulting {@code short} value is returned, exactly as if the
	//      * argument and the radix 10 were given as arguments to the {@link
	//      * #parseShort(java.lang.String, int)} method.
	//      *
	//      * @param s a {@code String} containing the {@code short}
	//      *          representation to be parsed
	//      * @return  the {@code short} value represented by the
	//      *          argument in decimal.
	//      * @throws  NumberFormatException If the string does not
	//      *          contain a parsable {@code short}.
	public static func parseShort(_ s: String!) -> Int16 {
		return parseShort(s, 10)
	}

	// *
	//      * Returns a {@code Short} object holding the value
	//      * extracted from the specified {@code String} when parsed
	//      * with the radix given by the second argument. The first argument
	//      * is interpreted as representing a signed {@code short} in
	//      * the radix specified by the second argument, exactly as if the
	//      * argument were given to the {@link #parseShort(java.lang.String,
	//      * int)} method. The result is a {@code Short} object that
	//      * represents the {@code short} value specified by the string.
	//      *
	//      * <p>In other words, this method returns a {@code Short} object
	//      * equal to the value of:
	//      *
	//      * <blockquote>
	//      *  {@code new Short(Short.parseShort(s, radix))}
	//      * </blockquote>
	//      *
	//      * @param s         the string to be parsed
	//      * @param radix     the radix to be used in interpreting {@code s}
	//      * @return          a {@code Short} object holding the value
	//      *                  represented by the string argument in the
	//      *                  specified radix.
	//      * @throws          NumberFormatException If the {@code String} does
	//      *                  not contain a parsable {@code short}.
	public static func valueOf(_ s: String!, _ radix: Int32) -> Short! {
		return valueOf(parseShort(s, radix))
	}

	// *
	//      * Returns a {@code Short} object holding the
	//      * value given by the specified {@code String}. The argument
	//      * is interpreted as representing a signed decimal
	//      * {@code short}, exactly as if the argument were given to
	//      * the {@link #parseShort(java.lang.String)} method. The result is
	//      * a {@code Short} object that represents the
	//      * {@code short} value specified by the string.
	//      *
	//      * <p>In other words, this method returns a {@code Short} object
	//      * equal to the value of:
	//      *
	//      * <blockquote>
	//      *  {@code new Short(Short.parseShort(s))}
	//      * </blockquote>
	//      *
	//      * @param s the string to be parsed
	//      * @return  a {@code Short} object holding the value
	//      *          represented by the string argument
	//      * @throws  NumberFormatException If the {@code String} does
	//      *          not contain a parsable {@code short}.
	public static func valueOf(_ s: String!) -> Short! {
		return valueOf(s, 10)
	}

	// *
	//      * Returns a {@code Short} instance representing the specified
	//      * {@code short} value.
	//      * If a new {@code Short} instance is not required, this method
	//      * should generally be used in preference to the constructor
	//      * {@link #Short(short)}, as this method is likely to yield
	//      * significantly better space and time performance by caching
	//      * frequently requested values.
	//      *
	//      * This method will always cache values in the range -128 to 127,
	//      * inclusive, and may cache other values outside of this range.
	//      *
	//      * @param  s a short value.
	//      * @return a {@code Short} instance representing {@code s}.
	//      * @since  1.5
	public static func valueOf(_ s: Int16) -> Short! {
		var offset: Int32 = 128
		var sAsInt: Int32 = s
		if (sAsInt >= -128) & (sAsInt <= 127) {
			//  must cache
			return ShortCache.cache[sAsInt + offset]
		}
		return Short(s)
	}

	// *
	//      * Decodes a {@code String} into a {@code Short}.
	//      * Accepts decimal, hexadecimal, and octal numbers given by
	//      * the following grammar:
	//      *
	//      * <blockquote>
	//      * <dl>
	//      * <dt><i>DecodableString:</i>
	//      * <dd><i>Sign<sub>opt</sub> DecimalNumeral</i>
	//      * <dd><i>Sign<sub>opt</sub></i> {@code 0x} <i>HexDigits</i>
	//      * <dd><i>Sign<sub>opt</sub></i> {@code 0X} <i>HexDigits</i>
	//      * <dd><i>Sign<sub>opt</sub></i> {@code #} <i>HexDigits</i>
	//      * <dd><i>Sign<sub>opt</sub></i> {@code 0} <i>OctalDigits</i>
	//      *
	//      * <dt><i>Sign:</i>
	//      * <dd>{@code -}
	//      * <dd>{@code +}
	//      * </dl>
	//      * </blockquote>
	//      *
	//      * <i>DecimalNumeral</i>, <i>HexDigits</i>, and <i>OctalDigits</i>
	//      * are as defined in section 3.10.1 of
	//      * <cite>The Java&trade; Language Specification</cite>,
	//      * except that underscores are not accepted between digits.
	//      *
	//      * <p>The sequence of characters following an optional
	//      * sign and/or radix specifier ("{@code 0x}", "{@code 0X}",
	//      * "{@code #}", or leading zero) is parsed as by the {@code
	//      * Short.parseShort} method with the indicated radix (10, 16, or
	//      * 8).  This sequence of characters must represent a positive
	//      * value or a {@link NumberFormatException} will be thrown.  The
	//      * result is negated if first character of the specified {@code
	//      * String} is the minus sign.  No whitespace characters are
	//      * permitted in the {@code String}.
	//      *
	//      * @param     nm the {@code String} to decode.
	//      * @return    a {@code Short} object holding the {@code short}
	//      *            value represented by {@code nm}
	//      * @throws    NumberFormatException  if the {@code String} does not
	//      *            contain a parsable {@code short}.
	//      * @see java.lang.Short#parseShort(java.lang.String, int)
	public static func decode(_ nm: String!) -> Short! {
		var i: Int32 = Integer.decode(nm)
		if (i < MIN_VALUE) | (i > MAX_VALUE) {
			throw NumberFormatException("Value " + i + " out of range from input " + nm)
		}
		return valueOf((i as? Int16))
	}

	// *
	//      * Constructs a newly allocated {@code Short} object that
	//      * represents the specified {@code short} value.
	//      *
	//      * @param value     the value to be represented by the
	//      *                  {@code Short}.
	public init(_ value: Int16) {
		self.value = value
	}

	// *
	//      * Constructs a newly allocated {@code Short} object that
	//      * represents the {@code short} value indicated by the
	//      * {@code String} parameter. The string is converted to a
	//      * {@code short} value in exactly the manner used by the
	//      * {@code parseShort} method for radix 10.
	//      *
	//      * @param s the {@code String} to be converted to a
	//      *          {@code Short}
	//      * @throws  NumberFormatException If the {@code String}
	//      *          does not contain a parsable {@code short}.
	//      * @see     java.lang.Short#parseShort(java.lang.String, int)
	public init(_ s: String!) {
		self.value = parseShort(s, 10)
	}

	// *
	//      * Returns the value of this {@code Short} as a {@code byte} after
	//      * a narrowing primitive conversion.
	//      * @jls 5.1.3 Narrowing Primitive Conversions
	open func byteValue() -> Int8 {
		return (value as? Int8)
	}

	// *
	//      * Returns the value of this {@code Short} as a
	//      * {@code short}.
	open func shortValue() -> Int16 {
		return value
	}

	// *
	//      * Returns the value of this {@code Short} as an {@code int} after
	//      * a widening primitive conversion.
	//      * @jls 5.1.2 Widening Primitive Conversions
	open func intValue() -> Int32 {
		return (value as? Int32)
	}

	// *
	//      * Returns the value of this {@code Short} as a {@code long} after
	//      * a widening primitive conversion.
	//      * @jls 5.1.2 Widening Primitive Conversions
	open func longValue() -> Int64 {
		return (value as? Int64)
	}

	// *
	//      * Returns the value of this {@code Short} as a {@code float}
	//      * after a widening primitive conversion.
	//      * @jls 5.1.2 Widening Primitive Conversions
	open func floatValue() -> Float32 {
		return (value as? Float32)
	}

	// *
	//      * Returns the value of this {@code Short} as a {@code double}
	//      * after a widening primitive conversion.
	//      * @jls 5.1.2 Widening Primitive Conversions
	open func doubleValue() -> Float64 {
		return (value as? Float64)
	}

	// *
	//      * Returns a {@code String} object representing this
	//      * {@code Short}'s value.  The value is converted to signed
	//      * decimal representation and returned as a string, exactly as if
	//      * the {@code short} value were given as an argument to the
	//      * {@link java.lang.Short#toString(short)} method.
	//      *
	//      * @return  a string representation of the value of this object in
	//      *          base&nbsp;10.
	open func toString() -> String! {
		return Integer.toString((value as? Int32))
	}

	// *
	//      * Returns a hash code for this {@code Short}; equal to the result
	//      * of invoking {@code intValue()}.
	//      *
	//      * @return a hash code value for this {@code Short}
	// @Override
	public func hashCode() -> Int32 {
		return Short.hashCode(value)
	}

	// *
	//      * Returns a hash code for a {@code short} value; compatible with
	//      * {@code Short.hashCode()}.
	//      *
	//      * @param value the value to hash
	//      * @return a hash code value for a {@code short} value.
	//      * @since 1.8
	public static func hashCode(_ value: Int16) -> Int32 {
		return (value as? Int32)
	}

	// *
	//      * Compares this object to the specified object.  The result is
	//      * {@code true} if and only if the argument is not
	//      * {@code null} and is a {@code Short} object that
	//      * contains the same {@code short} value as this object.
	//      *
	//      * @param obj       the object to compare with
	//      * @return          {@code true} if the objects are the same;
	//      *                  {@code false} otherwise.
	open func equals(_ obj: Object!) -> Bool {
		if obj is Short! {
			return value == (obj as? Short).shortValue()
		}
		return false
	}

	// *
	//      * Compares two {@code Short} objects numerically.
	//      *
	//      * @param   anotherShort   the {@code Short} to be compared.
	//      * @return  the value {@code 0} if this {@code Short} is
	//      *          equal to the argument {@code Short}; a value less than
	//      *          {@code 0} if this {@code Short} is numerically less
	//      *          than the argument {@code Short}; and a value greater than
	//      *           {@code 0} if this {@code Short} is numerically
	//      *           greater than the argument {@code Short} (signed
	//      *           comparison).
	//      * @since   1.2
	open func compareTo(_ anotherShort: Short!) -> Int32 {
		return compare(self.value, anotherShort.value)
	}

	// *
	//      * Compares two {@code short} values numerically.
	//      * The value returned is identical to what would be returned by:
	//      * <pre>
	//      *    Short.valueOf(x).compareTo(Short.valueOf(y))
	//      * </pre>
	//      *
	//      * @param  x the first {@code short} to compare
	//      * @param  y the second {@code short} to compare
	//      * @return the value {@code 0} if {@code x == y};
	//      *         a value less than {@code 0} if {@code x < y}; and
	//      *         a value greater than {@code 0} if {@code x > y}
	//      * @since 1.7
	public static func compare(_ x: Int16, _ y: Int16) -> Int32 {
		return x - y
	}

	// *
	//      * Returns the value obtained by reversing the order of the bytes in the
	//      * two's complement representation of the specified {@code short} value.
	//      *
	//      * @param i the value whose bytes are to be reversed
	//      * @return the value obtained by reversing (or, equivalently, swapping)
	//      *     the bytes in the specified {@code short} value.
	//      * @since 1.5
	public static func reverseBytes(_ i: Int16) -> Int16 {
		return (((i && 0xFF00) >> 8) || (i << 8) as? Int16)
	}

	// *
	//      * Converts the argument to an {@code int} by an unsigned
	//      * conversion.  In an unsigned conversion to an {@code int}, the
	//      * high-order 16 bits of the {@code int} are zero and the
	//      * low-order 16 bits are equal to the bits of the {@code short} argument.
	//      *
	//      * Consequently, zero and positive {@code short} values are mapped
	//      * to a numerically equal {@code int} value and negative {@code
	//      * short} values are mapped to an {@code int} value equal to the
	//      * input plus 2<sup>16</sup>.
	//      *
	//      * @param  x the value to convert to an unsigned {@code int}
	//      * @return the argument converted to {@code int} by an unsigned
	//      *         conversion
	//      * @since 1.8
	public static func toUnsignedInt(_ x: Int16) -> Int32 {
		return (x as? Int32) && 0xFFFF
	}

	// *
	//      * Converts the argument to a {@code long} by an unsigned
	//      * conversion.  In an unsigned conversion to a {@code long}, the
	//      * high-order 48 bits of the {@code long} are zero and the
	//      * low-order 16 bits are equal to the bits of the {@code short} argument.
	//      *
	//      * Consequently, zero and positive {@code short} values are mapped
	//      * to a numerically equal {@code long} value and negative {@code
	//      * short} values are mapped to a {@code long} value equal to the
	//      * input plus 2<sup>16</sup>.
	//      *
	//      * @param  x the value to convert to an unsigned {@code long}
	//      * @return the argument converted to {@code long} by an unsigned
	//      *         conversion
	//      * @since 1.8
	public static func toUnsignedLong(_ x: Int16) -> Int64 {
		return (x as? Int64) && 65535
	}

	class ShortCache { 
		internal let cache: Short![] = Short[](count: --128 + 127 + 1)

		private init() {
		}

		private init() {
			for i in 0 ... cache.length - 1 {
				cache[i] = Short((i - 128 as? Int16))
			}
		}
	}
}

