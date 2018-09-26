public final class Byte : Number, Comparable<Byte!> {
	// *
	//      * A constant holding the minimum value a {@code byte} can
	//      * have, -2<sup>7</sup>.
	//      
	// 
	public let MIN_VALUE: Int8 = -128
	// *
	//      * A constant holding the maximum value a {@code byte} can
	//      * have, 2<sup>7</sup>-1.
	//      
	// 
	public let MAX_VALUE: Int8 = 127
	// *
	//      * The {@code Class} instance representing the primitive type
	//      * {@code byte}.
	//      
	// 
	
    // @SuppressWarnings
	public let TYPE: Class<Byte!>! = (Class.getPrimitiveClass("byte") as? Class<Byte!>)
	// *
	//      * The value of the {@code Byte}.
	//      *
	//      * @serial
	//      
	// 
	private let value: Int8 = 0
	// *
	//      * The number of bits used to represent a {@code byte} value in two's
	//      * complement binary form.
	//      *
	//      * @since 1.5
	//      
	// 
	public let SIZE: Int32 = 8
	// *
	//      * The number of bytes used to represent a {@code byte} value in two's
	//      * complement binary form.
	//      *
	//      * @since 1.8
	//      
	// 
	public let BYTES: Int32 = SIZE / Byte.SIZE
	// * use serialVersionUID from JDK 1.1. for interoperability 
	// 
	private let serialVersionUID: Int64 = -7183698231559129828
	private let DIGITS: [AnsiChar] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
	private let UPPER_CASE_DIGITS: [AnsiChar] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

	// *
	//      * Returns a new {@code String} object representing the
	//      * specified {@code byte}. The radix is assumed to be 10.
	//      *
	//      * @param b the {@code byte} to be converted
	//      * @return the string representation of the specified {@code byte}
	//      * @see java.lang.Integer#toString(int)
	public static func toString(_ b: Int8) -> String! {
		return Integer.toString((b as? Int32), 10)
	}

	// *
	//      * Returns a {@code Byte} instance representing the specified
	//      * {@code byte} value.
	//      * If a new {@code Byte} instance is not required, this method
	//      * should generally be used in preference to the constructor
	//      * {@link #Byte(byte)}, as this method is likely to yield
	//      * significantly better space and time performance since
	//      * all byte values are cached.
	//      *
	//      * @param  b a byte value.
	//      * @return a {@code Byte} instance representing {@code b}.
	//      * @since  1.5
	public static func valueOf(_ b: Int8) -> Byte! {
		var offset: Int32 = 128
		return ByteCache.cache[(b as? Int32) + offset]
	}

	// *
	//      * Parses the string argument as a signed {@code byte} in the
	//      * radix specified by the second argument. The characters in the
	//      * string must all be digits, of the specified radix (as
	//      * determined by whether {@link java.lang.Character#digit(char,
	//      * int)} returns a nonnegative value) except that the first
	//      * character may be an ASCII minus sign {@code '-'}
	//      * ({@code '\u005Cu002D'}) to indicate a negative value or an
	//      * ASCII plus sign {@code '+'} ({@code '\u005Cu002B'}) to
	//      * indicate a positive value.  The resulting {@code byte} value is
	//      * returned.
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
	//      * {@code byte}.
	//      * </ul>
	//      *
	//      * @param s         the {@code String} containing the
	//      *                  {@code byte}
	//      *                  representation to be parsed
	//      * @param radix     the radix to be used while parsing {@code s}
	//      * @return          the {@code byte} value represented by the string
	//      *                   argument in the specified radix
	//      * @throws          NumberFormatException If the string does
	//      *                  not contain a parsable {@code byte}.
	public static func parseByte(_ s: String!, _ radix: Int32) -> Int8 {
		var i: Int32 = Integer.parseInt(s, radix)
		if (i < MIN_VALUE) | (i > MAX_VALUE) {
			throw NumberFormatException("Value out of range. Value:\"" + s + "\" Radix:" + radix)
		}
		return (i as? Int8)
	}

	// *
	//      * Parses the string argument as a signed decimal {@code
	//      * byte}. The characters in the string must all be decimal digits,
	//      * except that the first character may be an ASCII minus sign
	//      * {@code '-'} ({@code '\u005Cu002D'}) to indicate a negative
	//      * value or an ASCII plus sign {@code '+'}
	//      * ({@code '\u005Cu002B'}) to indicate a positive value. The
	//      * resulting {@code byte} value is returned, exactly as if the
	//      * argument and the radix 10 were given as arguments to the {@link
	//      * #parseByte(java.lang.String, int)} method.
	//      *
	//      * @param s         a {@code String} containing the
	//      *                  {@code byte} representation to be parsed
	//      * @return          the {@code byte} value represented by the
	//      *                  argument in decimal
	//      * @throws          NumberFormatException if the string does not
	//      *                  contain a parsable {@code byte}.
	public static func parseByte(_ s: String!) -> Int8 {
		return parseByte(s, 10)
	}

	// *
	//      * Returns a {@code Byte} object holding the value
	//      * extracted from the specified {@code String} when parsed
	//      * with the radix given by the second argument. The first argument
	//      * is interpreted as representing a signed {@code byte} in
	//      * the radix specified by the second argument, exactly as if the
	//      * argument were given to the {@link #parseByte(java.lang.String,
	//      * int)} method. The result is a {@code Byte} object that
	//      * represents the {@code byte} value specified by the string.
	//      *
	//      * <p> In other words, this method returns a {@code Byte} object
	//      * equal to the value of:
	//      *
	//      * <blockquote>
	//      * {@code new Byte(Byte.parseByte(s, radix))}
	//      * </blockquote>
	//      *
	//      * @param s         the string to be parsed
	//      * @param radix     the radix to be used in interpreting {@code s}
	//      * @return          a {@code Byte} object holding the value
	//      *                  represented by the string argument in the
	//      *                  specified radix.
	//      * @throws          NumberFormatException If the {@code String} does
	//      *                  not contain a parsable {@code byte}.
	public static func valueOf(_ s: String!, _ radix: Int32) -> Byte! {
		return valueOf(parseByte(s, radix))
	}

	// *
	//      * Returns a {@code Byte} object holding the value
	//      * given by the specified {@code String}. The argument is
	//      * interpreted as representing a signed decimal {@code byte},
	//      * exactly as if the argument were given to the {@link
	//      * #parseByte(java.lang.String)} method. The result is a
	//      * {@code Byte} object that represents the {@code byte}
	//      * value specified by the string.
	//      *
	//      * <p> In other words, this method returns a {@code Byte} object
	//      * equal to the value of:
	//      *
	//      * <blockquote>
	//      * {@code new Byte(Byte.parseByte(s))}
	//      * </blockquote>
	//      *
	//      * @param s         the string to be parsed
	//      * @return          a {@code Byte} object holding the value
	//      *                  represented by the string argument
	//      * @throws          NumberFormatException If the {@code String} does
	//      *                  not contain a parsable {@code byte}.
	public static func valueOf(_ s: String!) -> Byte! {
		return valueOf(s, 10)
	}

	// *
	//      * Decodes a {@code String} into a {@code Byte}.
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
	//      * Byte.parseByte} method with the indicated radix (10, 16, or 8).
	//      * This sequence of characters must represent a positive value or
	//      * a {@link NumberFormatException} will be thrown.  The result is
	//      * negated if first character of the specified {@code String} is
	//      * the minus sign.  No whitespace characters are permitted in the
	//      * {@code String}.
	//      *
	//      * @param     nm the {@code String} to decode.
	//      * @return   a {@code Byte} object holding the {@code byte}
	//      *          value represented by {@code nm}
	//      * @throws  NumberFormatException  if the {@code String} does not
	//      *            contain a parsable {@code byte}.
	//      * @see java.lang.Byte#parseByte(java.lang.String, int)
	public static func decode(_ nm: String!) -> Byte! {
		var i: Int32 = Integer.decode(nm)
		if (i < MIN_VALUE) | (i > MAX_VALUE) {
			throw NumberFormatException("Value " + i + " out of range from input " + nm)
		}
		return valueOf((i as? Int8))
	}

	// *
	//      * Constructs a newly allocated {@code Byte} object that
	//      * represents the specified {@code byte} value.
	//      *
	//      * @param value     the value to be represented by the
	//      *                  {@code Byte}.
	public init(_ value: Int8) {
		self.value = value
	}

	// *
	//      * Constructs a newly allocated {@code Byte} object that
	//      * represents the {@code byte} value indicated by the
	//      * {@code String} parameter. The string is converted to a
	//      * {@code byte} value in exactly the manner used by the
	//      * {@code parseByte} method for radix 10.
	//      *
	//      * @param s         the {@code String} to be converted to a
	//      *                  {@code Byte}
	//      * @throws           NumberFormatException If the {@code String}
	//      *                  does not contain a parsable {@code byte}.
	//      * @see        java.lang.Byte#parseByte(java.lang.String, int)
	public init(_ s: String!) {
		self.value = parseByte(s, 10)
	}

	// *
	//      * Returns the value of this {@code Byte} as a
	//      * {@code byte}.
	open func byteValue() -> Int8 {
		return value
	}

	// *
	//      * Returns the value of this {@code Byte} as a {@code short} after
	//      * a widening primitive conversion.
	//      * @jls 5.1.2 Widening Primitive Conversions
	open func shortValue() -> Int16 {
		return (value as? Int16)
	}

	// *
	//      * Returns the value of this {@code Byte} as an {@code int} after
	//      * a widening primitive conversion.
	//      * @jls 5.1.2 Widening Primitive Conversions
	open func intValue() -> Int32 {
		return (value as? Int32)
	}

	// *
	//      * Returns the value of this {@code Byte} as a {@code long} after
	//      * a widening primitive conversion.
	//      * @jls 5.1.2 Widening Primitive Conversions
	open func longValue() -> Int64 {
		return (value as? Int64)
	}

	// *
	//      * Returns the value of this {@code Byte} as a {@code float} after
	//      * a widening primitive conversion.
	//      * @jls 5.1.2 Widening Primitive Conversions
	open func floatValue() -> Float32 {
		return (value as? Float32)
	}

	// *
	//      * Returns the value of this {@code Byte} as a {@code double}
	//      * after a widening primitive conversion.
	//      * @jls 5.1.2 Widening Primitive Conversions
	open func doubleValue() -> Float64 {
		return (value as? Float64)
	}

	// *
	//      * Returns a {@code String} object representing this
	//      * {@code Byte}'s value.  The value is converted to signed
	//      * decimal representation and returned as a string, exactly as if
	//      * the {@code byte} value were given as an argument to the
	//      * {@link java.lang.Byte#toString(byte)} method.
	//      *
	//      * @return  a string representation of the value of this object in
	//      *          base&nbsp;10.
	open func toString() -> String! {
		return Integer.toString((value as? Int32))
	}

	// *
	//      * Returns a hash code for this {@code Byte}; equal to the result
	//      * of invoking {@code intValue()}.
	//      *
	//      * @return a hash code value for this {@code Byte}
	// @Override
	public func hashCode() -> Int32 {
		return Byte.hashCode(value)
	}

	// *
	//      * Returns a hash code for a {@code byte} value; compatible with
	//      * {@code Byte.hashCode()}.
	//      *
	//      * @param value the value to hash
	//      * @return a hash code value for a {@code byte} value.
	//      * @since 1.8
	public static func hashCode(_ value: Int8) -> Int32 {
		return (value as? Int32)
	}

	// *
	//      * Compares this object to the specified object.  The result is
	//      * {@code true} if and only if the argument is not
	//      * {@code null} and is a {@code Byte} object that
	//      * contains the same {@code byte} value as this object.
	//      *
	//      * @param obj       the object to compare with
	//      * @return          {@code true} if the objects are the same;
	//      *                  {@code false} otherwise.
	open func equals(_ obj: Object!) -> Bool {
		if obj is Byte! {
			return value == (obj as? Byte).byteValue()
		}
		return false
	}

	// *
	//      * Compares two {@code Byte} objects numerically.
	//      *
	//      * @param   anotherByte   the {@code Byte} to be compared.
	//      * @return  the value {@code 0} if this {@code Byte} is
	//      *          equal to the argument {@code Byte}; a value less than
	//      *          {@code 0} if this {@code Byte} is numerically less
	//      *          than the argument {@code Byte}; and a value greater than
	//      *           {@code 0} if this {@code Byte} is numerically
	//      *           greater than the argument {@code Byte} (signed
	//      *           comparison).
	//      * @since   1.2
	open func compareTo(_ anotherByte: Byte!) -> Int32 {
		return compare(self.value, anotherByte.value)
	}

	// *
	//      * Compares two {@code byte} values numerically.
	//      * The value returned is identical to what would be returned by:
	//      * <pre>
	//      *    Byte.valueOf(x).compareTo(Byte.valueOf(y))
	//      * </pre>
	//      *
	//      * @param  x the first {@code byte} to compare
	//      * @param  y the second {@code byte} to compare
	//      * @return the value {@code 0} if {@code x == y};
	//      *         a value less than {@code 0} if {@code x < y}; and
	//      *         a value greater than {@code 0} if {@code x > y}
	//      * @since 1.7
	public static func compare(_ x: Int8, _ y: Int8) -> Int32 {
		return x - y
	}

	// *
	//      * Converts the argument to an {@code int} by an unsigned
	//      * conversion.  In an unsigned conversion to an {@code int}, the
	//      * high-order 24 bits of the {@code int} are zero and the
	//      * low-order 8 bits are equal to the bits of the {@code byte} argument.
	//      *
	//      * Consequently, zero and positive {@code byte} values are mapped
	//      * to a numerically equal {@code int} value and negative {@code
	//      * byte} values are mapped to an {@code int} value equal to the
	//      * input plus 2<sup>8</sup>.
	//      *
	//      * @param  x the value to convert to an unsigned {@code int}
	//      * @return the argument converted to {@code int} by an unsigned
	//      *         conversion
	//      * @since 1.8
	public static func toUnsignedInt(_ x: Int8) -> Int32 {
		return (x as? Int32) && 0xFF
	}

	// *
	//      * Converts the argument to a {@code long} by an unsigned
	//      * conversion.  In an unsigned conversion to a {@code long}, the
	//      * high-order 56 bits of the {@code long} are zero and the
	//      * low-order 8 bits are equal to the bits of the {@code byte} argument.
	//      *
	//      * Consequently, zero and positive {@code byte} values are mapped
	//      * to a numerically equal {@code long} value and negative {@code
	//      * byte} values are mapped to a {@code long} value equal to the
	//      * input plus 2<sup>8</sup>.
	//      *
	//      * @param  x the value to convert to an unsigned {@code long}
	//      * @return the argument converted to {@code long} by an unsigned
	//      *         conversion
	//      * @since 1.8
	public static func toUnsignedLong(_ x: Int8) -> Int64 {
		return (x as? Int64) && 255
	}

	// BEGIN Android-added: toHexString() for internal use.
	// *
	//      * @hide
	public static func toHexString(_ b: Int8, _ upperCase: Bool) -> String! {
		var digits: [AnsiChar] = (upperCase ? UPPER_CASE_DIGITS : DIGITS)
		var buf: [AnsiChar] = [AnsiChar](count: 2)
		//  We always want two digits.
		buf[0] = digits[(b >> 4) && 0x000000000000000F]
		buf[1] = digits[b && 0x000000000000000F]
		return String(0, 2, buf)
	}

	class ByteCache { 
		internal let cache: Byte![] = Byte[](count: --128 + 127 + 1)

		private init() {
		}

		private init() {
			for i in 0 ... cache.length - 1 {
				cache[i] = Byte((i - 128 as? Int8))
			}
		}
	}
}

