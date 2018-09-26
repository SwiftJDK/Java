
// import java.util

public final class Character : java.io.Serializable, Comparable<Character!> { 
	// *
	//      * The minimum radix available for conversion to and from strings.
	//      * The constant value of this field is the smallest value permitted
	//      * for the radix argument in radix-conversion methods such as the
	//      * {@code digit} method, the {@code forDigit} method, and the
	//      * {@code toString} method of class {@code Integer}.
	//      *
	//      * @see     Character#digit(char, int)
	//      * @see     Character#forDigit(int, int)
	//      * @see     Integer#toString(int, int)
	//      * @see     Integer#valueOf(String)
	//      
	// 
	public let MIN_RADIX: Int32 = 2
	// *
	//      * The maximum radix available for conversion to and from strings.
	//      * The constant value of this field is the largest value permitted
	//      * for the radix argument in radix-conversion methods such as the
	//      * {@code digit} method, the {@code forDigit} method, and the
	//      * {@code toString} method of class {@code Integer}.
	//      *
	//      * @see     Character#digit(char, int)
	//      * @see     Character#forDigit(int, int)
	//      * @see     Integer#toString(int, int)
	//      * @see     Integer#valueOf(String)
	//      
	// 
	public let MAX_RADIX: Int32 = 36
	// *
	//      * The constant value of this field is the smallest value of type
	//      * {@code char}, {@code '\u005Cu0000'}.
	//      *
	//      * @since   1.0.2
	//      
	// 
	public let MIN_VALUE: AnsiChar = "\0"
    
	// *
	//      * The constant value of this field is the largest value of type
	//      * {@code char}, {@code '\u005CuFFFF'}.
	//      *
	//      * @since   1.0.2
	//      
	// 
	public let MAX_VALUE: AnsiChar = "" //"\u{FFFF"
	
	// 
	//      * Normative general types
	//      
	// 
	//      * General character types
	//      
	// *
	//      * General category "Cn" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let UNASSIGNED: Int8 = 0
	// *
	//      * General category "Lu" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let UPPERCASE_LETTER: Int8 = 1
	// *
	//      * General category "Ll" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let LOWERCASE_LETTER: Int8 = 2
	// *
	//      * General category "Lt" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let TITLECASE_LETTER: Int8 = 3
	// *
	//      * General category "Lm" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let MODIFIER_LETTER: Int8 = 4
	// *
	//      * General category "Lo" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let OTHER_LETTER: Int8 = 5
	// *
	//      * General category "Mn" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let NON_SPACING_MARK: Int8 = 6
	// *
	//      * General category "Me" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let ENCLOSING_MARK: Int8 = 7
	// *
	//      * General category "Mc" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let COMBINING_SPACING_MARK: Int8 = 8
	// *
	//      * General category "Nd" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let DECIMAL_DIGIT_NUMBER: Int8 = 9
	// *
	//      * General category "Nl" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let LETTER_NUMBER: Int8 = 10
	// *
	//      * General category "No" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let OTHER_NUMBER: Int8 = 11
	// *
	//      * General category "Zs" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let SPACE_SEPARATOR: Int8 = 12
	// *
	//      * General category "Zl" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let LINE_SEPARATOR: Int8 = 13
	// *
	//      * General category "Zp" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let PARAGRAPH_SEPARATOR: Int8 = 14
	// *
	//      * General category "Cc" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let CONTROL: Int8 = 15
	// *
	//      * General category "Cf" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let FORMAT: Int8 = 16
	// *
	//      * General category "Co" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let PRIVATE_USE: Int8 = 18
	// *
	//      * General category "Cs" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let SURROGATE: Int8 = 19
	// *
	//      * General category "Pd" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let DASH_PUNCTUATION: Int8 = 20
	// *
	//      * General category "Ps" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let START_PUNCTUATION: Int8 = 21
	// *
	//      * General category "Pe" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let END_PUNCTUATION: Int8 = 22
	// *
	//      * General category "Pc" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let CONNECTOR_PUNCTUATION: Int8 = 23
	// *
	//      * General category "Po" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let OTHER_PUNCTUATION: Int8 = 24
	// *
	//      * General category "Sm" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let MATH_SYMBOL: Int8 = 25
	// *
	//      * General category "Sc" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let CURRENCY_SYMBOL: Int8 = 26
	// *
	//      * General category "Sk" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let MODIFIER_SYMBOL: Int8 = 27
	// *
	//      * General category "So" in the Unicode specification.
	//      * @since   1.1
	//      
	// 
	public let OTHER_SYMBOL: Int8 = 28
	// *
	//      * General category "Pi" in the Unicode specification.
	//      * @since   1.4
	//      
	// 
	public let INITIAL_QUOTE_PUNCTUATION: Int8 = 29
	// *
	//      * General category "Pf" in the Unicode specification.
	//      * @since   1.4
	//      
	// 
	public let FINAL_QUOTE_PUNCTUATION: Int8 = 30
	// *
	//      * Error flag. Use int (code point) to avoid confusion with U+FFFF.
	//      
	// 
	internal let ERROR: Int32 = 4294967295
	// *
	//      * Undefined bidirectional character type. Undefined {@code char}
	//      * values have undefined directionality in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_UNDEFINED: Int8 = -1
	// *
	//      * Strong bidirectional character type "L" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_LEFT_TO_RIGHT: Int8 = 0
	// *
	//      * Strong bidirectional character type "R" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_RIGHT_TO_LEFT: Int8 = 1
	// *
	//     * Strong bidirectional character type "AL" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC: Int8 = 2
	// *
	//      * Weak bidirectional character type "EN" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_EUROPEAN_NUMBER: Int8 = 3
	// *
	//      * Weak bidirectional character type "ES" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_EUROPEAN_NUMBER_SEPARATOR: Int8 = 4
	// *
	//      * Weak bidirectional character type "ET" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_EUROPEAN_NUMBER_TERMINATOR: Int8 = 5
	// *
	//      * Weak bidirectional character type "AN" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_ARABIC_NUMBER: Int8 = 6
	// *
	//      * Weak bidirectional character type "CS" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_COMMON_NUMBER_SEPARATOR: Int8 = 7
	// *
	//      * Weak bidirectional character type "NSM" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_NONSPACING_MARK: Int8 = 8
	// *
	//      * Weak bidirectional character type "BN" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_BOUNDARY_NEUTRAL: Int8 = 9
	// *
	//      * Neutral bidirectional character type "B" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_PARAGRAPH_SEPARATOR: Int8 = 10
	// *
	//      * Neutral bidirectional character type "S" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_SEGMENT_SEPARATOR: Int8 = 11
	// *
	//      * Neutral bidirectional character type "WS" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_WHITESPACE: Int8 = 12
	// *
	//      * Neutral bidirectional character type "ON" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_OTHER_NEUTRALS: Int8 = 13
	// *
	//      * Strong bidirectional character type "LRE" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_LEFT_TO_RIGHT_EMBEDDING: Int8 = 14
	// *
	//      * Strong bidirectional character type "LRO" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_LEFT_TO_RIGHT_OVERRIDE: Int8 = 15
	// *
	//      * Strong bidirectional character type "RLE" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_RIGHT_TO_LEFT_EMBEDDING: Int8 = 16
	// *
	//      * Strong bidirectional character type "RLO" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_RIGHT_TO_LEFT_OVERRIDE: Int8 = 17
	// *
	//      * Weak bidirectional character type "PDF" in the Unicode specification.
	//      * @since 1.4
	//      
	// 
	public let DIRECTIONALITY_POP_DIRECTIONAL_FORMAT: Int8 = 18
	// *
	//      * The minimum value of a
	//      * <a href="http://www.unicode.org/glossary/#high_surrogate_code_unit">
	//      * Unicode high-surrogate code unit</a>
	//      * in the UTF-16 encoding, constant {@code '\u005CuD800'}.
	//      * A high-surrogate is also known as a <i>leading-surrogate</i>.
	//      *
	//      * @since 1.5
	//      
	// 
    public let MIN_HIGH_SURROGATE: AnsiChar = "" //"\u{D800"
	// *
	//      * The maximum value of a
	//      * <a href="http://www.unicode.org/glossary/#high_surrogate_code_unit">
	//      * Unicode high-surrogate code unit</a>
	//      * in the UTF-16 encoding, constant {@code '\u005CuDBFF'}.
	//      * A high-surrogate is also known as a <i>leading-surrogate</i>.
	//      *
	//      * @since 1.5
	//      
	// 
	public let MAX_HIGH_SURROGATE: AnsiChar = "" //"\u{DBFF"
	// *
	//      * The minimum value of a
	//      * <a href="http://www.unicode.org/glossary/#low_surrogate_code_unit">
	//      * Unicode low-surrogate code unit</a>
	//      * in the UTF-16 encoding, constant {@code '\u005CuDC00'}.
	//      * A low-surrogate is also known as a <i>trailing-surrogate</i>.
	//      *
	//      * @since 1.5
	//      
	// 
	public let MIN_LOW_SURROGATE: AnsiChar = "" //"\u{DC00"
	// *
	//      * The maximum value of a
	//      * <a href="http://www.unicode.org/glossary/#low_surrogate_code_unit">
	//      * Unicode low-surrogate code unit</a>
	//      * in the UTF-16 encoding, constant {@code '\u005CuDFFF'}.
	//      * A low-surrogate is also known as a <i>trailing-surrogate</i>.
	//      *
	//      * @since 1.5
	//      
	// 
	public let MAX_LOW_SURROGATE: AnsiChar = "" //"\u{DFFF"
	// *
	//      * The minimum value of a Unicode surrogate code unit in the
	//      * UTF-16 encoding, constant {@code '\u005CuD800'}.
	//      *
	//      * @since 1.5
	//      
	// 
	public let MIN_SURROGATE: AnsiChar = MIN_HIGH_SURROGATE
	// *
	//      * The maximum value of a Unicode surrogate code unit in the
	//      * UTF-16 encoding, constant {@code '\u005CuDFFF'}.
	//      *
	//      * @since 1.5
	//      
	// 
	public let MAX_SURROGATE: AnsiChar = MAX_LOW_SURROGATE
	// *
	//      * The minimum value of a
	//      * <a href="http://www.unicode.org/glossary/#supplementary_code_point">
	//      * Unicode supplementary code point</a>, constant {@code U+10000}.
	//      *
	//      * @since 1.5
	//      
	// 
	public let MIN_SUPPLEMENTARY_CODE_POINT: Int32 = 0x10000
	// *
	//      * The minimum value of a
	//      * <a href="http://www.unicode.org/glossary/#code_point">
	//      * Unicode code point</a>, constant {@code U+0000}.
	//      *
	//      * @since 1.5
	//      
	// 
	public let MIN_CODE_POINT: Int32 = 0
	// *
	//      * The maximum value of a
	//      * <a href="http://www.unicode.org/glossary/#code_point">
	//      * Unicode code point</a>, constant {@code U+10FFFF}.
	//      *
	//      * @since 1.5
	//      
	// 
	public let MAX_CODE_POINT: Int32 = 0x10FFFF
    
	private let DIRECTIONALITY: [Int8] = ([DIRECTIONALITY_LEFT_TO_RIGHT, DIRECTIONALITY_RIGHT_TO_LEFT, DIRECTIONALITY_EUROPEAN_NUMBER, DIRECTIONALITY_EUROPEAN_NUMBER_SEPARATOR, DIRECTIONALITY_EUROPEAN_NUMBER_TERMINATOR, DIRECTIONALITY_ARABIC_NUMBER, DIRECTIONALITY_COMMON_NUMBER_SEPARATOR, DIRECTIONALITY_PARAGRAPH_SEPARATOR, DIRECTIONALITY_SEGMENT_SEPARATOR, DIRECTIONALITY_WHITESPACE, DIRECTIONALITY_OTHER_NEUTRALS, DIRECTIONALITY_LEFT_TO_RIGHT_EMBEDDING, DIRECTIONALITY_LEFT_TO_RIGHT_OVERRIDE, DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC, DIRECTIONALITY_RIGHT_TO_LEFT_EMBEDDING, DIRECTIONALITY_RIGHT_TO_LEFT_OVERRIDE, DIRECTIONALITY_POP_DIRECTIONAL_FORMAT, DIRECTIONALITY_NONSPACING_MARK, DIRECTIONALITY_BOUNDARY_NEUTRAL] as? Int8[])
	// *
	//      * The value of the {@code Character}.
	//      *
	//      * @serial
	//      
	// 
	private let value: AnsiChar = "\0"
	// * use serialVersionUID from JDK 1.0.2 for interoperability 
	// 
	private let serialVersionUID: Int64 = 3786198910865385080
	// *
	//      * The number of bits used to represent a <tt>char</tt> value in unsigned
	//      * binary form, constant {@code 16}.
	//      *
	//      * @since 1.5
	//      
	// 
	public let SIZE: Int32 = 16
	// *
	//      * The number of bytes used to represent a {@code char} value in unsigned
	//      * binary form.
	//      *
	//      * @since 1.8
	//      
	// 
	public let BYTES: Int32 = SIZE / Byte.SIZE

	// *
	//      * Constructs a newly allocated {@code Character} object that
	//      * represents the specified {@code char} value.
	//      *
	//      * @param  value   the value to be represented by the
	//      *                  {@code Character} object.
	public init(_ value: AnsiChar) {
		self.value = value
	}

	// *
	//      * Returns a <tt>Character</tt> instance representing the specified
	//      * <tt>char</tt> value.
	//      * If a new <tt>Character</tt> instance is not required, this method
	//      * should generally be used in preference to the constructor
	//      * {@link #Character(char)}, as this method is likely to yield
	//      * significantly better space and time performance by caching
	//      * frequently requested values.
	//      *
	//      * This method will always cache values in the range {@code
	//      * '\u005Cu0000'} to {@code '\u005Cu007F'}, inclusive, and may
	//      * cache other values outside of this range.
	//      *
	//      * @param  c a char value.
	//      * @return a <tt>Character</tt> instance representing <tt>c</tt>.
	//      * @since  1.5
	public static func valueOf(_ c: AnsiChar) -> Character! {
		if c <= 127 {
			//  must cache
			return CharacterCache.cache[(c as? Int32)]
		}
		return Character(c)
	}

	// *
	//      * Returns the value of this {@code Character} object.
	//      * @return  the primitive {@code char} value represented by
	//      *          this object.
	open func charValue() -> AnsiChar {
		return value
	}

	// *
	//      * Returns a hash code for this {@code Character}; equal to the result
	//      * of invoking {@code charValue()}.
	//      *
	//      * @return a hash code value for this {@code Character}
	// @Override
	public func hashCode() -> Int32 {
		return Character.hashCode(value)
	}

	// *
	//      * Returns a hash code for a {@code char} value; compatible with
	//      * {@code Character.hashCode()}.
	//      *
	//      * @since 1.8
	//      *
	//      * @param value The {@code char} for which to return a hash code.
	//      * @return a hash code value for a {@code char} value.
	public static func hashCode(_ value: AnsiChar) -> Int32 {
		return (value as? Int32)
	}

	// *
	//      * Compares this object against the specified object.
	//      * The result is {@code true} if and only if the argument is not
	//      * {@code null} and is a {@code Character} object that
	//      * represents the same {@code char} value as this object.
	//      *
	//      * @param   obj   the object to compare with.
	//      * @return  {@code true} if the objects are the same;
	//      *          {@code false} otherwise.
	open func equals(_ obj: Object!) -> Bool {
		if obj is Character! {
			return value == (obj as? Character).charValue()
		}
		return false
	}

	// *
	//      * Returns a {@code String} object representing this
	//      * {@code Character}'s value.  The result is a string of
	//      * length 1 whose sole component is the primitive
	//      * {@code char} value represented by this
	//      * {@code Character} object.
	//      *
	//      * @return  a string representation of this object.
	open func toString() -> String! {
		var buf: [AnsiChar] = [value]
		return String.valueOf(buf)
	}

	// *
	//      * Returns a {@code String} object representing the
	//      * specified {@code char}.  The result is a string of length
	//      * 1 consisting solely of the specified {@code char}.
	//      *
	//      * @param c the {@code char} to be converted
	//      * @return the string representation of the specified {@code char}
	//      * @since 1.4
	public static func toString(_ c: AnsiChar) -> String! {
		return String.valueOf(c)
	}

	// *
	//      * Determines whether the specified code point is a valid
	//      * <a href="http://www.unicode.org/glossary/#code_point">
	//      * Unicode code point value</a>.
	//      *
	//      * @param  codePoint the Unicode code point to be tested
	//      * @return {@code true} if the specified code point value is between
	//      *         {@link #MIN_CODE_POINT} and
	//      *         {@link #MAX_CODE_POINT} inclusive;
	//      *         {@code false} otherwise.
	//      * @since  1.5
	public static func isValidCodePoint(_ codePoint: Int32) -> Bool {
		//  Optimized form of:
		//      codePoint >= MIN_CODE_POINT && codePoint <= MAX_CODE_POINT
		var plane: Int32 = codePoint >> 16
		return plane < ((MAX_CODE_POINT + 1) >> 16)
	}

	// *
	//      * Determines whether the specified character (Unicode code point)
	//      * is in the <a href="#BMP">Basic Multilingual Plane (BMP)</a>.
	//      * Such code points can be represented using a single {@code char}.
	//      *
	//      * @param  codePoint the character (Unicode code point) to be tested
	//      * @return {@code true} if the specified code point is between
	//      *         {@link #MIN_VALUE} and {@link #MAX_VALUE} inclusive;
	//      *         {@code false} otherwise.
	//      * @since  1.7
	public static func isBmpCodePoint(_ codePoint: Int32) -> Bool {
		return (codePoint >> 16) == 0
		//  Optimized form of:
		//      codePoint >= MIN_VALUE && codePoint <= MAX_VALUE
		//  We consistently use logical shift (>>>) to facilitate
		//  additional runtime optimizations.
	}

	// *
	//      * Determines whether the specified character (Unicode code point)
	//      * is in the <a href="#supplementary">supplementary character</a> range.
	//      *
	//      * @param  codePoint the character (Unicode code point) to be tested
	//      * @return {@code true} if the specified code point is between
	//      *         {@link #MIN_SUPPLEMENTARY_CODE_POINT} and
	//      *         {@link #MAX_CODE_POINT} inclusive;
	//      *         {@code false} otherwise.
	//      * @since  1.5
	public static func isSupplementaryCodePoint(_ codePoint: Int32) -> Bool {
		return (codePoint >= MIN_SUPPLEMENTARY_CODE_POINT) & (codePoint < (MAX_CODE_POINT + 1))
	}

	// *
	//      * Determines if the given {@code char} value is a
	//      * <a href="http://www.unicode.org/glossary/#high_surrogate_code_unit">
	//      * Unicode high-surrogate code unit</a>
	//      * (also known as <i>leading-surrogate code unit</i>).
	//      *
	//      * <p>Such values do not represent characters by themselves,
	//      * but are used in the representation of
	//      * <a href="#supplementary">supplementary characters</a>
	//      * in the UTF-16 encoding.
	//      *
	//      * @param  ch the {@code char} value to be tested.
	//      * @return {@code true} if the {@code char} value is between
	//      *         {@link #MIN_HIGH_SURROGATE} and
	//      *         {@link #MAX_HIGH_SURROGATE} inclusive;
	//      *         {@code false} otherwise.
	//      * @see    Character#isLowSurrogate(char)
	//      * @see    Character.UnicodeBlock#of(int)
	//      * @since  1.5
	public static func isHighSurrogate(_ ch: AnsiChar) -> Bool {
		//  Help VM constant-fold; MAX_HIGH_SURROGATE + 1 == MIN_LOW_SURROGATE
		return (ch >= MIN_HIGH_SURROGATE) & (ch < (MAX_HIGH_SURROGATE + 1))
	}

	// *
	//      * Determines if the given {@code char} value is a
	//      * <a href="http://www.unicode.org/glossary/#low_surrogate_code_unit">
	//      * Unicode low-surrogate code unit</a>
	//      * (also known as <i>trailing-surrogate code unit</i>).
	//      *
	//      * <p>Such values do not represent characters by themselves,
	//      * but are used in the representation of
	//      * <a href="#supplementary">supplementary characters</a>
	//      * in the UTF-16 encoding.
	//      *
	//      * @param  ch the {@code char} value to be tested.
	//      * @return {@code true} if the {@code char} value is between
	//      *         {@link #MIN_LOW_SURROGATE} and
	//      *         {@link #MAX_LOW_SURROGATE} inclusive;
	//      *         {@code false} otherwise.
	//      * @see    Character#isHighSurrogate(char)
	//      * @since  1.5
	public static func isLowSurrogate(_ ch: AnsiChar) -> Bool {
		return (ch >= MIN_LOW_SURROGATE) & (ch < (MAX_LOW_SURROGATE + 1))
	}

	// *
	//      * Determines if the given {@code char} value is a Unicode
	//      * <i>surrogate code unit</i>.
	//      *
	//      * <p>Such values do not represent characters by themselves,
	//      * but are used in the representation of
	//      * <a href="#supplementary">supplementary characters</a>
	//      * in the UTF-16 encoding.
	//      *
	//      * <p>A char value is a surrogate code unit if and only if it is either
	//      * a {@linkplain #isLowSurrogate(char) low-surrogate code unit} or
	//      * a {@linkplain #isHighSurrogate(char) high-surrogate code unit}.
	//      *
	//      * @param  ch the {@code char} value to be tested.
	//      * @return {@code true} if the {@code char} value is between
	//      *         {@link #MIN_SURROGATE} and
	//      *         {@link #MAX_SURROGATE} inclusive;
	//      *         {@code false} otherwise.
	//      * @since  1.7
	public static func isSurrogate(_ ch: AnsiChar) -> Bool {
		return (ch >= MIN_SURROGATE) & (ch < (MAX_SURROGATE + 1))
	}

	// *
	//      * Determines whether the specified pair of {@code char}
	//      * values is a valid
	//      * <a href="http://www.unicode.org/glossary/#surrogate_pair">
	//      * Unicode surrogate pair</a>.
	// 
	//      * <p>This method is equivalent to the expression:
	//      * <blockquote><pre>{@code
	//      * isHighSurrogate(high) && isLowSurrogate(low)
	//      * }</pre></blockquote>
	//      *
	//      * @param  high the high-surrogate code value to be tested
	//      * @param  low the low-surrogate code value to be tested
	//      * @return {@code true} if the specified high and
	//      * low-surrogate code values represent a valid surrogate pair;
	//      * {@code false} otherwise.
	//      * @since  1.5
	public static func isSurrogatePair(_ high: AnsiChar, _ low: AnsiChar) -> Bool {
		return isHighSurrogate(high) & isLowSurrogate(low)
	}

	// *
	//      * Determines the number of {@code char} values needed to
	//      * represent the specified character (Unicode code point). If the
	//      * specified character is equal to or greater than 0x10000, then
	//      * the method returns 2. Otherwise, the method returns 1.
	//      *
	//      * <p>This method doesn't validate the specified character to be a
	//      * valid Unicode code point. The caller must validate the
	//      * character value using {@link #isValidCodePoint(int) isValidCodePoint}
	//      * if necessary.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  2 if the character is a valid supplementary character; 1 otherwise.
	//      * @see     Character#isSupplementaryCodePoint(int)
	//      * @since   1.5
	public static func charCount(_ codePoint: Int32) -> Int32 {
		return (codePoint >= MIN_SUPPLEMENTARY_CODE_POINT ? 2 : 1)
	}

	// *
	//      * Converts the specified surrogate pair to its supplementary code
	//      * point value. This method does not validate the specified
	//      * surrogate pair. The caller must validate it using {@link
	//      * #isSurrogatePair(char, char) isSurrogatePair} if necessary.
	//      *
	//      * @param  high the high-surrogate code unit
	//      * @param  low the low-surrogate code unit
	//      * @return the supplementary code point composed from the
	//      *         specified surrogate pair.
	//      * @since  1.5
	public static func toCodePoint(_ high: AnsiChar, _ low: AnsiChar) -> Int32 {
		//  Optimized form of:
		//  return ((high - MIN_HIGH_SURROGATE) << 10)
		//          + (low - MIN_LOW_SURROGATE)
		//          + MIN_SUPPLEMENTARY_CODE_POINT;
		return (high << 10) + low + (MIN_SUPPLEMENTARY_CODE_POINT - (MIN_HIGH_SURROGATE << 10) - MIN_LOW_SURROGATE)
	}

	// *
	//      * Returns the code point at the given index of the
	//      * {@code CharSequence}. If the {@code char} value at
	//      * the given index in the {@code CharSequence} is in the
	//      * high-surrogate range, the following index is less than the
	//      * length of the {@code CharSequence}, and the
	//      * {@code char} value at the following index is in the
	//      * low-surrogate range, then the supplementary code point
	//      * corresponding to this surrogate pair is returned. Otherwise,
	//      * the {@code char} value at the given index is returned.
	//      *
	//      * @param seq a sequence of {@code char} values (Unicode code
	//      * units)
	//      * @param index the index to the {@code char} values (Unicode
	//      * code units) in {@code seq} to be converted
	//      * @return the Unicode code point at the given index
	//      * @exception NullPointerException if {@code seq} is null.
	//      * @exception IndexOutOfBoundsException if the value
	//      * {@code index} is negative or not less than
	//      * {@link CharSequence#length() seq.length()}.
	//      * @since  1.5
	public static func codePointAt(_ seq: CharSequence!, _ index: Int32) -> Int32 {
		var c1: AnsiChar = seq.charAt(index)
		if isHighSurrogate(c1) & (inc(index) < seq.length()) {
			var c2: AnsiChar = seq.charAt(index)
			if isLowSurrogate(c2) {
				return toCodePoint(c1, c2)
			}
		}
		return c1
	}

	// *
	//      * Returns the code point at the given index of the
	//      * {@code char} array. If the {@code char} value at
	//      * the given index in the {@code char} array is in the
	//      * high-surrogate range, the following index is less than the
	//      * length of the {@code char} array, and the
	//      * {@code char} value at the following index is in the
	//      * low-surrogate range, then the supplementary code point
	//      * corresponding to this surrogate pair is returned. Otherwise,
	//      * the {@code char} value at the given index is returned.
	//      *
	//      * @param a the {@code char} array
	//      * @param index the index to the {@code char} values (Unicode
	//      * code units) in the {@code char} array to be converted
	//      * @return the Unicode code point at the given index
	//      * @exception NullPointerException if {@code a} is null.
	//      * @exception IndexOutOfBoundsException if the value
	//      * {@code index} is negative or not less than
	//      * the length of the {@code char} array.
	//      * @since  1.5
	public static func codePointAt(_ a: [AnsiChar], _ index: Int32) -> Int32 {
		return codePointAtImpl(a, index, a.length)
	}

	// *
	//      * Returns the code point at the given index of the
	//      * {@code char} array, where only array elements with
	//      * {@code index} less than {@code limit} can be used. If
	//      * the {@code char} value at the given index in the
	//      * {@code char} array is in the high-surrogate range, the
	//      * following index is less than the {@code limit}, and the
	//      * {@code char} value at the following index is in the
	//      * low-surrogate range, then the supplementary code point
	//      * corresponding to this surrogate pair is returned. Otherwise,
	//      * the {@code char} value at the given index is returned.
	//      *
	//      * @param a the {@code char} array
	//      * @param index the index to the {@code char} values (Unicode
	//      * code units) in the {@code char} array to be converted
	//      * @param limit the index after the last array element that
	//      * can be used in the {@code char} array
	//      * @return the Unicode code point at the given index
	//      * @exception NullPointerException if {@code a} is null.
	//      * @exception IndexOutOfBoundsException if the {@code index}
	//      * argument is negative or not less than the {@code limit}
	//      * argument, or if the {@code limit} argument is negative or
	//      * greater than the length of the {@code char} array.
	//      * @since  1.5
	public static func codePointAt(_ a: [AnsiChar], _ index: Int32, _ limit: Int32) -> Int32 {
		if (index >= limit) | (limit < 0) | (limit > a.length) {
			throw IndexOutOfBoundsException()
		}
		return codePointAtImpl(a, index, limit)
	}

	// throws ArrayIndexOutOfBoundsException if index out of bounds
	internal static func codePointAtImpl(_ a: [AnsiChar], _ index: Int32, _ limit: Int32) -> Int32 {
		var c1: AnsiChar = a[index]
		if isHighSurrogate(c1) & (inc(index) < limit) {
			var c2: AnsiChar = a[index]
			if isLowSurrogate(c2) {
				return toCodePoint(c1, c2)
			}
		}
		return c1
	}

	// *
	//      * Returns the code point preceding the given index of the
	//      * {@code CharSequence}. If the {@code char} value at
	//      * {@code (index - 1)} in the {@code CharSequence} is in
	//      * the low-surrogate range, {@code (index - 2)} is not
	//      * negative, and the {@code char} value at {@code (index - 2)}
	//      * in the {@code CharSequence} is in the
	//      * high-surrogate range, then the supplementary code point
	//      * corresponding to this surrogate pair is returned. Otherwise,
	//      * the {@code char} value at {@code (index - 1)} is
	//      * returned.
	//      *
	//      * @param seq the {@code CharSequence} instance
	//      * @param index the index following the code point that should be returned
	//      * @return the Unicode code point value before the given index.
	//      * @exception NullPointerException if {@code seq} is null.
	//      * @exception IndexOutOfBoundsException if the {@code index}
	//      * argument is less than 1 or greater than {@link
	//      * CharSequence#length() seq.length()}.
	//      * @since  1.5
	public static func codePointBefore(_ seq: CharSequence!, _ index: Int32) -> Int32 {
		var c2: AnsiChar = seq.charAt(dec(index))
		if isLowSurrogate(c2) & (index > 0) {
			var c1: AnsiChar = seq.charAt(dec(index))
			if isHighSurrogate(c1) {
				return toCodePoint(c1, c2)
			}
		}
		return c2
	}

	// *
	//      * Returns the code point preceding the given index of the
	//      * {@code char} array. If the {@code char} value at
	//      * {@code (index - 1)} in the {@code char} array is in
	//      * the low-surrogate range, {@code (index - 2)} is not
	//      * negative, and the {@code char} value at {@code (index - 2)}
	//      * in the {@code char} array is in the
	//      * high-surrogate range, then the supplementary code point
	//      * corresponding to this surrogate pair is returned. Otherwise,
	//      * the {@code char} value at {@code (index - 1)} is
	//      * returned.
	//      *
	//      * @param a the {@code char} array
	//      * @param index the index following the code point that should be returned
	//      * @return the Unicode code point value before the given index.
	//      * @exception NullPointerException if {@code a} is null.
	//      * @exception IndexOutOfBoundsException if the {@code index}
	//      * argument is less than 1 or greater than the length of the
	//      * {@code char} array
	//      * @since  1.5
	public static func codePointBefore(_ a: [AnsiChar], _ index: Int32) -> Int32 {
		return codePointBeforeImpl(a, index, 0)
	}

	// *
	//      * Returns the code point preceding the given index of the
	//      * {@code char} array, where only array elements with
	//      * {@code index} greater than or equal to {@code start}
	//      * can be used. If the {@code char} value at {@code (index - 1)}
	//      * in the {@code char} array is in the
	//      * low-surrogate range, {@code (index - 2)} is not less than
	//      * {@code start}, and the {@code char} value at
	//      * {@code (index - 2)} in the {@code char} array is in
	//      * the high-surrogate range, then the supplementary code point
	//      * corresponding to this surrogate pair is returned. Otherwise,
	//      * the {@code char} value at {@code (index - 1)} is
	//      * returned.
	//      *
	//      * @param a the {@code char} array
	//      * @param index the index following the code point that should be returned
	//      * @param start the index of the first array element in the
	//      * {@code char} array
	//      * @return the Unicode code point value before the given index.
	//      * @exception NullPointerException if {@code a} is null.
	//      * @exception IndexOutOfBoundsException if the {@code index}
	//      * argument is not greater than the {@code start} argument or
	//      * is greater than the length of the {@code char} array, or
	//      * if the {@code start} argument is negative or not less than
	//      * the length of the {@code char} array.
	//      * @since  1.5
	public static func codePointBefore(_ a: [AnsiChar], _ index: Int32, _ start: Int32) -> Int32 {
		if (index <= start) | (start < 0) | (start >= a.length) {
			throw IndexOutOfBoundsException()
		}
		return codePointBeforeImpl(a, index, start)
	}

	// throws ArrayIndexOutOfBoundsException if index-1 out of bounds
	internal static func codePointBeforeImpl(_ a: [AnsiChar], _ index: Int32, _ start: Int32) -> Int32 {
		var c2: AnsiChar = a[dec(index)]
		if isLowSurrogate(c2) & (index > start) {
			var c1: AnsiChar = a[dec(index)]
			if isHighSurrogate(c1) {
				return toCodePoint(c1, c2)
			}
		}
		return c2
	}

	// *
	//      * Returns the leading surrogate (a
	//      * <a href="http://www.unicode.org/glossary/#high_surrogate_code_unit">
	//      * high surrogate code unit</a>) of the
	//      * <a href="http://www.unicode.org/glossary/#surrogate_pair">
	//      * surrogate pair</a>
	//      * representing the specified supplementary character (Unicode
	//      * code point) in the UTF-16 encoding.  If the specified character
	//      * is not a
	//      * <a href="Character.html#supplementary">supplementary character</a>,
	//      * an unspecified {@code char} is returned.
	//      *
	//      * <p>If
	//      * {@link #isSupplementaryCodePoint isSupplementaryCodePoint(x)}
	//      * is {@code true}, then
	//      * {@link #isHighSurrogate isHighSurrogate}{@code (highSurrogate(x))} and
	//      * {@link #toCodePoint toCodePoint}{@code (highSurrogate(x), }{@link #lowSurrogate lowSurrogate}{@code (x)) == x}
	//      * are also always {@code true}.
	//      *
	//      * @param   codePoint a supplementary character (Unicode code point)
	//      * @return  the leading surrogate code unit used to represent the
	//      *          character in the UTF-16 encoding
	//      * @since   1.7
	public static func highSurrogate(_ codePoint: Int32) -> AnsiChar {
		return ((codePoint >> 10) + (MIN_HIGH_SURROGATE - (MIN_SUPPLEMENTARY_CODE_POINT >> 10)) as? AnsiChar)
	}

	// *
	//      * Returns the trailing surrogate (a
	//      * <a href="http://www.unicode.org/glossary/#low_surrogate_code_unit">
	//      * low surrogate code unit</a>) of the
	//      * <a href="http://www.unicode.org/glossary/#surrogate_pair">
	//      * surrogate pair</a>
	//      * representing the specified supplementary character (Unicode
	//      * code point) in the UTF-16 encoding.  If the specified character
	//      * is not a
	//      * <a href="Character.html#supplementary">supplementary character</a>,
	//      * an unspecified {@code char} is returned.
	//      *
	//      * <p>If
	//      * {@link #isSupplementaryCodePoint isSupplementaryCodePoint(x)}
	//      * is {@code true}, then
	//      * {@link #isLowSurrogate isLowSurrogate}{@code (lowSurrogate(x))} and
	//      * {@link #toCodePoint toCodePoint}{@code (}{@link #highSurrogate highSurrogate}{@code (x), lowSurrogate(x)) == x}
	//      * are also always {@code true}.
	//      *
	//      * @param   codePoint a supplementary character (Unicode code point)
	//      * @return  the trailing surrogate code unit used to represent the
	//      *          character in the UTF-16 encoding
	//      * @since   1.7
	public static func lowSurrogate(_ codePoint: Int32) -> AnsiChar {
		return ((codePoint && 0x3FF) + MIN_LOW_SURROGATE as? AnsiChar)
	}

	// *
	//      * Converts the specified character (Unicode code point) to its
	//      * UTF-16 representation. If the specified code point is a BMP
	//      * (Basic Multilingual Plane or Plane 0) value, the same value is
	//      * stored in {@code dst[dstIndex]}, and 1 is returned. If the
	//      * specified code point is a supplementary character, its
	//      * surrogate values are stored in {@code dst[dstIndex]}
	//      * (high-surrogate) and {@code dst[dstIndex+1]}
	//      * (low-surrogate), and 2 is returned.
	//      *
	//      * @param  codePoint the character (Unicode code point) to be converted.
	//      * @param  dst an array of {@code char} in which the
	//      * {@code codePoint}'s UTF-16 value is stored.
	//      * @param dstIndex the start index into the {@code dst}
	//      * array where the converted value is stored.
	//      * @return 1 if the code point is a BMP code point, 2 if the
	//      * code point is a supplementary code point.
	//      * @exception IllegalArgumentException if the specified
	//      * {@code codePoint} is not a valid Unicode code point.
	//      * @exception NullPointerException if the specified {@code dst} is null.
	//      * @exception IndexOutOfBoundsException if {@code dstIndex}
	//      * is negative or not less than {@code dst.length}, or if
	//      * {@code dst} at {@code dstIndex} doesn't have enough
	//      * array element(s) to store the resulting {@code char}
	//      * value(s). (If {@code dstIndex} is equal to
	//      * {@code dst.length-1} and the specified
	//      * {@code codePoint} is a supplementary character, the
	//      * high-surrogate value is not stored in
	//      * {@code dst[dstIndex]}.)
	//      * @since  1.5
	public static func toChars(_ codePoint: Int32, _ dst: [AnsiChar], _ dstIndex: Int32) -> Int32 {
		if isBmpCodePoint(codePoint) {
			dst[dstIndex] = (codePoint as? AnsiChar)
			return 1
		} else {
			if isValidCodePoint(codePoint) {
				toSurrogates(codePoint, dst, dstIndex)
				return 2
			} else {
				throw IllegalArgumentException()
			}
		}
	}

	// *
	//      * Converts the specified character (Unicode code point) to its
	//      * UTF-16 representation stored in a {@code char} array. If
	//      * the specified code point is a BMP (Basic Multilingual Plane or
	//      * Plane 0) value, the resulting {@code char} array has
	//      * the same value as {@code codePoint}. If the specified code
	//      * point is a supplementary code point, the resulting
	//      * {@code char} array has the corresponding surrogate pair.
	//      *
	//      * @param  codePoint a Unicode code point
	//      * @return a {@code char} array having
	//      *         {@code codePoint}'s UTF-16 representation.
	//      * @exception IllegalArgumentException if the specified
	//      * {@code codePoint} is not a valid Unicode code point.
	//      * @since  1.5
	public static func toChars(_ codePoint: Int32) -> [AnsiChar] {
		if isBmpCodePoint(codePoint) {
			return ([(codePoint as? AnsiChar)] as? [AnsiChar])
		} else {
			if isValidCodePoint(codePoint) {
				var result: [AnsiChar] = [AnsiChar](count: 2)
				toSurrogates(codePoint, result, 0)
				return result
			} else {
				throw IllegalArgumentException()
			}
		}
	}

	internal static func toSurrogates(_ codePoint: Int32, _ dst: [AnsiChar], _ index: Int32) {
		//  We write elements "backwards" to guarantee all-or-nothing
		dst[index + 1] = lowSurrogate(codePoint)
		dst[index] = highSurrogate(codePoint)
	}

	// *
	//      * Returns the number of Unicode code points in the text range of
	//      * the specified char sequence. The text range begins at the
	//      * specified {@code beginIndex} and extends to the
	//      * {@code char} at index {@code endIndex - 1}. Thus the
	//      * length (in {@code char}s) of the text range is
	//      * {@code endIndex-beginIndex}. Unpaired surrogates within
	//      * the text range count as one code point each.
	//      *
	//      * @param seq the char sequence
	//      * @param beginIndex the index to the first {@code char} of
	//      * the text range.
	//      * @param endIndex the index after the last {@code char} of
	//      * the text range.
	//      * @return the number of Unicode code points in the specified text
	//      * range
	//      * @exception NullPointerException if {@code seq} is null.
	//      * @exception IndexOutOfBoundsException if the
	//      * {@code beginIndex} is negative, or {@code endIndex}
	//      * is larger than the length of the given sequence, or
	//      * {@code beginIndex} is larger than {@code endIndex}.
	//      * @since  1.5
	public static func codePointCount(_ seq: CharSequence!, _ beginIndex: Int32, _ endIndex: Int32) -> Int32 {
		var length: Int32 = seq.length()
		if (beginIndex < 0) | (endIndex > length) | (beginIndex > endIndex) {
			throw IndexOutOfBoundsException()
		}
		var n: Int32 = endIndex - beginIndex
		var i: Int32 = beginIndex
		while i < endIndex {
			if isHighSurrogate(seq.charAt(inc(i))) & (i < endIndex) & isLowSurrogate(seq.charAt(i)) {
				dec(n)
				inc(i)
			}
		}return n
	}

	// *
	//      * Returns the number of Unicode code points in a subarray of the
	//      * {@code char} array argument. The {@code offset}
	//      * argument is the index of the first {@code char} of the
	//      * subarray and the {@code count} argument specifies the
	//      * length of the subarray in {@code char}s. Unpaired
	//      * surrogates within the subarray count as one code point each.
	//      *
	//      * @param a the {@code char} array
	//      * @param offset the index of the first {@code char} in the
	//      * given {@code char} array
	//      * @param count the length of the subarray in {@code char}s
	//      * @return the number of Unicode code points in the specified subarray
	//      * @exception NullPointerException if {@code a} is null.
	//      * @exception IndexOutOfBoundsException if {@code offset} or
	//      * {@code count} is negative, or if {@code offset +
	//      * count} is larger than the length of the given array.
	//      * @since  1.5
	public static func codePointCount(_ a: [AnsiChar], _ offset: Int32, _ count: Int32) -> Int32 {
		if (count > (a.length - offset)) | (offset < 0) | (count < 0) {
			throw IndexOutOfBoundsException()
		}
		return codePointCountImpl(a, offset, count)
	}

	internal static func codePointCountImpl(_ a: [AnsiChar], _ offset: Int32, _ count: Int32) -> Int32 {
		var endIndex: Int32 = offset + count
		var n: Int32 = count
		var i: Int32 = offset
		while i < endIndex {
			if isHighSurrogate(a[i]) & (i < endIndex) & isLowSurrogate(a[i]) {
				dec(n)
				inc(i)
			}
		}return n
	}

	// *
	//      * Returns the index within the given char sequence that is offset
	//      * from the given {@code index} by {@code codePointOffset}
	//      * code points. Unpaired surrogates within the text range given by
	//      * {@code index} and {@code codePointOffset} count as
	//      * one code point each.
	//      *
	//      * @param seq the char sequence
	//      * @param index the index to be offset
	//      * @param codePointOffset the offset in code points
	//      * @return the index within the char sequence
	//      * @exception NullPointerException if {@code seq} is null.
	//      * @exception IndexOutOfBoundsException if {@code index}
	//      *   is negative or larger then the length of the char sequence,
	//      *   or if {@code codePointOffset} is positive and the
	//      *   subsequence starting with {@code index} has fewer than
	//      *   {@code codePointOffset} code points, or if
	//      *   {@code codePointOffset} is negative and the subsequence
	//      *   before {@code index} has fewer than the absolute value
	//      *   of {@code codePointOffset} code points.
	//      * @since 1.5
	public static func offsetByCodePoints(_ seq: CharSequence!, _ index: Int32, _ codePointOffset: Int32) -> Int32 {
		var length: Int32 = seq.length()
		if (index < 0) | (index > length) {
			throw IndexOutOfBoundsException()
		}
		var x: Int32 = index
		if codePointOffset >= 0 {
			var i: Int32
			for i in 0 ... i < codePointOffset {
				if isHighSurrogate(seq.charAt(inc(x))) & (x < length) & isLowSurrogate(seq.charAt(x)) {
					inc(x)
				}
			}
			if i < codePointOffset {
				throw IndexOutOfBoundsException()
			}
		} else {
			var i: Int32
			for i in codePointOffset ... i < 0 {
				if isLowSurrogate(seq.charAt(dec(x))) & (x > 0) & isHighSurrogate(seq.charAt(x - 1)) {
					dec(x)
				}
			}
			if i < 0 {
				throw IndexOutOfBoundsException()
			}
		}
		return x
	}

	// *
	//      * Returns the index within the given {@code char} subarray
	//      * that is offset from the given {@code index} by
	//      * {@code codePointOffset} code points. The
	//      * {@code start} and {@code count} arguments specify a
	//      * subarray of the {@code char} array. Unpaired surrogates
	//      * within the text range given by {@code index} and
	//      * {@code codePointOffset} count as one code point each.
	//      *
	//      * @param a the {@code char} array
	//      * @param start the index of the first {@code char} of the
	//      * subarray
	//      * @param count the length of the subarray in {@code char}s
	//      * @param index the index to be offset
	//      * @param codePointOffset the offset in code points
	//      * @return the index within the subarray
	//      * @exception NullPointerException if {@code a} is null.
	//      * @exception IndexOutOfBoundsException
	//      *   if {@code start} or {@code count} is negative,
	//      *   or if {@code start + count} is larger than the length of
	//      *   the given array,
	//      *   or if {@code index} is less than {@code start} or
	//      *   larger then {@code start + count},
	//      *   or if {@code codePointOffset} is positive and the text range
	//      *   starting with {@code index} and ending with {@code start + count - 1}
	//      *   has fewer than {@code codePointOffset} code
	//      *   points,
	//      *   or if {@code codePointOffset} is negative and the text range
	//      *   starting with {@code start} and ending with {@code index - 1}
	//      *   has fewer than the absolute value of
	//      *   {@code codePointOffset} code points.
	//      * @since 1.5
	public static func offsetByCodePoints(_ a: [AnsiChar], _ start: Int32, _ count: Int32, _ index: Int32, _ codePointOffset: Int32) -> Int32 {
		if (count > (a.length - start)) | (start < 0) | (count < 0) | (index < start) | (index > (start + count)) {
			throw IndexOutOfBoundsException()
		}
		return offsetByCodePointsImpl(a, start, count, index, codePointOffset)
	}

	internal static func offsetByCodePointsImpl(_ a: [AnsiChar], _ start: Int32, _ count: Int32, _ index: Int32, _ codePointOffset: Int32) -> Int32 {
		var x: Int32 = index
		if codePointOffset >= 0 {
			var limit: Int32 = start + count
			var i: Int32
			for i in 0 ... i < codePointOffset {
				if isHighSurrogate(a[x]) & (x < limit) & isLowSurrogate(a[x]) {
					inc(x)
				}
			}
			if i < codePointOffset {
				throw IndexOutOfBoundsException()
			}
		} else {
			var i: Int32
			for i in codePointOffset ... i < 0 {
				if isLowSurrogate(a[dec(x)]) & (x > start) & isHighSurrogate(a[x - 1]) {
					dec(x)
				}
			}
			if i < 0 {
				throw IndexOutOfBoundsException()
			}
		}
		return x
	}

	// *
	//      * Determines if the specified character is a lowercase character.
	//      * <p>
	//      * A character is lowercase if its general category type, provided
	//      * by {@code Character.getType(ch)}, is
	//      * {@code LOWERCASE_LETTER}, or it has contributory property
	//      * Other_Lowercase as defined by the Unicode Standard.
	//      * <p>
	//      * The following are examples of lowercase characters:
	//      * <blockquote><pre>
	//      * a b c d e f g h i j k l m n o p q r s t u v w x y z
	//      * '&#92;u00DF' '&#92;u00E0' '&#92;u00E1' '&#92;u00E2' '&#92;u00E3' '&#92;u00E4' '&#92;u00E5' '&#92;u00E6'
	//      * '&#92;u00E7' '&#92;u00E8' '&#92;u00E9' '&#92;u00EA' '&#92;u00EB' '&#92;u00EC' '&#92;u00ED' '&#92;u00EE'
	//      * '&#92;u00EF' '&#92;u00F0' '&#92;u00F1' '&#92;u00F2' '&#92;u00F3' '&#92;u00F4' '&#92;u00F5' '&#92;u00F6'
	//      * '&#92;u00F8' '&#92;u00F9' '&#92;u00FA' '&#92;u00FB' '&#92;u00FC' '&#92;u00FD' '&#92;u00FE' '&#92;u00FF'
	//      * </pre></blockquote>
	//      * <p> Many other Unicode characters are lowercase too.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isLowerCase(int)} method.
	//      *
	//      * @param   ch   the character to be tested.
	//      * @return  {@code true} if the character is lowercase;
	//      *          {@code false} otherwise.
	//      * @see     Character#isLowerCase(char)
	//      * @see     Character#isTitleCase(char)
	//      * @see     Character#toLowerCase(char)
	//      * @see     Character#getType(char)
	public static func isLowerCase(_ ch: AnsiChar) -> Bool {
		return isLowerCase((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) is a
	//      * lowercase character.
	//      * <p>
	//      * A character is lowercase if its general category type, provided
	//      * by {@link Character#getType getType(codePoint)}, is
	//      * {@code LOWERCASE_LETTER}, or it has contributory property
	//      * Other_Lowercase as defined by the Unicode Standard.
	//      * <p>
	//      * The following are examples of lowercase characters:
	//      * <blockquote><pre>
	//      * a b c d e f g h i j k l m n o p q r s t u v w x y z
	//      * '&#92;u00DF' '&#92;u00E0' '&#92;u00E1' '&#92;u00E2' '&#92;u00E3' '&#92;u00E4' '&#92;u00E5' '&#92;u00E6'
	//      * '&#92;u00E7' '&#92;u00E8' '&#92;u00E9' '&#92;u00EA' '&#92;u00EB' '&#92;u00EC' '&#92;u00ED' '&#92;u00EE'
	//      * '&#92;u00EF' '&#92;u00F0' '&#92;u00F1' '&#92;u00F2' '&#92;u00F3' '&#92;u00F4' '&#92;u00F5' '&#92;u00F6'
	//      * '&#92;u00F8' '&#92;u00F9' '&#92;u00FA' '&#92;u00FB' '&#92;u00FC' '&#92;u00FD' '&#92;u00FE' '&#92;u00FF'
	//      * </pre></blockquote>
	//      * <p> Many other Unicode characters are lowercase too.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is lowercase;
	//      *          {@code false} otherwise.
	//      * @see     Character#isLowerCase(int)
	//      * @see     Character#isTitleCase(int)
	//      * @see     Character#toLowerCase(int)
	//      * @see     Character#getType(int)
	//      * @since   1.5
	public static func isLowerCase(_ codePoint: Int32) -> Bool {
		return isLowerCaseImpl(codePoint)
	}

	@FastNative
	internal static __extern func isLowerCaseImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character is an uppercase character.
	//      * <p>
	//      * A character is uppercase if its general category type, provided by
	//      * {@code Character.getType(ch)}, is {@code UPPERCASE_LETTER}.
	//      * or it has contributory property Other_Uppercase as defined by the Unicode Standard.
	//      * <p>
	//      * The following are examples of uppercase characters:
	//      * <blockquote><pre>
	//      * A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
	//      * '&#92;u00C0' '&#92;u00C1' '&#92;u00C2' '&#92;u00C3' '&#92;u00C4' '&#92;u00C5' '&#92;u00C6' '&#92;u00C7'
	//      * '&#92;u00C8' '&#92;u00C9' '&#92;u00CA' '&#92;u00CB' '&#92;u00CC' '&#92;u00CD' '&#92;u00CE' '&#92;u00CF'
	//      * '&#92;u00D0' '&#92;u00D1' '&#92;u00D2' '&#92;u00D3' '&#92;u00D4' '&#92;u00D5' '&#92;u00D6' '&#92;u00D8'
	//      * '&#92;u00D9' '&#92;u00DA' '&#92;u00DB' '&#92;u00DC' '&#92;u00DD' '&#92;u00DE'
	//      * </pre></blockquote>
	//      * <p> Many other Unicode characters are uppercase too.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isUpperCase(int)} method.
	//      *
	//      * @param   ch   the character to be tested.
	//      * @return  {@code true} if the character is uppercase;
	//      *          {@code false} otherwise.
	//      * @see     Character#isLowerCase(char)
	//      * @see     Character#isTitleCase(char)
	//      * @see     Character#toUpperCase(char)
	//      * @see     Character#getType(char)
	//      * @since   1.0
	public static func isUpperCase(_ ch: AnsiChar) -> Bool {
		return isUpperCase((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) is an uppercase character.
	//      * <p>
	//      * A character is uppercase if its general category type, provided by
	//      * {@link Character#getType(int) getType(codePoint)}, is {@code UPPERCASE_LETTER},
	//      * or it has contributory property Other_Uppercase as defined by the Unicode Standard.
	//      * <p>
	//      * The following are examples of uppercase characters:
	//      * <blockquote><pre>
	//      * A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
	//      * '&#92;u00C0' '&#92;u00C1' '&#92;u00C2' '&#92;u00C3' '&#92;u00C4' '&#92;u00C5' '&#92;u00C6' '&#92;u00C7'
	//      * '&#92;u00C8' '&#92;u00C9' '&#92;u00CA' '&#92;u00CB' '&#92;u00CC' '&#92;u00CD' '&#92;u00CE' '&#92;u00CF'
	//      * '&#92;u00D0' '&#92;u00D1' '&#92;u00D2' '&#92;u00D3' '&#92;u00D4' '&#92;u00D5' '&#92;u00D6' '&#92;u00D8'
	//      * '&#92;u00D9' '&#92;u00DA' '&#92;u00DB' '&#92;u00DC' '&#92;u00DD' '&#92;u00DE'
	//      * </pre></blockquote>
	//      * <p> Many other Unicode characters are uppercase too.<p>
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is uppercase;
	//      *          {@code false} otherwise.
	//      * @see     Character#isLowerCase(int)
	//      * @see     Character#isTitleCase(int)
	//      * @see     Character#toUpperCase(int)
	//      * @see     Character#getType(int)
	//      * @since   1.5
	public static func isUpperCase(_ codePoint: Int32) -> Bool {
		return isUpperCaseImpl(codePoint)
	}

	@FastNative
	internal static __extern func isUpperCaseImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character is a titlecase character.
	//      * <p>
	//      * A character is a titlecase character if its general
	//      * category type, provided by {@code Character.getType(ch)},
	//      * is {@code TITLECASE_LETTER}.
	//      * <p>
	//      * Some characters look like pairs of Latin letters. For example, there
	//      * is an uppercase letter that looks like "LJ" and has a corresponding
	//      * lowercase letter that looks like "lj". A third form, which looks like "Lj",
	//      * is the appropriate form to use when rendering a word in lowercase
	//      * with initial capitals, as for a book title.
	//      * <p>
	//      * These are some of the Unicode characters for which this method returns
	//      * {@code true}:
	//      * <ul>
	//      * <li>{@code LATIN CAPITAL LETTER D WITH SMALL LETTER Z WITH CARON}
	//      * <li>{@code LATIN CAPITAL LETTER L WITH SMALL LETTER J}
	//      * <li>{@code LATIN CAPITAL LETTER N WITH SMALL LETTER J}
	//      * <li>{@code LATIN CAPITAL LETTER D WITH SMALL LETTER Z}
	//      * </ul>
	//      * <p> Many other Unicode characters are titlecase too.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isTitleCase(int)} method.
	//      *
	//      * @param   ch   the character to be tested.
	//      * @return  {@code true} if the character is titlecase;
	//      *          {@code false} otherwise.
	//      * @see     Character#isLowerCase(char)
	//      * @see     Character#isUpperCase(char)
	//      * @see     Character#toTitleCase(char)
	//      * @see     Character#getType(char)
	//      * @since   1.0.2
	public static func isTitleCase(_ ch: AnsiChar) -> Bool {
		return isTitleCase((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) is a titlecase character.
	//      * <p>
	//      * A character is a titlecase character if its general
	//      * category type, provided by {@link Character#getType(int) getType(codePoint)},
	//      * is {@code TITLECASE_LETTER}.
	//      * <p>
	//      * Some characters look like pairs of Latin letters. For example, there
	//      * is an uppercase letter that looks like "LJ" and has a corresponding
	//      * lowercase letter that looks like "lj". A third form, which looks like "Lj",
	//      * is the appropriate form to use when rendering a word in lowercase
	//      * with initial capitals, as for a book title.
	//      * <p>
	//      * These are some of the Unicode characters for which this method returns
	//      * {@code true}:
	//      * <ul>
	//      * <li>{@code LATIN CAPITAL LETTER D WITH SMALL LETTER Z WITH CARON}
	//      * <li>{@code LATIN CAPITAL LETTER L WITH SMALL LETTER J}
	//      * <li>{@code LATIN CAPITAL LETTER N WITH SMALL LETTER J}
	//      * <li>{@code LATIN CAPITAL LETTER D WITH SMALL LETTER Z}
	//      * </ul>
	//      * <p> Many other Unicode characters are titlecase too.<p>
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is titlecase;
	//      *          {@code false} otherwise.
	//      * @see     Character#isLowerCase(int)
	//      * @see     Character#isUpperCase(int)
	//      * @see     Character#toTitleCase(int)
	//      * @see     Character#getType(int)
	//      * @since   1.5
	public static func isTitleCase(_ codePoint: Int32) -> Bool {
		return isTitleCaseImpl(codePoint)
	}

	@FastNative
	internal static __extern func isTitleCaseImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character is a digit.
	//      * <p>
	//      * A character is a digit if its general category type, provided
	//      * by {@code Character.getType(ch)}, is
	//      * {@code DECIMAL_DIGIT_NUMBER}.
	//      * <p>
	//      * Some Unicode character ranges that contain digits:
	//      * <ul>
	//      * <li>{@code '\u005Cu0030'} through {@code '\u005Cu0039'},
	//      *     ISO-LATIN-1 digits ({@code '0'} through {@code '9'})
	//      * <li>{@code '\u005Cu0660'} through {@code '\u005Cu0669'},
	//      *     Arabic-Indic digits
	//      * <li>{@code '\u005Cu06F0'} through {@code '\u005Cu06F9'},
	//      *     Extended Arabic-Indic digits
	//      * <li>{@code '\u005Cu0966'} through {@code '\u005Cu096F'},
	//      *     Devanagari digits
	//      * <li>{@code '\u005CuFF10'} through {@code '\u005CuFF19'},
	//      *     Fullwidth digits
	//      * </ul>
	//      *
	//      * Many other character ranges contain digits as well.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isDigit(int)} method.
	//      *
	//      * @param   ch   the character to be tested.
	//      * @return  {@code true} if the character is a digit;
	//      *          {@code false} otherwise.
	//      * @see     Character#digit(char, int)
	//      * @see     Character#forDigit(int, int)
	//      * @see     Character#getType(char)
	public static func isDigit(_ ch: AnsiChar) -> Bool {
		return isDigit((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) is a digit.
	//      * <p>
	//      * A character is a digit if its general category type, provided
	//      * by {@link Character#getType(int) getType(codePoint)}, is
	//      * {@code DECIMAL_DIGIT_NUMBER}.
	//      * <p>
	//      * Some Unicode character ranges that contain digits:
	//      * <ul>
	//      * <li>{@code '\u005Cu0030'} through {@code '\u005Cu0039'},
	//      *     ISO-LATIN-1 digits ({@code '0'} through {@code '9'})
	//      * <li>{@code '\u005Cu0660'} through {@code '\u005Cu0669'},
	//      *     Arabic-Indic digits
	//      * <li>{@code '\u005Cu06F0'} through {@code '\u005Cu06F9'},
	//      *     Extended Arabic-Indic digits
	//      * <li>{@code '\u005Cu0966'} through {@code '\u005Cu096F'},
	//      *     Devanagari digits
	//      * <li>{@code '\u005CuFF10'} through {@code '\u005CuFF19'},
	//      *     Fullwidth digits
	//      * </ul>
	//      *
	//      * Many other character ranges contain digits as well.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is a digit;
	//      *          {@code false} otherwise.
	//      * @see     Character#forDigit(int, int)
	//      * @see     Character#getType(int)
	//      * @since   1.5
	public static func isDigit(_ codePoint: Int32) -> Bool {
		return isDigitImpl(codePoint)
	}

	@FastNative
	internal static __extern func isDigitImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if a character is defined in Unicode.
	//      * <p>
	//      * A character is defined if at least one of the following is true:
	//      * <ul>
	//      * <li>It has an entry in the UnicodeData file.
	//      * <li>It has a value in a range defined by the UnicodeData file.
	//      * </ul>
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isDefined(int)} method.
	//      *
	//      * @param   ch   the character to be tested
	//      * @return  {@code true} if the character has a defined meaning
	//      *          in Unicode; {@code false} otherwise.
	//      * @see     Character#isDigit(char)
	//      * @see     Character#isLetter(char)
	//      * @see     Character#isLetterOrDigit(char)
	//      * @see     Character#isLowerCase(char)
	//      * @see     Character#isTitleCase(char)
	//      * @see     Character#isUpperCase(char)
	//      * @since   1.0.2
	public static func isDefined(_ ch: AnsiChar) -> Bool {
		return isDefined((ch as? Int32))
	}

	// *
	//      * Determines if a character (Unicode code point) is defined in Unicode.
	//      * <p>
	//      * A character is defined if at least one of the following is true:
	//      * <ul>
	//      * <li>It has an entry in the UnicodeData file.
	//      * <li>It has a value in a range defined by the UnicodeData file.
	//      * </ul>
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character has a defined meaning
	//      *          in Unicode; {@code false} otherwise.
	//      * @see     Character#isDigit(int)
	//      * @see     Character#isLetter(int)
	//      * @see     Character#isLetterOrDigit(int)
	//      * @see     Character#isLowerCase(int)
	//      * @see     Character#isTitleCase(int)
	//      * @see     Character#isUpperCase(int)
	//      * @since   1.5
	public static func isDefined(_ codePoint: Int32) -> Bool {
		return isDefinedImpl(codePoint)
	}

	@FastNative
	internal static __extern func isDefinedImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character is a letter.
	//      * <p>
	//      * A character is considered to be a letter if its general
	//      * category type, provided by {@code Character.getType(ch)},
	//      * is any of the following:
	//      * <ul>
	//      * <li> {@code UPPERCASE_LETTER}
	//      * <li> {@code LOWERCASE_LETTER}
	//      * <li> {@code TITLECASE_LETTER}
	//      * <li> {@code MODIFIER_LETTER}
	//      * <li> {@code OTHER_LETTER}
	//      * </ul>
	//      *
	//      * Not all letters have case. Many characters are
	//      * letters but are neither uppercase nor lowercase nor titlecase.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isLetter(int)} method.
	//      *
	//      * @param   ch   the character to be tested.
	//      * @return  {@code true} if the character is a letter;
	//      *          {@code false} otherwise.
	//      * @see     Character#isDigit(char)
	//      * @see     Character#isJavaIdentifierStart(char)
	//      * @see     Character#isJavaLetter(char)
	//      * @see     Character#isJavaLetterOrDigit(char)
	//      * @see     Character#isLetterOrDigit(char)
	//      * @see     Character#isLowerCase(char)
	//      * @see     Character#isTitleCase(char)
	//      * @see     Character#isUnicodeIdentifierStart(char)
	//      * @see     Character#isUpperCase(char)
	public static func isLetter(_ ch: AnsiChar) -> Bool {
		return isLetter((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) is a letter.
	//      * <p>
	//      * A character is considered to be a letter if its general
	//      * category type, provided by {@link Character#getType(int) getType(codePoint)},
	//      * is any of the following:
	//      * <ul>
	//      * <li> {@code UPPERCASE_LETTER}
	//      * <li> {@code LOWERCASE_LETTER}
	//      * <li> {@code TITLECASE_LETTER}
	//      * <li> {@code MODIFIER_LETTER}
	//      * <li> {@code OTHER_LETTER}
	//      * </ul>
	//      *
	//      * Not all letters have case. Many characters are
	//      * letters but are neither uppercase nor lowercase nor titlecase.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is a letter;
	//      *          {@code false} otherwise.
	//      * @see     Character#isDigit(int)
	//      * @see     Character#isJavaIdentifierStart(int)
	//      * @see     Character#isLetterOrDigit(int)
	//      * @see     Character#isLowerCase(int)
	//      * @see     Character#isTitleCase(int)
	//      * @see     Character#isUnicodeIdentifierStart(int)
	//      * @see     Character#isUpperCase(int)
	//      * @since   1.5
	public static func isLetter(_ codePoint: Int32) -> Bool {
		return isLetterImpl(codePoint)
	}

	@FastNative
	internal static __extern func isLetterImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character is a letter or digit.
	//      * <p>
	//      * A character is considered to be a letter or digit if either
	//      * {@code Character.isLetter(char ch)} or
	//      * {@code Character.isDigit(char ch)} returns
	//      * {@code true} for the character.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isLetterOrDigit(int)} method.
	//      *
	//      * @param   ch   the character to be tested.
	//      * @return  {@code true} if the character is a letter or digit;
	//      *          {@code false} otherwise.
	//      * @see     Character#isDigit(char)
	//      * @see     Character#isJavaIdentifierPart(char)
	//      * @see     Character#isJavaLetter(char)
	//      * @see     Character#isJavaLetterOrDigit(char)
	//      * @see     Character#isLetter(char)
	//      * @see     Character#isUnicodeIdentifierPart(char)
	//      * @since   1.0.2
	public static func isLetterOrDigit(_ ch: AnsiChar) -> Bool {
		return isLetterOrDigit((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) is a letter or digit.
	//      * <p>
	//      * A character is considered to be a letter or digit if either
	//      * {@link #isLetter(int) isLetter(codePoint)} or
	//      * {@link #isDigit(int) isDigit(codePoint)} returns
	//      * {@code true} for the character.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is a letter or digit;
	//      *          {@code false} otherwise.
	//      * @see     Character#isDigit(int)
	//      * @see     Character#isJavaIdentifierPart(int)
	//      * @see     Character#isLetter(int)
	//      * @see     Character#isUnicodeIdentifierPart(int)
	//      * @since   1.5
	public static func isLetterOrDigit(_ codePoint: Int32) -> Bool {
		return isLetterOrDigitImpl(codePoint)
	}

	@FastNative
	internal static __extern func isLetterOrDigitImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character is permissible as the first
	//      * character in a Java identifier.
	//      * <p>
	//      * A character may start a Java identifier if and only if
	//      * one of the following is true:
	//      * <ul>
	//      * <li> {@link #isLetter(char) isLetter(ch)} returns {@code true}
	//      * <li> {@link #getType(char) getType(ch)} returns {@code LETTER_NUMBER}
	//      * <li> {@code ch} is a currency symbol (such as {@code '$'})
	//      * <li> {@code ch} is a connecting punctuation character (such as {@code '_'}).
	//      * </ul>
	//      *
	//      * @param   ch the character to be tested.
	//      * @return  {@code true} if the character may start a Java
	//      *          identifier; {@code false} otherwise.
	//      * @see     Character#isJavaLetterOrDigit(char)
	//      * @see     Character#isJavaIdentifierStart(char)
	//      * @see     Character#isJavaIdentifierPart(char)
	//      * @see     Character#isLetter(char)
	//      * @see     Character#isLetterOrDigit(char)
	//      * @see     Character#isUnicodeIdentifierStart(char)
	//      * @since   1.02
	//      * @deprecated Replaced by isJavaIdentifierStart(char).
	@Deprecated
	public static func isJavaLetter(_ ch: AnsiChar) -> Bool {
		return isJavaIdentifierStart(ch)
	}

	// *
	//      * Determines if the specified character may be part of a Java
	//      * identifier as other than the first character.
	//      * <p>
	//      * A character may be part of a Java identifier if and only if any
	//      * of the following are true:
	//      * <ul>
	//      * <li>  it is a letter
	//      * <li>  it is a currency symbol (such as {@code '$'})
	//      * <li>  it is a connecting punctuation character (such as {@code '_'})
	//      * <li>  it is a digit
	//      * <li>  it is a numeric letter (such as a Roman numeral character)
	//      * <li>  it is a combining mark
	//      * <li>  it is a non-spacing mark
	//      * <li> {@code isIdentifierIgnorable} returns
	//      * {@code true} for the character.
	//      * </ul>
	//      *
	//      * @param   ch the character to be tested.
	//      * @return  {@code true} if the character may be part of a
	//      *          Java identifier; {@code false} otherwise.
	//      * @see     Character#isJavaLetter(char)
	//      * @see     Character#isJavaIdentifierStart(char)
	//      * @see     Character#isJavaIdentifierPart(char)
	//      * @see     Character#isLetter(char)
	//      * @see     Character#isLetterOrDigit(char)
	//      * @see     Character#isUnicodeIdentifierPart(char)
	//      * @see     Character#isIdentifierIgnorable(char)
	//      * @since   1.02
	//      * @deprecated Replaced by isJavaIdentifierPart(char).
	@Deprecated
	public static func isJavaLetterOrDigit(_ ch: AnsiChar) -> Bool {
		return isJavaIdentifierPart(ch)
	}

	// *
	//      * Determines if the specified character (Unicode code point) is an alphabet.
	//      * <p>
	//      * A character is considered to be alphabetic if its general category type,
	//      * provided by {@link Character#getType(int) getType(codePoint)}, is any of
	//      * the following:
	//      * <ul>
	//      * <li> <code>UPPERCASE_LETTER</code>
	//      * <li> <code>LOWERCASE_LETTER</code>
	//      * <li> <code>TITLECASE_LETTER</code>
	//      * <li> <code>MODIFIER_LETTER</code>
	//      * <li> <code>OTHER_LETTER</code>
	//      * <li> <code>LETTER_NUMBER</code>
	//      * </ul>
	//      * or it has contributory property Other_Alphabetic as defined by the
	//      * Unicode Standard.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  <code>true</code> if the character is a Unicode alphabet
	//      *          character, <code>false</code> otherwise.
	//      * @since   1.7
	public static func isAlphabetic(_ codePoint: Int32) -> Bool {
		return isAlphabeticImpl(codePoint)
	}

	@FastNative
	internal static __extern func isAlphabeticImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character (Unicode code point) is a CJKV
	//      * (Chinese, Japanese, Korean and Vietnamese) ideograph, as defined by
	//      * the Unicode Standard.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  <code>true</code> if the character is a Unicode ideograph
	//      *          character, <code>false</code> otherwise.
	//      * @since   1.7
	public static func isIdeographic(_ codePoint: Int32) -> Bool {
		return isIdeographicImpl(codePoint)
	}

	@FastNative
	internal static __extern func isIdeographicImpl(_ codePoint: Int32) -> Bool

	// Android-changed: Removed @see tag (target does not exist on Android):
	//  @see     javax.lang.model.SourceVersion#isIdentifier(CharSequence)
	// *
	//      * Determines if the specified character is
	//      * permissible as the first character in a Java identifier.
	//      * <p>
	//      * A character may start a Java identifier if and only if
	//      * one of the following conditions is true:
	//      * <ul>
	//      * <li> {@link #isLetter(char) isLetter(ch)} returns {@code true}
	//      * <li> {@link #getType(char) getType(ch)} returns {@code LETTER_NUMBER}
	//      * <li> {@code ch} is a currency symbol (such as {@code '$'})
	//      * <li> {@code ch} is a connecting punctuation character (such as {@code '_'}).
	//      * </ul>
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isJavaIdentifierStart(int)} method.
	//      *
	//      * @param   ch the character to be tested.
	//      * @return  {@code true} if the character may start a Java identifier;
	//      *          {@code false} otherwise.
	//      * @see     Character#isJavaIdentifierPart(char)
	//      * @see     Character#isLetter(char)
	//      * @see     Character#isUnicodeIdentifierStart(char)
	//      * @since   1.1
	public static func isJavaIdentifierStart(_ ch: AnsiChar) -> Bool {
		return isJavaIdentifierStart((ch as? Int32))
	}

	// Android-changed: Removed @see tag (target does not exist on Android):
	//  @see     javax.lang.model.SourceVersion#isIdentifier(CharSequence)
	// *
	//      * Determines if the character (Unicode code point) is
	//      * permissible as the first character in a Java identifier.
	//      * <p>
	//      * A character may start a Java identifier if and only if
	//      * one of the following conditions is true:
	//      * <ul>
	//      * <li> {@link #isLetter(int) isLetter(codePoint)}
	//      *      returns {@code true}
	//      * <li> {@link #getType(int) getType(codePoint)}
	//      *      returns {@code LETTER_NUMBER}
	//      * <li> the referenced character is a currency symbol (such as {@code '$'})
	//      * <li> the referenced character is a connecting punctuation character
	//      *      (such as {@code '_'}).
	//      * </ul>
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character may start a Java identifier;
	//      *          {@code false} otherwise.
	//      * @see     Character#isJavaIdentifierPart(int)
	//      * @see     Character#isLetter(int)
	//      * @see     Character#isUnicodeIdentifierStart(int)
	//      * @since   1.5
	public static func isJavaIdentifierStart(_ codePoint: Int32) -> Bool {
		//  Use precomputed bitmasks to optimize the ASCII range.
		if codePoint < 64 {
			return codePoint == "$"
			//  There's only one character in this range.
		} else {
			if codePoint < 128 {
				return (576460745995190270 && (1 << (codePoint - 64))) != 0
			}
		}
		return ((1 << getType(codePoint)) && ((1 << UPPERCASE_LETTER) || (1 << LOWERCASE_LETTER) || (1 << TITLECASE_LETTER) || (1 << MODIFIER_LETTER) || (1 << OTHER_LETTER) || (1 << CURRENCY_SYMBOL) || (1 << CONNECTOR_PUNCTUATION) || (1 << LETTER_NUMBER))) != 0
	}

	// Android-changed: Removed @see tag (target does not exist on Android):
	//  @see     javax.lang.model.SourceVersion#isIdentifier(CharSequence)
	// *
	//      * Determines if the specified character may be part of a Java
	//      * identifier as other than the first character.
	//      * <p>
	//      * A character may be part of a Java identifier if any of the following
	//      * are true:
	//      * <ul>
	//      * <li>  it is a letter
	//      * <li>  it is a currency symbol (such as {@code '$'})
	//      * <li>  it is a connecting punctuation character (such as {@code '_'})
	//      * <li>  it is a digit
	//      * <li>  it is a numeric letter (such as a Roman numeral character)
	//      * <li>  it is a combining mark
	//      * <li>  it is a non-spacing mark
	//      * <li> {@code isIdentifierIgnorable} returns
	//      * {@code true} for the character
	//      * </ul>
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isJavaIdentifierPart(int)} method.
	//      *
	//      * @param   ch      the character to be tested.
	//      * @return {@code true} if the character may be part of a
	//      *          Java identifier; {@code false} otherwise.
	//      * @see     Character#isIdentifierIgnorable(char)
	//      * @see     Character#isJavaIdentifierStart(char)
	//      * @see     Character#isLetterOrDigit(char)
	//      * @see     Character#isUnicodeIdentifierPart(char)
	//      * @since   1.1
	public static func isJavaIdentifierPart(_ ch: AnsiChar) -> Bool {
		return isJavaIdentifierPart((ch as? Int32))
	}

	// Android-changed: Removed @see tag (target does not exist on Android):
	//  @see     javax.lang.model.SourceVersion#isIdentifier(CharSequence)
	// *
	//      * Determines if the character (Unicode code point) may be part of a Java
	//      * identifier as other than the first character.
	//      * <p>
	//      * A character may be part of a Java identifier if any of the following
	//      * are true:
	//      * <ul>
	//      * <li>  it is a letter
	//      * <li>  it is a currency symbol (such as {@code '$'})
	//      * <li>  it is a connecting punctuation character (such as {@code '_'})
	//      * <li>  it is a digit
	//      * <li>  it is a numeric letter (such as a Roman numeral character)
	//      * <li>  it is a combining mark
	//      * <li>  it is a non-spacing mark
	//      * <li> {@link #isIdentifierIgnorable(int)
	//      * isIdentifierIgnorable(codePoint)} returns {@code true} for
	//      * the character
	//      * </ul>
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return {@code true} if the character may be part of a
	//      *          Java identifier; {@code false} otherwise.
	//      * @see     Character#isIdentifierIgnorable(int)
	//      * @see     Character#isJavaIdentifierStart(int)
	//      * @see     Character#isLetterOrDigit(int)
	//      * @see     Character#isUnicodeIdentifierPart(int)
	//      * @since   1.5
	public static func isJavaIdentifierPart(_ codePoint: Int32) -> Bool {
		//  Use precomputed bitmasks to optimize the ASCII range.
		if codePoint < 64 {
			return (287948970162897407 && (1 << codePoint)) != 0
		} else {
			if codePoint < 128 {
				return (-8646911290859585538 && (1 << (codePoint - 64))) != 0
			}
		}
		return (((1 << getType(codePoint)) && ((1 << UPPERCASE_LETTER) || (1 << LOWERCASE_LETTER) || (1 << TITLECASE_LETTER) || (1 << MODIFIER_LETTER) || (1 << OTHER_LETTER) || (1 << CURRENCY_SYMBOL) || (1 << CONNECTOR_PUNCTUATION) || (1 << DECIMAL_DIGIT_NUMBER) || (1 << LETTER_NUMBER) || (1 << FORMAT) || (1 << COMBINING_SPACING_MARK) || (1 << NON_SPACING_MARK))) != 0) | ((codePoint >= 0) & (codePoint <= 8)) | ((codePoint >= 0x000000000000000E) & (codePoint <= 0x1B)) | ((codePoint >= 0x7F) & (codePoint <= 0x9F))
	}

	// *
	//      * Determines if the specified character is permissible as the
	//      * first character in a Unicode identifier.
	//      * <p>
	//      * A character may start a Unicode identifier if and only if
	//      * one of the following conditions is true:
	//      * <ul>
	//      * <li> {@link #isLetter(char) isLetter(ch)} returns {@code true}
	//      * <li> {@link #getType(char) getType(ch)} returns
	//      *      {@code LETTER_NUMBER}.
	//      * </ul>
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isUnicodeIdentifierStart(int)} method.
	//      *
	//      * @param   ch      the character to be tested.
	//      * @return  {@code true} if the character may start a Unicode
	//      *          identifier; {@code false} otherwise.
	//      * @see     Character#isJavaIdentifierStart(char)
	//      * @see     Character#isLetter(char)
	//      * @see     Character#isUnicodeIdentifierPart(char)
	//      * @since   1.1
	public static func isUnicodeIdentifierStart(_ ch: AnsiChar) -> Bool {
		return isUnicodeIdentifierStart((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) is permissible as the
	//      * first character in a Unicode identifier.
	//      * <p>
	//      * A character may start a Unicode identifier if and only if
	//      * one of the following conditions is true:
	//      * <ul>
	//      * <li> {@link #isLetter(int) isLetter(codePoint)}
	//      *      returns {@code true}
	//      * <li> {@link #getType(int) getType(codePoint)}
	//      *      returns {@code LETTER_NUMBER}.
	//      * </ul>
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character may start a Unicode
	//      *          identifier; {@code false} otherwise.
	//      * @see     Character#isJavaIdentifierStart(int)
	//      * @see     Character#isLetter(int)
	//      * @see     Character#isUnicodeIdentifierPart(int)
	//      * @since   1.5
	public static func isUnicodeIdentifierStart(_ codePoint: Int32) -> Bool {
		return isUnicodeIdentifierStartImpl(codePoint)
	}

	@FastNative
	internal static __extern func isUnicodeIdentifierStartImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character may be part of a Unicode
	//      * identifier as other than the first character.
	//      * <p>
	//      * A character may be part of a Unicode identifier if and only if
	//      * one of the following statements is true:
	//      * <ul>
	//      * <li>  it is a letter
	//      * <li>  it is a connecting punctuation character (such as {@code '_'})
	//      * <li>  it is a digit
	//      * <li>  it is a numeric letter (such as a Roman numeral character)
	//      * <li>  it is a combining mark
	//      * <li>  it is a non-spacing mark
	//      * <li> {@code isIdentifierIgnorable} returns
	//      * {@code true} for this character.
	//      * </ul>
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isUnicodeIdentifierPart(int)} method.
	//      *
	//      * @param   ch      the character to be tested.
	//      * @return  {@code true} if the character may be part of a
	//      *          Unicode identifier; {@code false} otherwise.
	//      * @see     Character#isIdentifierIgnorable(char)
	//      * @see     Character#isJavaIdentifierPart(char)
	//      * @see     Character#isLetterOrDigit(char)
	//      * @see     Character#isUnicodeIdentifierStart(char)
	//      * @since   1.1
	public static func isUnicodeIdentifierPart(_ ch: AnsiChar) -> Bool {
		return isUnicodeIdentifierPart((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) may be part of a Unicode
	//      * identifier as other than the first character.
	//      * <p>
	//      * A character may be part of a Unicode identifier if and only if
	//      * one of the following statements is true:
	//      * <ul>
	//      * <li>  it is a letter
	//      * <li>  it is a connecting punctuation character (such as {@code '_'})
	//      * <li>  it is a digit
	//      * <li>  it is a numeric letter (such as a Roman numeral character)
	//      * <li>  it is a combining mark
	//      * <li>  it is a non-spacing mark
	//      * <li> {@code isIdentifierIgnorable} returns
	//      * {@code true} for this character.
	//      * </ul>
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character may be part of a
	//      *          Unicode identifier; {@code false} otherwise.
	//      * @see     Character#isIdentifierIgnorable(int)
	//      * @see     Character#isJavaIdentifierPart(int)
	//      * @see     Character#isLetterOrDigit(int)
	//      * @see     Character#isUnicodeIdentifierStart(int)
	//      * @since   1.5
	public static func isUnicodeIdentifierPart(_ codePoint: Int32) -> Bool {
		return isUnicodeIdentifierPartImpl(codePoint)
	}

	@FastNative
	internal static __extern func isUnicodeIdentifierPartImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character should be regarded as
	//      * an ignorable character in a Java identifier or a Unicode identifier.
	//      * <p>
	//      * The following Unicode characters are ignorable in a Java identifier
	//      * or a Unicode identifier:
	//      * <ul>
	//      * <li>ISO control characters that are not whitespace
	//      * <ul>
	//      * <li>{@code '\u005Cu0000'} through {@code '\u005Cu0008'}
	//      * <li>{@code '\u005Cu000E'} through {@code '\u005Cu001B'}
	//      * <li>{@code '\u005Cu007F'} through {@code '\u005Cu009F'}
	//      * </ul>
	//      *
	//      * <li>all characters that have the {@code FORMAT} general
	//      * category value
	//      * </ul>
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isIdentifierIgnorable(int)} method.
	//      *
	//      * @param   ch      the character to be tested.
	//      * @return  {@code true} if the character is an ignorable control
	//      *          character that may be part of a Java or Unicode identifier;
	//      *           {@code false} otherwise.
	//      * @see     Character#isJavaIdentifierPart(char)
	//      * @see     Character#isUnicodeIdentifierPart(char)
	//      * @since   1.1
	public static func isIdentifierIgnorable(_ ch: AnsiChar) -> Bool {
		return isIdentifierIgnorable((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) should be regarded as
	//      * an ignorable character in a Java identifier or a Unicode identifier.
	//      * <p>
	//      * The following Unicode characters are ignorable in a Java identifier
	//      * or a Unicode identifier:
	//      * <ul>
	//      * <li>ISO control characters that are not whitespace
	//      * <ul>
	//      * <li>{@code '\u005Cu0000'} through {@code '\u005Cu0008'}
	//      * <li>{@code '\u005Cu000E'} through {@code '\u005Cu001B'}
	//      * <li>{@code '\u005Cu007F'} through {@code '\u005Cu009F'}
	//      * </ul>
	//      *
	//      * <li>all characters that have the {@code FORMAT} general
	//      * category value
	//      * </ul>
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is an ignorable control
	//      *          character that may be part of a Java or Unicode identifier;
	//      *          {@code false} otherwise.
	//      * @see     Character#isJavaIdentifierPart(int)
	//      * @see     Character#isUnicodeIdentifierPart(int)
	//      * @since   1.5
	public static func isIdentifierIgnorable(_ codePoint: Int32) -> Bool {
		return isIdentifierIgnorableImpl(codePoint)
	}

	@FastNative
	internal static __extern func isIdentifierIgnorableImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Converts the character argument to lowercase using case
	//      * mapping information from the UnicodeData file.
	//      * <p>
	//      * Note that
	//      * {@code Character.isLowerCase(Character.toLowerCase(ch))}
	//      * does not always return {@code true} for some ranges of
	//      * characters, particularly those that are symbols or ideographs.
	//      *
	//      * <p>In general, {@link String#toLowerCase()} should be used to map
	//      * characters to lowercase. {@code String} case mapping methods
	//      * have several benefits over {@code Character} case mapping methods.
	//      * {@code String} case mapping methods can perform locale-sensitive
	//      * mappings, context-sensitive mappings, and 1:M character mappings, whereas
	//      * the {@code Character} case mapping methods cannot.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #toLowerCase(int)} method.
	//      *
	//      * @param   ch   the character to be converted.
	//      * @return  the lowercase equivalent of the character, if any;
	//      *          otherwise, the character itself.
	//      * @see     Character#isLowerCase(char)
	//      * @see     String#toLowerCase()
	public static func toLowerCase(_ ch: AnsiChar) -> AnsiChar {
		return (toLowerCase((ch as? Int32)) as? AnsiChar)
	}

	// *
	//      * Converts the character (Unicode code point) argument to
	//      * lowercase using case mapping information from the UnicodeData
	//      * file.
	//      *
	//      * <p> Note that
	//      * {@code Character.isLowerCase(Character.toLowerCase(codePoint))}
	//      * does not always return {@code true} for some ranges of
	//      * characters, particularly those that are symbols or ideographs.
	//      *
	//      * <p>In general, {@link String#toLowerCase()} should be used to map
	//      * characters to lowercase. {@code String} case mapping methods
	//      * have several benefits over {@code Character} case mapping methods.
	//      * {@code String} case mapping methods can perform locale-sensitive
	//      * mappings, context-sensitive mappings, and 1:M character mappings, whereas
	//      * the {@code Character} case mapping methods cannot.
	//      *
	//      * @param   codePoint   the character (Unicode code point) to be converted.
	//      * @return  the lowercase equivalent of the character (Unicode code
	//      *          point), if any; otherwise, the character itself.
	//      * @see     Character#isLowerCase(int)
	//      * @see     String#toLowerCase()
	//      *
	//      * @since   1.5
	public static func toLowerCase(_ codePoint: Int32) -> Int32 {
		if (codePoint >= "A") & (codePoint <= "Z") {
			return codePoint + ("a" - "A")
		}
		//  All ASCII codepoints except the ones above remain unchanged.
		if codePoint < 0x80 {
			return codePoint
		}
		return toLowerCaseImpl(codePoint)
	}

	@FastNative
	internal static __extern func toLowerCaseImpl(_ codePoint: Int32) -> Int32

	// *
	//      * Converts the character argument to uppercase using case mapping
	//      * information from the UnicodeData file.
	//      * <p>
	//      * Note that
	//      * {@code Character.isUpperCase(Character.toUpperCase(ch))}
	//      * does not always return {@code true} for some ranges of
	//      * characters, particularly those that are symbols or ideographs.
	//      *
	//      * <p>In general, {@link String#toUpperCase()} should be used to map
	//      * characters to uppercase. {@code String} case mapping methods
	//      * have several benefits over {@code Character} case mapping methods.
	//      * {@code String} case mapping methods can perform locale-sensitive
	//      * mappings, context-sensitive mappings, and 1:M character mappings, whereas
	//      * the {@code Character} case mapping methods cannot.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #toUpperCase(int)} method.
	//      *
	//      * @param   ch   the character to be converted.
	//      * @return  the uppercase equivalent of the character, if any;
	//      *          otherwise, the character itself.
	//      * @see     Character#isUpperCase(char)
	//      * @see     String#toUpperCase()
	public static func toUpperCase(_ ch: AnsiChar) -> AnsiChar {
		return (toUpperCase((ch as? Int32)) as? AnsiChar)
	}

	// *
	//      * Converts the character (Unicode code point) argument to
	//      * uppercase using case mapping information from the UnicodeData
	//      * file.
	//      *
	//      * <p>Note that
	//      * {@code Character.isUpperCase(Character.toUpperCase(codePoint))}
	//      * does not always return {@code true} for some ranges of
	//      * characters, particularly those that are symbols or ideographs.
	//      *
	//      * <p>In general, {@link String#toUpperCase()} should be used to map
	//      * characters to uppercase. {@code String} case mapping methods
	//      * have several benefits over {@code Character} case mapping methods.
	//      * {@code String} case mapping methods can perform locale-sensitive
	//      * mappings, context-sensitive mappings, and 1:M character mappings, whereas
	//      * the {@code Character} case mapping methods cannot.
	//      *
	//      * @param   codePoint   the character (Unicode code point) to be converted.
	//      * @return  the uppercase equivalent of the character, if any;
	//      *          otherwise, the character itself.
	//      * @see     Character#isUpperCase(int)
	//      * @see     String#toUpperCase()
	//      *
	//      * @since   1.5
	public static func toUpperCase(_ codePoint: Int32) -> Int32 {
		if (codePoint >= "a") & (codePoint <= "z") {
			return codePoint - "a" - "A"
		}
		//  All ASCII codepoints except the ones above remain unchanged.
		if codePoint < 0x80 {
			return codePoint
		}
		return toUpperCaseImpl(codePoint)
	}

	@FastNative
	internal static __extern func toUpperCaseImpl(_ codePoint: Int32) -> Int32

	// *
	//      * Converts the character argument to titlecase using case mapping
	//      * information from the UnicodeData file. If a character has no
	//      * explicit titlecase mapping and is not itself a titlecase char
	//      * according to UnicodeData, then the uppercase mapping is
	//      * returned as an equivalent titlecase mapping. If the
	//      * {@code char} argument is already a titlecase
	//      * {@code char}, the same {@code char} value will be
	//      * returned.
	//      * <p>
	//      * Note that
	//      * {@code Character.isTitleCase(Character.toTitleCase(ch))}
	//      * does not always return {@code true} for some ranges of
	//      * characters.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #toTitleCase(int)} method.
	//      *
	//      * @param   ch   the character to be converted.
	//      * @return  the titlecase equivalent of the character, if any;
	//      *          otherwise, the character itself.
	//      * @see     Character#isTitleCase(char)
	//      * @see     Character#toLowerCase(char)
	//      * @see     Character#toUpperCase(char)
	//      * @since   1.0.2
	public static func toTitleCase(_ ch: AnsiChar) -> AnsiChar {
		return (toTitleCase((ch as? Int32)) as? AnsiChar)
	}

	// *
	//      * Converts the character (Unicode code point) argument to titlecase using case mapping
	//      * information from the UnicodeData file. If a character has no
	//      * explicit titlecase mapping and is not itself a titlecase char
	//      * according to UnicodeData, then the uppercase mapping is
	//      * returned as an equivalent titlecase mapping. If the
	//      * character argument is already a titlecase
	//      * character, the same character value will be
	//      * returned.
	//      *
	//      * <p>Note that
	//      * {@code Character.isTitleCase(Character.toTitleCase(codePoint))}
	//      * does not always return {@code true} for some ranges of
	//      * characters.
	//      *
	//      * @param   codePoint   the character (Unicode code point) to be converted.
	//      * @return  the titlecase equivalent of the character, if any;
	//      *          otherwise, the character itself.
	//      * @see     Character#isTitleCase(int)
	//      * @see     Character#toLowerCase(int)
	//      * @see     Character#toUpperCase(int)
	//      * @since   1.5
	public static func toTitleCase(_ codePoint: Int32) -> Int32 {
		return toTitleCaseImpl(codePoint)
	}

	@FastNative
	internal static __extern func toTitleCaseImpl(_ codePoint: Int32) -> Int32

	// *
	//      * Returns the numeric value of the character {@code ch} in the
	//      * specified radix.
	//      * <p>
	//      * If the radix is not in the range {@code MIN_RADIX} &le;
	//      * {@code radix} &le; {@code MAX_RADIX} or if the
	//      * value of {@code ch} is not a valid digit in the specified
	//      * radix, {@code -1} is returned. A character is a valid digit
	//      * if at least one of the following is true:
	//      * <ul>
	//      * <li>The method {@code isDigit} is {@code true} of the character
	//      *     and the Unicode decimal digit value of the character (or its
	//      *     single-character decomposition) is less than the specified radix.
	//      *     In this case the decimal digit value is returned.
	//      * <li>The character is one of the uppercase Latin letters
	//      *     {@code 'A'} through {@code 'Z'} and its code is less than
	//      *     {@code radix + 'A' - 10}.
	//      *     In this case, {@code ch - 'A' + 10}
	//      *     is returned.
	//      * <li>The character is one of the lowercase Latin letters
	//      *     {@code 'a'} through {@code 'z'} and its code is less than
	//      *     {@code radix + 'a' - 10}.
	//      *     In this case, {@code ch - 'a' + 10}
	//      *     is returned.
	//      * <li>The character is one of the fullwidth uppercase Latin letters A
	//      *     ({@code '\u005CuFF21'}) through Z ({@code '\u005CuFF3A'})
	//      *     and its code is less than
	//      *     {@code radix + '\u005CuFF21' - 10}.
	//      *     In this case, {@code ch - '\u005CuFF21' + 10}
	//      *     is returned.
	//      * <li>The character is one of the fullwidth lowercase Latin letters a
	//      *     ({@code '\u005CuFF41'}) through z ({@code '\u005CuFF5A'})
	//      *     and its code is less than
	//      *     {@code radix + '\u005CuFF41' - 10}.
	//      *     In this case, {@code ch - '\u005CuFF41' + 10}
	//      *     is returned.
	//      * </ul>
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #digit(int, int)} method.
	//      *
	//      * @param   ch      the character to be converted.
	//      * @param   radix   the radix.
	//      * @return  the numeric value represented by the character in the
	//      *          specified radix.
	//      * @see     Character#forDigit(int, int)
	//      * @see     Character#isDigit(char)
	public static func digit(_ ch: AnsiChar, _ radix: Int32) -> Int32 {
		return digit((ch as? Int32), radix)
	}

	// *
	//      * Returns the numeric value of the specified character (Unicode
	//      * code point) in the specified radix.
	//      *
	//      * <p>If the radix is not in the range {@code MIN_RADIX} &le;
	//      * {@code radix} &le; {@code MAX_RADIX} or if the
	//      * character is not a valid digit in the specified
	//      * radix, {@code -1} is returned. A character is a valid digit
	//      * if at least one of the following is true:
	//      * <ul>
	//      * <li>The method {@link #isDigit(int) isDigit(codePoint)} is {@code true} of the character
	//      *     and the Unicode decimal digit value of the character (or its
	//      *     single-character decomposition) is less than the specified radix.
	//      *     In this case the decimal digit value is returned.
	//      * <li>The character is one of the uppercase Latin letters
	//      *     {@code 'A'} through {@code 'Z'} and its code is less than
	//      *     {@code radix + 'A' - 10}.
	//      *     In this case, {@code codePoint - 'A' + 10}
	//      *     is returned.
	//      * <li>The character is one of the lowercase Latin letters
	//      *     {@code 'a'} through {@code 'z'} and its code is less than
	//      *     {@code radix + 'a' - 10}.
	//      *     In this case, {@code codePoint - 'a' + 10}
	//      *     is returned.
	//      * <li>The character is one of the fullwidth uppercase Latin letters A
	//      *     ({@code '\u005CuFF21'}) through Z ({@code '\u005CuFF3A'})
	//      *     and its code is less than
	//      *     {@code radix + '\u005CuFF21' - 10}.
	//      *     In this case,
	//      *     {@code codePoint - '\u005CuFF21' + 10}
	//      *     is returned.
	//      * <li>The character is one of the fullwidth lowercase Latin letters a
	//      *     ({@code '\u005CuFF41'}) through z ({@code '\u005CuFF5A'})
	//      *     and its code is less than
	//      *     {@code radix + '\u005CuFF41'- 10}.
	//      *     In this case,
	//      *     {@code codePoint - '\u005CuFF41' + 10}
	//      *     is returned.
	//      * </ul>
	//      *
	//      * @param   codePoint the character (Unicode code point) to be converted.
	//      * @param   radix   the radix.
	//      * @return  the numeric value represented by the character in the
	//      *          specified radix.
	//      * @see     Character#forDigit(int, int)
	//      * @see     Character#isDigit(int)
	//      * @since   1.5
	public static func digit(_ codePoint: Int32, _ radix: Int32) -> Int32 {
		if (radix < MIN_RADIX) | (radix > MAX_RADIX) {
			return -1
		}
		if codePoint < 128 {
			//  Optimized for ASCII
			var result: Int32 = -1
			if ("0" <= codePoint) & (codePoint <= "9") {
				result = codePoint - "0"
			} else {
				if ("a" <= codePoint) & (codePoint <= "z") {
					result = 10 + (codePoint - "a")
				} else {
					if ("A" <= codePoint) & (codePoint <= "Z") {
						result = 10 + (codePoint - "A")
					}
				}
			}
			return (result < radix ? result : -1)
		}
		return digitImpl(codePoint, radix)
	}

	@FastNative
	internal static __extern func digitImpl(_ codePoint: Int32, _ radix: Int32) -> Int32

	// *
	//      * Returns the {@code int} value that the specified Unicode
	//      * character represents. For example, the character
	//      * {@code '\u005Cu216C'} (the roman numeral fifty) will return
	//      * an int with a value of 50.
	//      * <p>
	//      * The letters A-Z in their uppercase ({@code '\u005Cu0041'} through
	//      * {@code '\u005Cu005A'}), lowercase
	//      * ({@code '\u005Cu0061'} through {@code '\u005Cu007A'}), and
	//      * full width variant ({@code '\u005CuFF21'} through
	//      * {@code '\u005CuFF3A'} and {@code '\u005CuFF41'} through
	//      * {@code '\u005CuFF5A'}) forms have numeric values from 10
	//      * through 35. This is independent of the Unicode specification,
	//      * which does not assign numeric values to these {@code char}
	//      * values.
	//      * <p>
	//      * If the character does not have a numeric value, then -1 is returned.
	//      * If the character has a numeric value that cannot be represented as a
	//      * nonnegative integer (for example, a fractional value), then -2
	//      * is returned.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #getNumericValue(int)} method.
	//      *
	//      * @param   ch      the character to be converted.
	//      * @return  the numeric value of the character, as a nonnegative {@code int}
	//      *           value; -2 if the character has a numeric value that is not a
	//      *          nonnegative integer; -1 if the character has no numeric value.
	//      * @see     Character#forDigit(int, int)
	//      * @see     Character#isDigit(char)
	//      * @since   1.1
	public static func getNumericValue(_ ch: AnsiChar) -> Int32 {
		return getNumericValue((ch as? Int32))
	}

	// *
	//      * Returns the {@code int} value that the specified
	//      * character (Unicode code point) represents. For example, the character
	//      * {@code '\u005Cu216C'} (the Roman numeral fifty) will return
	//      * an {@code int} with a value of 50.
	//      * <p>
	//      * The letters A-Z in their uppercase ({@code '\u005Cu0041'} through
	//      * {@code '\u005Cu005A'}), lowercase
	//      * ({@code '\u005Cu0061'} through {@code '\u005Cu007A'}), and
	//      * full width variant ({@code '\u005CuFF21'} through
	//      * {@code '\u005CuFF3A'} and {@code '\u005CuFF41'} through
	//      * {@code '\u005CuFF5A'}) forms have numeric values from 10
	//      * through 35. This is independent of the Unicode specification,
	//      * which does not assign numeric values to these {@code char}
	//      * values.
	//      * <p>
	//      * If the character does not have a numeric value, then -1 is returned.
	//      * If the character has a numeric value that cannot be represented as a
	//      * nonnegative integer (for example, a fractional value), then -2
	//      * is returned.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be converted.
	//      * @return  the numeric value of the character, as a nonnegative {@code int}
	//      *          value; -2 if the character has a numeric value that is not a
	//      *          nonnegative integer; -1 if the character has no numeric value.
	//      * @see     Character#forDigit(int, int)
	//      * @see     Character#isDigit(int)
	//      * @since   1.5
	public static func getNumericValue(_ codePoint: Int32) -> Int32 {
		//  This is both an optimization and papers over differences between Java and ICU.
		if codePoint < 128 {
			if (codePoint >= "0") & (codePoint <= "9") {
				return codePoint - "0"
			}
			if (codePoint >= "a") & (codePoint <= "z") {
				return codePoint - "a" - 10
			}
			if (codePoint >= "A") & (codePoint <= "Z") {
				return codePoint - "A" - 10
			}
			return -1
		}
		//  Full-width uppercase A-Z.
		if (codePoint >= 0xFF21) & (codePoint <= 0xFF3A) {
			return codePoint - 0xFF17
		}
		//  Full-width lowercase a-z.
		if (codePoint >= 0xFF41) & (codePoint <= 0xFF5A) {
			return codePoint - 0xFF37
		}
		return getNumericValueImpl(codePoint)
	}

	@FastNative
	internal static __extern func getNumericValueImpl(_ codePoint: Int32) -> Int32

	// *
	//      * Determines if the specified character is ISO-LATIN-1 white space.
	//      * This method returns {@code true} for the following five
	//      * characters only:
	//      * <table summary="truechars">
	//      * <tr><td>{@code '\t'}</td>            <td>{@code U+0009}</td>
	//      *     <td>{@code HORIZONTAL TABULATION}</td></tr>
	//      * <tr><td>{@code '\n'}</td>            <td>{@code U+000A}</td>
	//      *     <td>{@code NEW LINE}</td></tr>
	//      * <tr><td>{@code '\f'}</td>            <td>{@code U+000C}</td>
	//      *     <td>{@code FORM FEED}</td></tr>
	//      * <tr><td>{@code '\r'}</td>            <td>{@code U+000D}</td>
	//      *     <td>{@code CARRIAGE RETURN}</td></tr>
	//      * <tr><td>{@code ' '}</td>             <td>{@code U+0020}</td>
	//      *     <td>{@code SPACE}</td></tr>
	//      * </table>
	//      *
	//      * @param      ch   the character to be tested.
	//      * @return     {@code true} if the character is ISO-LATIN-1 white
	//      *             space; {@code false} otherwise.
	//      * @see        Character#isSpaceChar(char)
	//      * @see        Character#isWhitespace(char)
	//      * @deprecated Replaced by isWhitespace(char).
	@Deprecated
	public static func isSpace(_ ch: AnsiChar) -> Bool {
		return (ch <= 0x20) & (((((1 << 0x0000000000000009) || (1 << 0x000000000000000A) || (1 << 0x000000000000000C) || (1 << 0x000000000000000D) || (1 << 0x20)) >> ch) && 1) != 0)
	}

	// *
	//      * Determines if the specified character is a Unicode space character.
	//      * A character is considered to be a space character if and only if
	//      * it is specified to be a space character by the Unicode Standard. This
	//      * method returns true if the character's general category type is any of
	//      * the following:
	//      * <ul>
	//      * <li> {@code SPACE_SEPARATOR}
	//      * <li> {@code LINE_SEPARATOR}
	//      * <li> {@code PARAGRAPH_SEPARATOR}
	//      * </ul>
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isSpaceChar(int)} method.
	//      *
	//      * @param   ch      the character to be tested.
	//      * @return  {@code true} if the character is a space character;
	//      *          {@code false} otherwise.
	//      * @see     Character#isWhitespace(char)
	//      * @since   1.1
	public static func isSpaceChar(_ ch: AnsiChar) -> Bool {
		return isSpaceChar((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) is a
	//      * Unicode space character.  A character is considered to be a
	//      * space character if and only if it is specified to be a space
	//      * character by the Unicode Standard. This method returns true if
	//      * the character's general category type is any of the following:
	//      *
	//      * <ul>
	//      * <li> {@link #SPACE_SEPARATOR}
	//      * <li> {@link #LINE_SEPARATOR}
	//      * <li> {@link #PARAGRAPH_SEPARATOR}
	//      * </ul>
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is a space character;
	//      *          {@code false} otherwise.
	//      * @see     Character#isWhitespace(int)
	//      * @since   1.5
	public static func isSpaceChar(_ codePoint: Int32) -> Bool {
		//  We don't just call into icu4c because of the JNI overhead. Ideally we'd fix that.
		//  SPACE or NO-BREAK SPACE?
		if (codePoint == 0x20) | (codePoint == 0xA0) {
			return true
		}
		if codePoint < 0x1000 {
			return false
		}
		//  OGHAM SPACE MARK or MONGOLIAN VOWEL SEPARATOR?
		if (codePoint == 0x1680) | (codePoint == 0x180E) {
			return true
		}
		if codePoint < 0x2000 {
			return false
		}
		if codePoint <= 0xFFFF {
			//  Other whitespace from General Punctuation...
			return (codePoint <= 0x200A) | (codePoint == 0x2028) | (codePoint == 0x2029) | (codePoint == 0x202F) | (codePoint == 0x205F) | (codePoint == 0x3000)
			//  ...or CJK Symbols and Punctuation?
		}
		//  Let icu4c worry about non-BMP code points.
		return isSpaceCharImpl(codePoint)
	}

	@FastNative
	internal static __extern func isSpaceCharImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character is white space according to Java.
	//      * A character is a Java whitespace character if and only if it satisfies
	//      * one of the following criteria:
	//      * <ul>
	//      * <li> It is a Unicode space character ({@code SPACE_SEPARATOR},
	//      *      {@code LINE_SEPARATOR}, or {@code PARAGRAPH_SEPARATOR})
	//      *      but is not also a non-breaking space ({@code '\u005Cu00A0'},
	//      *      {@code '\u005Cu2007'}, {@code '\u005Cu202F'}).
	//      * <li> It is {@code '\u005Ct'}, U+0009 HORIZONTAL TABULATION.
	//      * <li> It is {@code '\u005Cn'}, U+000A LINE FEED.
	//      * <li> It is {@code '\u005Cu000B'}, U+000B VERTICAL TABULATION.
	//      * <li> It is {@code '\u005Cf'}, U+000C FORM FEED.
	//      * <li> It is {@code '\u005Cr'}, U+000D CARRIAGE RETURN.
	//      * <li> It is {@code '\u005Cu001C'}, U+001C FILE SEPARATOR.
	//      * <li> It is {@code '\u005Cu001D'}, U+001D GROUP SEPARATOR.
	//      * <li> It is {@code '\u005Cu001E'}, U+001E RECORD SEPARATOR.
	//      * <li> It is {@code '\u005Cu001F'}, U+001F UNIT SEPARATOR.
	//      * </ul>
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isWhitespace(int)} method.
	//      *
	//      * @param   ch the character to be tested.
	//      * @return  {@code true} if the character is a Java whitespace
	//      *          character; {@code false} otherwise.
	//      * @see     Character#isSpaceChar(char)
	//      * @since   1.1
	public static func isWhitespace(_ ch: AnsiChar) -> Bool {
		return isWhitespace((ch as? Int32))
	}

	// *
	//      * Determines if the specified character (Unicode code point) is
	//      * white space according to Java.  A character is a Java
	//      * whitespace character if and only if it satisfies one of the
	//      * following criteria:
	//      * <ul>
	//      * <li> It is a Unicode space character ({@link #SPACE_SEPARATOR},
	//      *      {@link #LINE_SEPARATOR}, or {@link #PARAGRAPH_SEPARATOR})
	//      *      but is not also a non-breaking space ({@code '\u005Cu00A0'},
	//      *      {@code '\u005Cu2007'}, {@code '\u005Cu202F'}).
	//      * <li> It is {@code '\u005Ct'}, U+0009 HORIZONTAL TABULATION.
	//      * <li> It is {@code '\u005Cn'}, U+000A LINE FEED.
	//      * <li> It is {@code '\u005Cu000B'}, U+000B VERTICAL TABULATION.
	//      * <li> It is {@code '\u005Cf'}, U+000C FORM FEED.
	//      * <li> It is {@code '\u005Cr'}, U+000D CARRIAGE RETURN.
	//      * <li> It is {@code '\u005Cu001C'}, U+001C FILE SEPARATOR.
	//      * <li> It is {@code '\u005Cu001D'}, U+001D GROUP SEPARATOR.
	//      * <li> It is {@code '\u005Cu001E'}, U+001E RECORD SEPARATOR.
	//      * <li> It is {@code '\u005Cu001F'}, U+001F UNIT SEPARATOR.
	//      * </ul>
	//      * <p>
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is a Java whitespace
	//      *          character; {@code false} otherwise.
	//      * @see     Character#isSpaceChar(int)
	//      * @since   1.5
	public static func isWhitespace(_ codePoint: Int32) -> Bool {
		//  We don't just call into icu4c because of the JNI overhead. Ideally we'd fix that.
		//  Any ASCII whitespace character?
		if ((codePoint >= 0x1C) & (codePoint <= 0x20)) | ((codePoint >= 0x0000000000000009) & (codePoint <= 0x000000000000000D)) {
			return true
		}
		if codePoint < 0x1000 {
			return false
		}
		//  OGHAM SPACE MARK or MONGOLIAN VOWEL SEPARATOR?
		if (codePoint == 0x1680) | (codePoint == 0x180E) {
			return true
		}
		if codePoint < 0x2000 {
			return false
		}
		//  Exclude General Punctuation's non-breaking spaces (which includes FIGURE SPACE).
		if (codePoint == 0x2007) | (codePoint == 0x202F) {
			return false
		}
		if codePoint <= 0xFFFF {
			//  Other whitespace from General Punctuation...
			return (codePoint <= 0x200A) | (codePoint == 0x2028) | (codePoint == 0x2029) | (codePoint == 0x205F) | (codePoint == 0x3000)
			//  ...or CJK Symbols and Punctuation?
		}
		//  Let icu4c worry about non-BMP code points.
		return isWhitespaceImpl(codePoint)
	}

	@FastNative
	internal static __extern func isWhitespaceImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Determines if the specified character is an ISO control
	//      * character.  A character is considered to be an ISO control
	//      * character if its code is in the range {@code '\u005Cu0000'}
	//      * through {@code '\u005Cu001F'} or in the range
	//      * {@code '\u005Cu007F'} through {@code '\u005Cu009F'}.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isISOControl(int)} method.
	//      *
	//      * @param   ch      the character to be tested.
	//      * @return  {@code true} if the character is an ISO control character;
	//      *          {@code false} otherwise.
	//      *
	//      * @see     Character#isSpaceChar(char)
	//      * @see     Character#isWhitespace(char)
	//      * @since   1.1
	public static func isISOControl(_ ch: AnsiChar) -> Bool {
		return isISOControl((ch as? Int32))
	}

	// *
	//      * Determines if the referenced character (Unicode code point) is an ISO control
	//      * character.  A character is considered to be an ISO control
	//      * character if its code is in the range {@code '\u005Cu0000'}
	//      * through {@code '\u005Cu001F'} or in the range
	//      * {@code '\u005Cu007F'} through {@code '\u005Cu009F'}.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is an ISO control character;
	//      *          {@code false} otherwise.
	//      * @see     Character#isSpaceChar(int)
	//      * @see     Character#isWhitespace(int)
	//      * @since   1.5
	public static func isISOControl(_ codePoint: Int32) -> Bool {
		//  Optimized form of:
		//      (codePoint >= 0x00 && codePoint <= 0x1F) ||
		//      (codePoint >= 0x7F && codePoint <= 0x9F);
		return (codePoint <= 0x9F) & ((codePoint >= 0x7F) | ((codePoint >> 5) == 0))
	}

	// *
	//      * Returns a value indicating a character's general category.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #getType(int)} method.
	//      *
	//      * @param   ch      the character to be tested.
	//      * @return  a value of type {@code int} representing the
	//      *          character's general category.
	//      * @see     Character#COMBINING_SPACING_MARK
	//      * @see     Character#CONNECTOR_PUNCTUATION
	//      * @see     Character#CONTROL
	//      * @see     Character#CURRENCY_SYMBOL
	//      * @see     Character#DASH_PUNCTUATION
	//      * @see     Character#DECIMAL_DIGIT_NUMBER
	//      * @see     Character#ENCLOSING_MARK
	//      * @see     Character#END_PUNCTUATION
	//      * @see     Character#FINAL_QUOTE_PUNCTUATION
	//      * @see     Character#FORMAT
	//      * @see     Character#INITIAL_QUOTE_PUNCTUATION
	//      * @see     Character#LETTER_NUMBER
	//      * @see     Character#LINE_SEPARATOR
	//      * @see     Character#LOWERCASE_LETTER
	//      * @see     Character#MATH_SYMBOL
	//      * @see     Character#MODIFIER_LETTER
	//      * @see     Character#MODIFIER_SYMBOL
	//      * @see     Character#NON_SPACING_MARK
	//      * @see     Character#OTHER_LETTER
	//      * @see     Character#OTHER_NUMBER
	//      * @see     Character#OTHER_PUNCTUATION
	//      * @see     Character#OTHER_SYMBOL
	//      * @see     Character#PARAGRAPH_SEPARATOR
	//      * @see     Character#PRIVATE_USE
	//      * @see     Character#SPACE_SEPARATOR
	//      * @see     Character#START_PUNCTUATION
	//      * @see     Character#SURROGATE
	//      * @see     Character#TITLECASE_LETTER
	//      * @see     Character#UNASSIGNED
	//      * @see     Character#UPPERCASE_LETTER
	//      * @since   1.1
	public static func getType(_ ch: AnsiChar) -> Int32 {
		return getType((ch as? Int32))
	}

	// *
	//      * Returns a value indicating a character's general category.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  a value of type {@code int} representing the
	//      *          character's general category.
	//      * @see     Character#COMBINING_SPACING_MARK COMBINING_SPACING_MARK
	//      * @see     Character#CONNECTOR_PUNCTUATION CONNECTOR_PUNCTUATION
	//      * @see     Character#CONTROL CONTROL
	//      * @see     Character#CURRENCY_SYMBOL CURRENCY_SYMBOL
	//      * @see     Character#DASH_PUNCTUATION DASH_PUNCTUATION
	//      * @see     Character#DECIMAL_DIGIT_NUMBER DECIMAL_DIGIT_NUMBER
	//      * @see     Character#ENCLOSING_MARK ENCLOSING_MARK
	//      * @see     Character#END_PUNCTUATION END_PUNCTUATION
	//      * @see     Character#FINAL_QUOTE_PUNCTUATION FINAL_QUOTE_PUNCTUATION
	//      * @see     Character#FORMAT FORMAT
	//      * @see     Character#INITIAL_QUOTE_PUNCTUATION INITIAL_QUOTE_PUNCTUATION
	//      * @see     Character#LETTER_NUMBER LETTER_NUMBER
	//      * @see     Character#LINE_SEPARATOR LINE_SEPARATOR
	//      * @see     Character#LOWERCASE_LETTER LOWERCASE_LETTER
	//      * @see     Character#MATH_SYMBOL MATH_SYMBOL
	//      * @see     Character#MODIFIER_LETTER MODIFIER_LETTER
	//      * @see     Character#MODIFIER_SYMBOL MODIFIER_SYMBOL
	//      * @see     Character#NON_SPACING_MARK NON_SPACING_MARK
	//      * @see     Character#OTHER_LETTER OTHER_LETTER
	//      * @see     Character#OTHER_NUMBER OTHER_NUMBER
	//      * @see     Character#OTHER_PUNCTUATION OTHER_PUNCTUATION
	//      * @see     Character#OTHER_SYMBOL OTHER_SYMBOL
	//      * @see     Character#PARAGRAPH_SEPARATOR PARAGRAPH_SEPARATOR
	//      * @see     Character#PRIVATE_USE PRIVATE_USE
	//      * @see     Character#SPACE_SEPARATOR SPACE_SEPARATOR
	//      * @see     Character#START_PUNCTUATION START_PUNCTUATION
	//      * @see     Character#SURROGATE SURROGATE
	//      * @see     Character#TITLECASE_LETTER TITLECASE_LETTER
	//      * @see     Character#UNASSIGNED UNASSIGNED
	//      * @see     Character#UPPERCASE_LETTER UPPERCASE_LETTER
	//      * @since   1.5
	public static func getType(_ codePoint: Int32) -> Int32 {
		var type: Int32 = getTypeImpl(codePoint)
		//  The type values returned by ICU are not RI-compatible. The RI skips the value 17.
		if type <= Character.FORMAT {
			return type
		}
		return type + 1
	}

	@FastNative
	internal static __extern func getTypeImpl(_ codePoint: Int32) -> Int32

	// *
	//      * Determines the character representation for a specific digit in
	//      * the specified radix. If the value of {@code radix} is not a
	//      * valid radix, or the value of {@code digit} is not a valid
	//      * digit in the specified radix, the null character
	//      * ({@code '\u005Cu0000'}) is returned.
	//      * <p>
	//      * The {@code radix} argument is valid if it is greater than or
	//      * equal to {@code MIN_RADIX} and less than or equal to
	//      * {@code MAX_RADIX}. The {@code digit} argument is valid if
	//      * {@code 0 <= digit < radix}.
	//      * <p>
	//      * If the digit is less than 10, then
	//      * {@code '0' + digit} is returned. Otherwise, the value
	//      * {@code 'a' + digit - 10} is returned.
	//      *
	//      * @param   digit   the number to convert to a character.
	//      * @param   radix   the radix.
	//      * @return  the {@code char} representation of the specified digit
	//      *          in the specified radix.
	//      * @see     Character#MIN_RADIX
	//      * @see     Character#MAX_RADIX
	//      * @see     Character#digit(char, int)
	public static func forDigit(_ digit: Int32, _ radix: Int32) -> AnsiChar {
		if (digit >= radix) | (digit < 0) {
			return "\0"
		}
		if (radix < Character.MIN_RADIX) | (radix > Character.MAX_RADIX) {
			return "\0"
		}
		if digit < 10 {
			return ("0" + digit as? AnsiChar)
		}
		return (("a" - 10) + digit as? AnsiChar)
	}

	// *
	//      * Returns the Unicode directionality property for the given
	//      * character.  Character directionality is used to calculate the
	//      * visual ordering of text. The directionality value of undefined
	//      * {@code char} values is {@code DIRECTIONALITY_UNDEFINED}.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #getDirectionality(int)} method.
	//      *
	//      * @param  ch {@code char} for which the directionality property
	//      *            is requested.
	//      * @return the directionality property of the {@code char} value.
	//      *
	//      * @see Character#DIRECTIONALITY_UNDEFINED
	//      * @see Character#DIRECTIONALITY_LEFT_TO_RIGHT
	//      * @see Character#DIRECTIONALITY_RIGHT_TO_LEFT
	//      * @see Character#DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC
	//      * @see Character#DIRECTIONALITY_EUROPEAN_NUMBER
	//      * @see Character#DIRECTIONALITY_EUROPEAN_NUMBER_SEPARATOR
	//      * @see Character#DIRECTIONALITY_EUROPEAN_NUMBER_TERMINATOR
	//      * @see Character#DIRECTIONALITY_ARABIC_NUMBER
	//      * @see Character#DIRECTIONALITY_COMMON_NUMBER_SEPARATOR
	//      * @see Character#DIRECTIONALITY_NONSPACING_MARK
	//      * @see Character#DIRECTIONALITY_BOUNDARY_NEUTRAL
	//      * @see Character#DIRECTIONALITY_PARAGRAPH_SEPARATOR
	//      * @see Character#DIRECTIONALITY_SEGMENT_SEPARATOR
	//      * @see Character#DIRECTIONALITY_WHITESPACE
	//      * @see Character#DIRECTIONALITY_OTHER_NEUTRALS
	//      * @see Character#DIRECTIONALITY_LEFT_TO_RIGHT_EMBEDDING
	//      * @see Character#DIRECTIONALITY_LEFT_TO_RIGHT_OVERRIDE
	//      * @see Character#DIRECTIONALITY_RIGHT_TO_LEFT_EMBEDDING
	//      * @see Character#DIRECTIONALITY_RIGHT_TO_LEFT_OVERRIDE
	//      * @see Character#DIRECTIONALITY_POP_DIRECTIONAL_FORMAT
	//      * @since 1.4
	public static func getDirectionality(_ ch: AnsiChar) -> Int8 {
		return getDirectionality((ch as? Int32))
	}

	// *
	//      * Returns the Unicode directionality property for the given
	//      * character (Unicode code point).  Character directionality is
	//      * used to calculate the visual ordering of text. The
	//      * directionality value of undefined character is {@link
	//      * #DIRECTIONALITY_UNDEFINED}.
	//      *
	//      * @param   codePoint the character (Unicode code point) for which
	//      *          the directionality property is requested.
	//      * @return the directionality property of the character.
	//      *
	//      * @see Character#DIRECTIONALITY_UNDEFINED DIRECTIONALITY_UNDEFINED
	//      * @see Character#DIRECTIONALITY_LEFT_TO_RIGHT DIRECTIONALITY_LEFT_TO_RIGHT
	//      * @see Character#DIRECTIONALITY_RIGHT_TO_LEFT DIRECTIONALITY_RIGHT_TO_LEFT
	//      * @see Character#DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC
	//      * @see Character#DIRECTIONALITY_EUROPEAN_NUMBER DIRECTIONALITY_EUROPEAN_NUMBER
	//      * @see Character#DIRECTIONALITY_EUROPEAN_NUMBER_SEPARATOR DIRECTIONALITY_EUROPEAN_NUMBER_SEPARATOR
	//      * @see Character#DIRECTIONALITY_EUROPEAN_NUMBER_TERMINATOR DIRECTIONALITY_EUROPEAN_NUMBER_TERMINATOR
	//      * @see Character#DIRECTIONALITY_ARABIC_NUMBER DIRECTIONALITY_ARABIC_NUMBER
	//      * @see Character#DIRECTIONALITY_COMMON_NUMBER_SEPARATOR DIRECTIONALITY_COMMON_NUMBER_SEPARATOR
	//      * @see Character#DIRECTIONALITY_NONSPACING_MARK DIRECTIONALITY_NONSPACING_MARK
	//      * @see Character#DIRECTIONALITY_BOUNDARY_NEUTRAL DIRECTIONALITY_BOUNDARY_NEUTRAL
	//      * @see Character#DIRECTIONALITY_PARAGRAPH_SEPARATOR DIRECTIONALITY_PARAGRAPH_SEPARATOR
	//      * @see Character#DIRECTIONALITY_SEGMENT_SEPARATOR DIRECTIONALITY_SEGMENT_SEPARATOR
	//      * @see Character#DIRECTIONALITY_WHITESPACE DIRECTIONALITY_WHITESPACE
	//      * @see Character#DIRECTIONALITY_OTHER_NEUTRALS DIRECTIONALITY_OTHER_NEUTRALS
	//      * @see Character#DIRECTIONALITY_LEFT_TO_RIGHT_EMBEDDING DIRECTIONALITY_LEFT_TO_RIGHT_EMBEDDING
	//      * @see Character#DIRECTIONALITY_LEFT_TO_RIGHT_OVERRIDE DIRECTIONALITY_LEFT_TO_RIGHT_OVERRIDE
	//      * @see Character#DIRECTIONALITY_RIGHT_TO_LEFT_EMBEDDING DIRECTIONALITY_RIGHT_TO_LEFT_EMBEDDING
	//      * @see Character#DIRECTIONALITY_RIGHT_TO_LEFT_OVERRIDE DIRECTIONALITY_RIGHT_TO_LEFT_OVERRIDE
	//      * @see Character#DIRECTIONALITY_POP_DIRECTIONAL_FORMAT DIRECTIONALITY_POP_DIRECTIONAL_FORMAT
	//      * @since    1.5
	public static func getDirectionality(_ codePoint: Int32) -> Int8 {
		if getType(codePoint) == Character.UNASSIGNED {
			return Character.DIRECTIONALITY_UNDEFINED
		}
		var directionality: Int8 = getDirectionalityImpl(codePoint)
		if (directionality >= 0) & (directionality < DIRECTIONALITY.length) {
			return DIRECTIONALITY[directionality]
		}
		return Character.DIRECTIONALITY_UNDEFINED
	}

	@FastNative
	internal static __extern func getDirectionalityImpl(_ codePoint: Int32) -> Int8

	// *
	//      * Determines whether the character is mirrored according to the
	//      * Unicode specification.  Mirrored characters should have their
	//      * glyphs horizontally mirrored when displayed in text that is
	//      * right-to-left.  For example, {@code '\u005Cu0028'} LEFT
	//      * PARENTHESIS is semantically defined to be an <i>opening
	//      * parenthesis</i>.  This will appear as a "(" in text that is
	//      * left-to-right but as a ")" in text that is right-to-left.
	//      *
	//      * <p><b>Note:</b> This method cannot handle <a
	//      * href="#supplementary"> supplementary characters</a>. To support
	//      * all Unicode characters, including supplementary characters, use
	//      * the {@link #isMirrored(int)} method.
	//      *
	//      * @param  ch {@code char} for which the mirrored property is requested
	//      * @return {@code true} if the char is mirrored, {@code false}
	//      *         if the {@code char} is not mirrored or is not defined.
	//      * @since 1.4
	public static func isMirrored(_ ch: AnsiChar) -> Bool {
		return isMirrored((ch as? Int32))
	}

	// *
	//      * Determines whether the specified character (Unicode code point)
	//      * is mirrored according to the Unicode specification.  Mirrored
	//      * characters should have their glyphs horizontally mirrored when
	//      * displayed in text that is right-to-left.  For example,
	//      * {@code '\u005Cu0028'} LEFT PARENTHESIS is semantically
	//      * defined to be an <i>opening parenthesis</i>.  This will appear
	//      * as a "(" in text that is left-to-right but as a ")" in text
	//      * that is right-to-left.
	//      *
	//      * @param   codePoint the character (Unicode code point) to be tested.
	//      * @return  {@code true} if the character is mirrored, {@code false}
	//      *          if the character is not mirrored or is not defined.
	//      * @since   1.5
	public static func isMirrored(_ codePoint: Int32) -> Bool {
		return isMirroredImpl(codePoint)
	}

	@FastNative
	internal static __extern func isMirroredImpl(_ codePoint: Int32) -> Bool

	// *
	//      * Compares two {@code Character} objects numerically.
	//      *
	//      * @param   anotherCharacter   the {@code Character} to be compared.
	// 
	//      * @return  the value {@code 0} if the argument {@code Character}
	//      *          is equal to this {@code Character}; a value less than
	//      *          {@code 0} if this {@code Character} is numerically less
	//      *          than the {@code Character} argument; and a value greater than
	//      *          {@code 0} if this {@code Character} is numerically greater
	//      *          than the {@code Character} argument (unsigned comparison).
	//      *          Note that this is strictly a numerical comparison; it is not
	//      *          locale-dependent.
	//      * @since   1.2
	open func compareTo(_ anotherCharacter: Character!) -> Int32 {
		return compare(self.value, anotherCharacter.value)
	}

	// *
	//      * Compares two {@code char} values numerically.
	//      * The value returned is identical to what would be returned by:
	//      * <pre>
	//      *    Character.valueOf(x).compareTo(Character.valueOf(y))
	//      * </pre>
	//      *
	//      * @param  x the first {@code char} to compare
	//      * @param  y the second {@code char} to compare
	//      * @return the value {@code 0} if {@code x == y};
	//      *         a value less than {@code 0} if {@code x < y}; and
	//      *         a value greater than {@code 0} if {@code x > y}
	//      * @since 1.7
	public static func compare(_ x: AnsiChar, _ y: AnsiChar) -> Int32 {
		return x - y
	}

	// *
	//      * Returns the value obtained by reversing the order of the bytes in the
	//      * specified <tt>char</tt> value.
	//      *
	//      * @param ch The {@code char} of which to reverse the byte order.
	//      * @return the value obtained by reversing (or, equivalently, swapping)
	//      *     the bytes in the specified <tt>char</tt> value.
	//      * @since 1.5
	public static func reverseBytes(_ ch: AnsiChar) -> AnsiChar {
		return (((ch && 0xFF00) >> 8) || (ch << 8) as? AnsiChar)
	}

	// *
	//      * Returns the Unicode name of the specified character
	//      * {@code codePoint}, or null if the code point is
	//      * {@link #UNASSIGNED unassigned}.
	//      * <p>
	//      * Note: if the specified character is not assigned a name by
	//      * the <i>UnicodeData</i> file (part of the Unicode Character
	//      * Database maintained by the Unicode Consortium), the returned
	//      * name is the same as the result of expression.
	//      *
	//      * <blockquote>{@code
	//      *     Character.UnicodeBlock.of(codePoint).toString().replace('_', ' ')
	//      *     + " "
	//      *     + Integer.toHexString(codePoint).toUpperCase(Locale.ENGLISH);
	//      *
	//      * }</blockquote>
	//      *
	//      * @param  codePoint the character (Unicode code point)
	//      *
	//      * @return the Unicode name of the specified character, or null if
	//      *         the code point is unassigned.
	//      *
	//      * @exception IllegalArgumentException if the specified
	//      *            {@code codePoint} is not a valid Unicode
	//      *            code point.
	//      *
	//      * @since 1.7
	public static func getName(_ codePoint: Int32) -> String! {
		if !isValidCodePoint(codePoint) {
			throw IllegalArgumentException()
		}
		var name: String! = getNameImpl(codePoint)
		if name != nil {
			return name
		}
		if getType(codePoint) == UNASSIGNED {
			return nil
		}
		var block: UnicodeBlock! = UnicodeBlock.of(codePoint)
		if block != nil {
			return block.toString().replace("_", " ") + " " + Integer.toHexString(codePoint).toUpperCase(Locale.ENGLISH)
		}
		//  should never come here
		return Integer.toHexString(codePoint).toUpperCase(Locale.ENGLISH)
	}

	private static __extern func getNameImpl(_ codePoint: Int32) -> String!

	open class Subset { 
		private var name: String!

		// *
		//          * Constructs a new {@code Subset} instance.
		//          *
		//          * @param  name  The name of this subset
		//          * @exception NullPointerException if name is {@code null}
		public init(_ name: String!) {
			if name == nil {
				throw NullPointerException("name")
			}
			self.name = name
		}

		// *
		//          * Compares two {@code Subset} objects for equality.
		//          * This method returns {@code true} if and only if
		//          * {@code this} and the argument refer to the same
		//          * object; since this method is {@code final}, this
		//          * guarantee holds for all subclasses.
		public func equals(_ obj: Object!) -> Bool {
			return self == obj
		}

		// *
		//          * Returns the standard hash code as defined by the
		//          * {@link Object#hashCode} method.  This method
		//          * is {@code final} in order to ensure that the
		//          * {@code equals} and {@code hashCode} methods will
		//          * be consistent in all subclasses.
		public func hashCode() -> Int32 {
			return super.hashCode()
		}

		// *
		//          * Returns the name of this subset.
		public func toString() -> String! {
			return name
		}
	}

	public final class UnicodeBlock : Subset { 
		private static var map: Map<String!,UnicodeBlock!>! = HashMap(256)
		// *
		//          * Constant for the "Basic Latin" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let BASIC_LATIN: UnicodeBlock! = UnicodeBlock("BASIC_LATIN", "BASIC LATIN", "BASICLATIN")
		// *
		//          * Constant for the "Latin-1 Supplement" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let LATIN_1_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("LATIN_1_SUPPLEMENT", "LATIN-1 SUPPLEMENT", "LATIN-1SUPPLEMENT")
		// *
		//          * Constant for the "Latin Extended-A" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let LATIN_EXTENDED_A: UnicodeBlock! = UnicodeBlock("LATIN_EXTENDED_A", "LATIN EXTENDED-A", "LATINEXTENDED-A")
		// *
		//          * Constant for the "Latin Extended-B" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let LATIN_EXTENDED_B: UnicodeBlock! = UnicodeBlock("LATIN_EXTENDED_B", "LATIN EXTENDED-B", "LATINEXTENDED-B")
		// *
		//          * Constant for the "IPA Extensions" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let IPA_EXTENSIONS: UnicodeBlock! = UnicodeBlock("IPA_EXTENSIONS", "IPA EXTENSIONS", "IPAEXTENSIONS")
		// *
		//          * Constant for the "Spacing Modifier Letters" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let SPACING_MODIFIER_LETTERS: UnicodeBlock! = UnicodeBlock("SPACING_MODIFIER_LETTERS", "SPACING MODIFIER LETTERS", "SPACINGMODIFIERLETTERS")
		// *
		//          * Constant for the "Combining Diacritical Marks" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let COMBINING_DIACRITICAL_MARKS: UnicodeBlock! = UnicodeBlock("COMBINING_DIACRITICAL_MARKS", "COMBINING DIACRITICAL MARKS", "COMBININGDIACRITICALMARKS")
		// *
		//          * Constant for the "Greek and Coptic" Unicode character block.
		//          * <p>
		//          * This block was previously known as the "Greek" block.
		//          *
		//          * @since 1.2
		//          
		// 
		public let GREEK: UnicodeBlock! = UnicodeBlock("GREEK", "GREEK AND COPTIC", "GREEKANDCOPTIC")
		// *
		//          * Constant for the "Cyrillic" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let CYRILLIC: UnicodeBlock! = UnicodeBlock("CYRILLIC")
		// *
		//          * Constant for the "Armenian" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let ARMENIAN: UnicodeBlock! = UnicodeBlock("ARMENIAN")
		// *
		//          * Constant for the "Hebrew" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let HEBREW: UnicodeBlock! = UnicodeBlock("HEBREW")
		// *
		//          * Constant for the "Arabic" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let ARABIC: UnicodeBlock! = UnicodeBlock("ARABIC")
		// *
		//          * Constant for the "Devanagari" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let DEVANAGARI: UnicodeBlock! = UnicodeBlock("DEVANAGARI")
		// *
		//          * Constant for the "Bengali" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let BENGALI: UnicodeBlock! = UnicodeBlock("BENGALI")
		// *
		//          * Constant for the "Gurmukhi" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let GURMUKHI: UnicodeBlock! = UnicodeBlock("GURMUKHI")
		// *
		//          * Constant for the "Gujarati" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let GUJARATI: UnicodeBlock! = UnicodeBlock("GUJARATI")
		// *
		//          * Constant for the "Oriya" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let ORIYA: UnicodeBlock! = UnicodeBlock("ORIYA")
		// *
		//          * Constant for the "Tamil" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let TAMIL: UnicodeBlock! = UnicodeBlock("TAMIL")
		// *
		//          * Constant for the "Telugu" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let TELUGU: UnicodeBlock! = UnicodeBlock("TELUGU")
		// *
		//          * Constant for the "Kannada" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let KANNADA: UnicodeBlock! = UnicodeBlock("KANNADA")
		// *
		//          * Constant for the "Malayalam" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let MALAYALAM: UnicodeBlock! = UnicodeBlock("MALAYALAM")
		// *
		//          * Constant for the "Thai" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let THAI: UnicodeBlock! = UnicodeBlock("THAI")
		// *
		//          * Constant for the "Lao" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let LAO: UnicodeBlock! = UnicodeBlock("LAO")
		// *
		//          * Constant for the "Tibetan" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let TIBETAN: UnicodeBlock! = UnicodeBlock("TIBETAN")
		// *
		//          * Constant for the "Georgian" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let GEORGIAN: UnicodeBlock! = UnicodeBlock("GEORGIAN")
		// *
		//          * Constant for the "Hangul Jamo" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let HANGUL_JAMO: UnicodeBlock! = UnicodeBlock("HANGUL_JAMO", "HANGUL JAMO", "HANGULJAMO")
		// *
		//          * Constant for the "Latin Extended Additional" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let LATIN_EXTENDED_ADDITIONAL: UnicodeBlock! = UnicodeBlock("LATIN_EXTENDED_ADDITIONAL", "LATIN EXTENDED ADDITIONAL", "LATINEXTENDEDADDITIONAL")
		// *
		//          * Constant for the "Greek Extended" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let GREEK_EXTENDED: UnicodeBlock! = UnicodeBlock("GREEK_EXTENDED", "GREEK EXTENDED", "GREEKEXTENDED")
		// *
		//          * Constant for the "General Punctuation" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let GENERAL_PUNCTUATION: UnicodeBlock! = UnicodeBlock("GENERAL_PUNCTUATION", "GENERAL PUNCTUATION", "GENERALPUNCTUATION")
		// *
		//          * Constant for the "Superscripts and Subscripts" Unicode character
		//          * block.
		//          * @since 1.2
		//          
		// 
		public let SUPERSCRIPTS_AND_SUBSCRIPTS: UnicodeBlock! = UnicodeBlock("SUPERSCRIPTS_AND_SUBSCRIPTS", "SUPERSCRIPTS AND SUBSCRIPTS", "SUPERSCRIPTSANDSUBSCRIPTS")
		// *
		//          * Constant for the "Currency Symbols" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let CURRENCY_SYMBOLS: UnicodeBlock! = UnicodeBlock("CURRENCY_SYMBOLS", "CURRENCY SYMBOLS", "CURRENCYSYMBOLS")
		// *
		//          * Constant for the "Combining Diacritical Marks for Symbols" Unicode
		//          * character block.
		//          * <p>
		//          * This block was previously known as "Combining Marks for Symbols".
		//          * @since 1.2
		//          
		// 
		public let COMBINING_MARKS_FOR_SYMBOLS: UnicodeBlock! = UnicodeBlock("COMBINING_MARKS_FOR_SYMBOLS", "COMBINING DIACRITICAL MARKS FOR SYMBOLS", "COMBININGDIACRITICALMARKSFORSYMBOLS", "COMBINING MARKS FOR SYMBOLS", "COMBININGMARKSFORSYMBOLS")
		// *
		//          * Constant for the "Letterlike Symbols" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let LETTERLIKE_SYMBOLS: UnicodeBlock! = UnicodeBlock("LETTERLIKE_SYMBOLS", "LETTERLIKE SYMBOLS", "LETTERLIKESYMBOLS")
		// *
		//          * Constant for the "Number Forms" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let NUMBER_FORMS: UnicodeBlock! = UnicodeBlock("NUMBER_FORMS", "NUMBER FORMS", "NUMBERFORMS")
		// *
		//          * Constant for the "Arrows" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let ARROWS: UnicodeBlock! = UnicodeBlock("ARROWS")
		// *
		//          * Constant for the "Mathematical Operators" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let MATHEMATICAL_OPERATORS: UnicodeBlock! = UnicodeBlock("MATHEMATICAL_OPERATORS", "MATHEMATICAL OPERATORS", "MATHEMATICALOPERATORS")
		// *
		//          * Constant for the "Miscellaneous Technical" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let MISCELLANEOUS_TECHNICAL: UnicodeBlock! = UnicodeBlock("MISCELLANEOUS_TECHNICAL", "MISCELLANEOUS TECHNICAL", "MISCELLANEOUSTECHNICAL")
		// *
		//          * Constant for the "Control Pictures" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let CONTROL_PICTURES: UnicodeBlock! = UnicodeBlock("CONTROL_PICTURES", "CONTROL PICTURES", "CONTROLPICTURES")
		// *
		//          * Constant for the "Optical Character Recognition" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let OPTICAL_CHARACTER_RECOGNITION: UnicodeBlock! = UnicodeBlock("OPTICAL_CHARACTER_RECOGNITION", "OPTICAL CHARACTER RECOGNITION", "OPTICALCHARACTERRECOGNITION")
		// *
		//          * Constant for the "Enclosed Alphanumerics" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let ENCLOSED_ALPHANUMERICS: UnicodeBlock! = UnicodeBlock("ENCLOSED_ALPHANUMERICS", "ENCLOSED ALPHANUMERICS", "ENCLOSEDALPHANUMERICS")
		// *
		//          * Constant for the "Box Drawing" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let BOX_DRAWING: UnicodeBlock! = UnicodeBlock("BOX_DRAWING", "BOX DRAWING", "BOXDRAWING")
		// *
		//          * Constant for the "Block Elements" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let BLOCK_ELEMENTS: UnicodeBlock! = UnicodeBlock("BLOCK_ELEMENTS", "BLOCK ELEMENTS", "BLOCKELEMENTS")
		// *
		//          * Constant for the "Geometric Shapes" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let GEOMETRIC_SHAPES: UnicodeBlock! = UnicodeBlock("GEOMETRIC_SHAPES", "GEOMETRIC SHAPES", "GEOMETRICSHAPES")
		// *
		//          * Constant for the "Miscellaneous Symbols" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let MISCELLANEOUS_SYMBOLS: UnicodeBlock! = UnicodeBlock("MISCELLANEOUS_SYMBOLS", "MISCELLANEOUS SYMBOLS", "MISCELLANEOUSSYMBOLS")
		// *
		//          * Constant for the "Dingbats" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let DINGBATS: UnicodeBlock! = UnicodeBlock("DINGBATS")
		// *
		//          * Constant for the "CJK Symbols and Punctuation" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let CJK_SYMBOLS_AND_PUNCTUATION: UnicodeBlock! = UnicodeBlock("CJK_SYMBOLS_AND_PUNCTUATION", "CJK SYMBOLS AND PUNCTUATION", "CJKSYMBOLSANDPUNCTUATION")
		// *
		//          * Constant for the "Hiragana" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let HIRAGANA: UnicodeBlock! = UnicodeBlock("HIRAGANA")
		// *
		//          * Constant for the "Katakana" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let KATAKANA: UnicodeBlock! = UnicodeBlock("KATAKANA")
		// *
		//          * Constant for the "Bopomofo" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let BOPOMOFO: UnicodeBlock! = UnicodeBlock("BOPOMOFO")
		// *
		//          * Constant for the "Hangul Compatibility Jamo" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let HANGUL_COMPATIBILITY_JAMO: UnicodeBlock! = UnicodeBlock("HANGUL_COMPATIBILITY_JAMO", "HANGUL COMPATIBILITY JAMO", "HANGULCOMPATIBILITYJAMO")
		// *
		//          * Constant for the "Kanbun" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let KANBUN: UnicodeBlock! = UnicodeBlock("KANBUN")
		// *
		//          * Constant for the "Enclosed CJK Letters and Months" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let ENCLOSED_CJK_LETTERS_AND_MONTHS: UnicodeBlock! = UnicodeBlock("ENCLOSED_CJK_LETTERS_AND_MONTHS", "ENCLOSED CJK LETTERS AND MONTHS", "ENCLOSEDCJKLETTERSANDMONTHS")
		// *
		//          * Constant for the "CJK Compatibility" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let CJK_COMPATIBILITY: UnicodeBlock! = UnicodeBlock("CJK_COMPATIBILITY", "CJK COMPATIBILITY", "CJKCOMPATIBILITY")
		// *
		//          * Constant for the "CJK Unified Ideographs" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let CJK_UNIFIED_IDEOGRAPHS: UnicodeBlock! = UnicodeBlock("CJK_UNIFIED_IDEOGRAPHS", "CJK UNIFIED IDEOGRAPHS", "CJKUNIFIEDIDEOGRAPHS")
		// *
		//          * Constant for the "Hangul Syllables" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let HANGUL_SYLLABLES: UnicodeBlock! = UnicodeBlock("HANGUL_SYLLABLES", "HANGUL SYLLABLES", "HANGULSYLLABLES")
		// *
		//          * Constant for the "Private Use Area" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let PRIVATE_USE_AREA: UnicodeBlock! = UnicodeBlock("PRIVATE_USE_AREA", "PRIVATE USE AREA", "PRIVATEUSEAREA")
		// *
		//          * Constant for the "CJK Compatibility Ideographs" Unicode character
		//          * block.
		//          * @since 1.2
		//          
		// 
		public let CJK_COMPATIBILITY_IDEOGRAPHS: UnicodeBlock! = UnicodeBlock("CJK_COMPATIBILITY_IDEOGRAPHS", "CJK COMPATIBILITY IDEOGRAPHS", "CJKCOMPATIBILITYIDEOGRAPHS")
		// *
		//          * Constant for the "Alphabetic Presentation Forms" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let ALPHABETIC_PRESENTATION_FORMS: UnicodeBlock! = UnicodeBlock("ALPHABETIC_PRESENTATION_FORMS", "ALPHABETIC PRESENTATION FORMS", "ALPHABETICPRESENTATIONFORMS")
		// *
		//          * Constant for the "Arabic Presentation Forms-A" Unicode character
		//          * block.
		//          * @since 1.2
		//          
		// 
		public let ARABIC_PRESENTATION_FORMS_A: UnicodeBlock! = UnicodeBlock("ARABIC_PRESENTATION_FORMS_A", "ARABIC PRESENTATION FORMS-A", "ARABICPRESENTATIONFORMS-A")
		// *
		//          * Constant for the "Combining Half Marks" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let COMBINING_HALF_MARKS: UnicodeBlock! = UnicodeBlock("COMBINING_HALF_MARKS", "COMBINING HALF MARKS", "COMBININGHALFMARKS")
		// *
		//          * Constant for the "CJK Compatibility Forms" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let CJK_COMPATIBILITY_FORMS: UnicodeBlock! = UnicodeBlock("CJK_COMPATIBILITY_FORMS", "CJK COMPATIBILITY FORMS", "CJKCOMPATIBILITYFORMS")
		// *
		//          * Constant for the "Small Form Variants" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let SMALL_FORM_VARIANTS: UnicodeBlock! = UnicodeBlock("SMALL_FORM_VARIANTS", "SMALL FORM VARIANTS", "SMALLFORMVARIANTS")
		// *
		//          * Constant for the "Arabic Presentation Forms-B" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let ARABIC_PRESENTATION_FORMS_B: UnicodeBlock! = UnicodeBlock("ARABIC_PRESENTATION_FORMS_B", "ARABIC PRESENTATION FORMS-B", "ARABICPRESENTATIONFORMS-B")
		// *
		//          * Constant for the "Halfwidth and Fullwidth Forms" Unicode character
		//          * block.
		//          * @since 1.2
		//          
		// 
		public let HALFWIDTH_AND_FULLWIDTH_FORMS: UnicodeBlock! = UnicodeBlock("HALFWIDTH_AND_FULLWIDTH_FORMS", "HALFWIDTH AND FULLWIDTH FORMS", "HALFWIDTHANDFULLWIDTHFORMS")
		// *
		//          * Constant for the "Specials" Unicode character block.
		//          * @since 1.2
		//          
		// 
		public let SPECIALS: UnicodeBlock! = UnicodeBlock("SPECIALS")
		// *
		//          * @deprecated As of J2SE 5, use {@link #HIGH_SURROGATES},
		//          *             {@link #HIGH_PRIVATE_USE_SURROGATES}, and
		//          *             {@link #LOW_SURROGATES}. These new constants match
		//          *             the block definitions of the Unicode Standard.
		//          *             The {@link #of(char)} and {@link #of(int)} methods
		//          *             return the new constants, not SURROGATES_AREA.
		//          
		// 
		@Deprecated
		public let SURROGATES_AREA: UnicodeBlock! = UnicodeBlock("SURROGATES_AREA", false)
		// *
		//          * Constant for the "Syriac" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let SYRIAC: UnicodeBlock! = UnicodeBlock("SYRIAC")
		// *
		//          * Constant for the "Thaana" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let THAANA: UnicodeBlock! = UnicodeBlock("THAANA")
		// *
		//          * Constant for the "Sinhala" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let SINHALA: UnicodeBlock! = UnicodeBlock("SINHALA")
		// *
		//          * Constant for the "Myanmar" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let MYANMAR: UnicodeBlock! = UnicodeBlock("MYANMAR")
		// *
		//          * Constant for the "Ethiopic" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let ETHIOPIC: UnicodeBlock! = UnicodeBlock("ETHIOPIC")
		// *
		//          * Constant for the "Cherokee" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let CHEROKEE: UnicodeBlock! = UnicodeBlock("CHEROKEE")
		// *
		//          * Constant for the "Unified Canadian Aboriginal Syllabics" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS: UnicodeBlock! = UnicodeBlock("UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS", "UNIFIED CANADIAN ABORIGINAL SYLLABICS", "UNIFIEDCANADIANABORIGINALSYLLABICS")
		// *
		//          * Constant for the "Ogham" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let OGHAM: UnicodeBlock! = UnicodeBlock("OGHAM")
		// *
		//          * Constant for the "Runic" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let RUNIC: UnicodeBlock! = UnicodeBlock("RUNIC")
		// *
		//          * Constant for the "Khmer" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let KHMER: UnicodeBlock! = UnicodeBlock("KHMER")
		// *
		//          * Constant for the "Mongolian" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let MONGOLIAN: UnicodeBlock! = UnicodeBlock("MONGOLIAN")
		// *
		//          * Constant for the "Braille Patterns" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let BRAILLE_PATTERNS: UnicodeBlock! = UnicodeBlock("BRAILLE_PATTERNS", "BRAILLE PATTERNS", "BRAILLEPATTERNS")
		// *
		//          * Constant for the "CJK Radicals Supplement" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let CJK_RADICALS_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("CJK_RADICALS_SUPPLEMENT", "CJK RADICALS SUPPLEMENT", "CJKRADICALSSUPPLEMENT")
		// *
		//          * Constant for the "Kangxi Radicals" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let KANGXI_RADICALS: UnicodeBlock! = UnicodeBlock("KANGXI_RADICALS", "KANGXI RADICALS", "KANGXIRADICALS")
		// *
		//          * Constant for the "Ideographic Description Characters" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let IDEOGRAPHIC_DESCRIPTION_CHARACTERS: UnicodeBlock! = UnicodeBlock("IDEOGRAPHIC_DESCRIPTION_CHARACTERS", "IDEOGRAPHIC DESCRIPTION CHARACTERS", "IDEOGRAPHICDESCRIPTIONCHARACTERS")
		// *
		//          * Constant for the "Bopomofo Extended" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let BOPOMOFO_EXTENDED: UnicodeBlock! = UnicodeBlock("BOPOMOFO_EXTENDED", "BOPOMOFO EXTENDED", "BOPOMOFOEXTENDED")
		// *
		//          * Constant for the "CJK Unified Ideographs Extension A" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A: UnicodeBlock! = UnicodeBlock("CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A", "CJK UNIFIED IDEOGRAPHS EXTENSION A", "CJKUNIFIEDIDEOGRAPHSEXTENSIONA")
		// *
		//          * Constant for the "Yi Syllables" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let YI_SYLLABLES: UnicodeBlock! = UnicodeBlock("YI_SYLLABLES", "YI SYLLABLES", "YISYLLABLES")
		// *
		//          * Constant for the "Yi Radicals" Unicode character block.
		//          * @since 1.4
		//          
		// 
		public let YI_RADICALS: UnicodeBlock! = UnicodeBlock("YI_RADICALS", "YI RADICALS", "YIRADICALS")
		// *
		//          * Constant for the "Cyrillic Supplementary" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let CYRILLIC_SUPPLEMENTARY: UnicodeBlock! = UnicodeBlock("CYRILLIC_SUPPLEMENTARY", "CYRILLIC SUPPLEMENTARY", "CYRILLICSUPPLEMENTARY", "CYRILLIC SUPPLEMENT", "CYRILLICSUPPLEMENT")
		// *
		//          * Constant for the "Tagalog" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let TAGALOG: UnicodeBlock! = UnicodeBlock("TAGALOG")
		// *
		//          * Constant for the "Hanunoo" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let HANUNOO: UnicodeBlock! = UnicodeBlock("HANUNOO")
		// *
		//          * Constant for the "Buhid" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let BUHID: UnicodeBlock! = UnicodeBlock("BUHID")
		// *
		//          * Constant for the "Tagbanwa" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let TAGBANWA: UnicodeBlock! = UnicodeBlock("TAGBANWA")
		// *
		//          * Constant for the "Limbu" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let LIMBU: UnicodeBlock! = UnicodeBlock("LIMBU")
		// *
		//          * Constant for the "Tai Le" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let TAI_LE: UnicodeBlock! = UnicodeBlock("TAI_LE", "TAI LE", "TAILE")
		// *
		//          * Constant for the "Khmer Symbols" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let KHMER_SYMBOLS: UnicodeBlock! = UnicodeBlock("KHMER_SYMBOLS", "KHMER SYMBOLS", "KHMERSYMBOLS")
		// *
		//          * Constant for the "Phonetic Extensions" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let PHONETIC_EXTENSIONS: UnicodeBlock! = UnicodeBlock("PHONETIC_EXTENSIONS", "PHONETIC EXTENSIONS", "PHONETICEXTENSIONS")
		// *
		//          * Constant for the "Miscellaneous Mathematical Symbols-A" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A: UnicodeBlock! = UnicodeBlock("MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A", "MISCELLANEOUS MATHEMATICAL SYMBOLS-A", "MISCELLANEOUSMATHEMATICALSYMBOLS-A")
		// *
		//          * Constant for the "Supplemental Arrows-A" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let SUPPLEMENTAL_ARROWS_A: UnicodeBlock! = UnicodeBlock("SUPPLEMENTAL_ARROWS_A", "SUPPLEMENTAL ARROWS-A", "SUPPLEMENTALARROWS-A")
		// *
		//          * Constant for the "Supplemental Arrows-B" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let SUPPLEMENTAL_ARROWS_B: UnicodeBlock! = UnicodeBlock("SUPPLEMENTAL_ARROWS_B", "SUPPLEMENTAL ARROWS-B", "SUPPLEMENTALARROWS-B")
		// *
		//          * Constant for the "Miscellaneous Mathematical Symbols-B" Unicode
		//          * character block.
		//          * @since 1.5
		//          
		// 
		public let MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B: UnicodeBlock! = UnicodeBlock("MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B", "MISCELLANEOUS MATHEMATICAL SYMBOLS-B", "MISCELLANEOUSMATHEMATICALSYMBOLS-B")
		// *
		//          * Constant for the "Supplemental Mathematical Operators" Unicode
		//          * character block.
		//          * @since 1.5
		//          
		// 
		public let SUPPLEMENTAL_MATHEMATICAL_OPERATORS: UnicodeBlock! = UnicodeBlock("SUPPLEMENTAL_MATHEMATICAL_OPERATORS", "SUPPLEMENTAL MATHEMATICAL OPERATORS", "SUPPLEMENTALMATHEMATICALOPERATORS")
		// *
		//          * Constant for the "Miscellaneous Symbols and Arrows" Unicode character
		//          * block.
		//          * @since 1.5
		//          
		// 
		public let MISCELLANEOUS_SYMBOLS_AND_ARROWS: UnicodeBlock! = UnicodeBlock("MISCELLANEOUS_SYMBOLS_AND_ARROWS", "MISCELLANEOUS SYMBOLS AND ARROWS", "MISCELLANEOUSSYMBOLSANDARROWS")
		// *
		//          * Constant for the "Katakana Phonetic Extensions" Unicode character
		//          * block.
		//          * @since 1.5
		//          
		// 
		public let KATAKANA_PHONETIC_EXTENSIONS: UnicodeBlock! = UnicodeBlock("KATAKANA_PHONETIC_EXTENSIONS", "KATAKANA PHONETIC EXTENSIONS", "KATAKANAPHONETICEXTENSIONS")
		// *
		//          * Constant for the "Yijing Hexagram Symbols" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let YIJING_HEXAGRAM_SYMBOLS: UnicodeBlock! = UnicodeBlock("YIJING_HEXAGRAM_SYMBOLS", "YIJING HEXAGRAM SYMBOLS", "YIJINGHEXAGRAMSYMBOLS")
		// *
		//          * Constant for the "Variation Selectors" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let VARIATION_SELECTORS: UnicodeBlock! = UnicodeBlock("VARIATION_SELECTORS", "VARIATION SELECTORS", "VARIATIONSELECTORS")
		// *
		//          * Constant for the "Linear B Syllabary" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let LINEAR_B_SYLLABARY: UnicodeBlock! = UnicodeBlock("LINEAR_B_SYLLABARY", "LINEAR B SYLLABARY", "LINEARBSYLLABARY")
		// *
		//          * Constant for the "Linear B Ideograms" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let LINEAR_B_IDEOGRAMS: UnicodeBlock! = UnicodeBlock("LINEAR_B_IDEOGRAMS", "LINEAR B IDEOGRAMS", "LINEARBIDEOGRAMS")
		// *
		//          * Constant for the "Aegean Numbers" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let AEGEAN_NUMBERS: UnicodeBlock! = UnicodeBlock("AEGEAN_NUMBERS", "AEGEAN NUMBERS", "AEGEANNUMBERS")
		// *
		//          * Constant for the "Old Italic" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let OLD_ITALIC: UnicodeBlock! = UnicodeBlock("OLD_ITALIC", "OLD ITALIC", "OLDITALIC")
		// *
		//          * Constant for the "Gothic" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let GOTHIC: UnicodeBlock! = UnicodeBlock("GOTHIC")
		// *
		//          * Constant for the "Ugaritic" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let UGARITIC: UnicodeBlock! = UnicodeBlock("UGARITIC")
		// *
		//          * Constant for the "Deseret" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let DESERET: UnicodeBlock! = UnicodeBlock("DESERET")
		// *
		//          * Constant for the "Shavian" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let SHAVIAN: UnicodeBlock! = UnicodeBlock("SHAVIAN")
		// *
		//          * Constant for the "Osmanya" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let OSMANYA: UnicodeBlock! = UnicodeBlock("OSMANYA")
		// *
		//          * Constant for the "Cypriot Syllabary" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let CYPRIOT_SYLLABARY: UnicodeBlock! = UnicodeBlock("CYPRIOT_SYLLABARY", "CYPRIOT SYLLABARY", "CYPRIOTSYLLABARY")
		// *
		//          * Constant for the "Byzantine Musical Symbols" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let BYZANTINE_MUSICAL_SYMBOLS: UnicodeBlock! = UnicodeBlock("BYZANTINE_MUSICAL_SYMBOLS", "BYZANTINE MUSICAL SYMBOLS", "BYZANTINEMUSICALSYMBOLS")
		// *
		//          * Constant for the "Musical Symbols" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let MUSICAL_SYMBOLS: UnicodeBlock! = UnicodeBlock("MUSICAL_SYMBOLS", "MUSICAL SYMBOLS", "MUSICALSYMBOLS")
		// *
		//          * Constant for the "Tai Xuan Jing Symbols" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let TAI_XUAN_JING_SYMBOLS: UnicodeBlock! = UnicodeBlock("TAI_XUAN_JING_SYMBOLS", "TAI XUAN JING SYMBOLS", "TAIXUANJINGSYMBOLS")
		// *
		//          * Constant for the "Mathematical Alphanumeric Symbols" Unicode
		//          * character block.
		//          * @since 1.5
		//          
		// 
		public let MATHEMATICAL_ALPHANUMERIC_SYMBOLS: UnicodeBlock! = UnicodeBlock("MATHEMATICAL_ALPHANUMERIC_SYMBOLS", "MATHEMATICAL ALPHANUMERIC SYMBOLS", "MATHEMATICALALPHANUMERICSYMBOLS")
		// *
		//          * Constant for the "CJK Unified Ideographs Extension B" Unicode
		//          * character block.
		//          * @since 1.5
		//          
		// 
		public let CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B: UnicodeBlock! = UnicodeBlock("CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B", "CJK UNIFIED IDEOGRAPHS EXTENSION B", "CJKUNIFIEDIDEOGRAPHSEXTENSIONB")
		// *
		//          * Constant for the "CJK Compatibility Ideographs Supplement" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT", "CJK COMPATIBILITY IDEOGRAPHS SUPPLEMENT", "CJKCOMPATIBILITYIDEOGRAPHSSUPPLEMENT")
		// *
		//          * Constant for the "Tags" Unicode character block.
		//          * @since 1.5
		//          
		// 
		public let TAGS: UnicodeBlock! = UnicodeBlock("TAGS")
		// *
		//          * Constant for the "Variation Selectors Supplement" Unicode character
		//          * block.
		//          * @since 1.5
		//          
		// 
		public let VARIATION_SELECTORS_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("VARIATION_SELECTORS_SUPPLEMENT", "VARIATION SELECTORS SUPPLEMENT", "VARIATIONSELECTORSSUPPLEMENT")
		// *
		//          * Constant for the "Supplementary Private Use Area-A" Unicode character
		//          * block.
		//          * @since 1.5
		//          
		// 
		public let SUPPLEMENTARY_PRIVATE_USE_AREA_A: UnicodeBlock! = UnicodeBlock("SUPPLEMENTARY_PRIVATE_USE_AREA_A", "SUPPLEMENTARY PRIVATE USE AREA-A", "SUPPLEMENTARYPRIVATEUSEAREA-A")
		// *
		//          * Constant for the "Supplementary Private Use Area-B" Unicode character
		//          * block.
		//          * @since 1.5
		//          
		// 
		public let SUPPLEMENTARY_PRIVATE_USE_AREA_B: UnicodeBlock! = UnicodeBlock("SUPPLEMENTARY_PRIVATE_USE_AREA_B", "SUPPLEMENTARY PRIVATE USE AREA-B", "SUPPLEMENTARYPRIVATEUSEAREA-B")
		// *
		//          * Constant for the "High Surrogates" Unicode character block.
		//          * This block represents codepoint values in the high surrogate
		//          * range: U+D800 through U+DB7F
		//          *
		//          * @since 1.5
		//          
		// 
		public let HIGH_SURROGATES: UnicodeBlock! = UnicodeBlock("HIGH_SURROGATES", "HIGH SURROGATES", "HIGHSURROGATES")
		// *
		//          * Constant for the "High Private Use Surrogates" Unicode character
		//          * block.
		//          * This block represents codepoint values in the private use high
		//          * surrogate range: U+DB80 through U+DBFF
		//          *
		//          * @since 1.5
		//          
		// 
		public let HIGH_PRIVATE_USE_SURROGATES: UnicodeBlock! = UnicodeBlock("HIGH_PRIVATE_USE_SURROGATES", "HIGH PRIVATE USE SURROGATES", "HIGHPRIVATEUSESURROGATES")
		// *
		//          * Constant for the "Low Surrogates" Unicode character block.
		//          * This block represents codepoint values in the low surrogate
		//          * range: U+DC00 through U+DFFF
		//          *
		//          * @since 1.5
		//          
		// 
		public let LOW_SURROGATES: UnicodeBlock! = UnicodeBlock("LOW_SURROGATES", "LOW SURROGATES", "LOWSURROGATES")
		// *
		//          * Constant for the "Arabic Supplement" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let ARABIC_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("ARABIC_SUPPLEMENT", "ARABIC SUPPLEMENT", "ARABICSUPPLEMENT")
		// *
		//          * Constant for the "NKo" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let NKO: UnicodeBlock! = UnicodeBlock("NKO")
		// *
		//          * Constant for the "Samaritan" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let SAMARITAN: UnicodeBlock! = UnicodeBlock("SAMARITAN")
		// *
		//          * Constant for the "Mandaic" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let MANDAIC: UnicodeBlock! = UnicodeBlock("MANDAIC")
		// *
		//          * Constant for the "Ethiopic Supplement" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let ETHIOPIC_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("ETHIOPIC_SUPPLEMENT", "ETHIOPIC SUPPLEMENT", "ETHIOPICSUPPLEMENT")
		// *
		//          * Constant for the "Unified Canadian Aboriginal Syllabics Extended"
		//          * Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED: UnicodeBlock! = UnicodeBlock("UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED", "UNIFIED CANADIAN ABORIGINAL SYLLABICS EXTENDED", "UNIFIEDCANADIANABORIGINALSYLLABICSEXTENDED")
		// *
		//          * Constant for the "New Tai Lue" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let NEW_TAI_LUE: UnicodeBlock! = UnicodeBlock("NEW_TAI_LUE", "NEW TAI LUE", "NEWTAILUE")
		// *
		//          * Constant for the "Buginese" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let BUGINESE: UnicodeBlock! = UnicodeBlock("BUGINESE")
		// *
		//          * Constant for the "Tai Tham" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let TAI_THAM: UnicodeBlock! = UnicodeBlock("TAI_THAM", "TAI THAM", "TAITHAM")
		// *
		//          * Constant for the "Balinese" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let BALINESE: UnicodeBlock! = UnicodeBlock("BALINESE")
		// *
		//          * Constant for the "Sundanese" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let SUNDANESE: UnicodeBlock! = UnicodeBlock("SUNDANESE")
		// *
		//          * Constant for the "Batak" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let BATAK: UnicodeBlock! = UnicodeBlock("BATAK")
		// *
		//          * Constant for the "Lepcha" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let LEPCHA: UnicodeBlock! = UnicodeBlock("LEPCHA")
		// *
		//          * Constant for the "Ol Chiki" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let OL_CHIKI: UnicodeBlock! = UnicodeBlock("OL_CHIKI", "OL CHIKI", "OLCHIKI")
		// *
		//          * Constant for the "Vedic Extensions" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let VEDIC_EXTENSIONS: UnicodeBlock! = UnicodeBlock("VEDIC_EXTENSIONS", "VEDIC EXTENSIONS", "VEDICEXTENSIONS")
		// *
		//          * Constant for the "Phonetic Extensions Supplement" Unicode character
		//          * block.
		//          * @since 1.7
		//          
		// 
		public let PHONETIC_EXTENSIONS_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("PHONETIC_EXTENSIONS_SUPPLEMENT", "PHONETIC EXTENSIONS SUPPLEMENT", "PHONETICEXTENSIONSSUPPLEMENT")
		// *
		//          * Constant for the "Combining Diacritical Marks Supplement" Unicode
		//          * character block.
		//          * @since 1.7
		//          
		// 
		public let COMBINING_DIACRITICAL_MARKS_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("COMBINING_DIACRITICAL_MARKS_SUPPLEMENT", "COMBINING DIACRITICAL MARKS SUPPLEMENT", "COMBININGDIACRITICALMARKSSUPPLEMENT")
		// *
		//          * Constant for the "Glagolitic" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let GLAGOLITIC: UnicodeBlock! = UnicodeBlock("GLAGOLITIC")
		// *
		//          * Constant for the "Latin Extended-C" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let LATIN_EXTENDED_C: UnicodeBlock! = UnicodeBlock("LATIN_EXTENDED_C", "LATIN EXTENDED-C", "LATINEXTENDED-C")
		// *
		//          * Constant for the "Coptic" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let COPTIC: UnicodeBlock! = UnicodeBlock("COPTIC")
		// *
		//          * Constant for the "Georgian Supplement" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let GEORGIAN_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("GEORGIAN_SUPPLEMENT", "GEORGIAN SUPPLEMENT", "GEORGIANSUPPLEMENT")
		// *
		//          * Constant for the "Tifinagh" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let TIFINAGH: UnicodeBlock! = UnicodeBlock("TIFINAGH")
		// *
		//          * Constant for the "Ethiopic Extended" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let ETHIOPIC_EXTENDED: UnicodeBlock! = UnicodeBlock("ETHIOPIC_EXTENDED", "ETHIOPIC EXTENDED", "ETHIOPICEXTENDED")
		// *
		//          * Constant for the "Cyrillic Extended-A" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let CYRILLIC_EXTENDED_A: UnicodeBlock! = UnicodeBlock("CYRILLIC_EXTENDED_A", "CYRILLIC EXTENDED-A", "CYRILLICEXTENDED-A")
		// *
		//          * Constant for the "Supplemental Punctuation" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let SUPPLEMENTAL_PUNCTUATION: UnicodeBlock! = UnicodeBlock("SUPPLEMENTAL_PUNCTUATION", "SUPPLEMENTAL PUNCTUATION", "SUPPLEMENTALPUNCTUATION")
		// *
		//          * Constant for the "CJK Strokes" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let CJK_STROKES: UnicodeBlock! = UnicodeBlock("CJK_STROKES", "CJK STROKES", "CJKSTROKES")
		// *
		//          * Constant for the "Lisu" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let LISU: UnicodeBlock! = UnicodeBlock("LISU")
		// *
		//          * Constant for the "Vai" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let VAI: UnicodeBlock! = UnicodeBlock("VAI")
		// *
		//          * Constant for the "Cyrillic Extended-B" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let CYRILLIC_EXTENDED_B: UnicodeBlock! = UnicodeBlock("CYRILLIC_EXTENDED_B", "CYRILLIC EXTENDED-B", "CYRILLICEXTENDED-B")
		// *
		//          * Constant for the "Bamum" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let BAMUM: UnicodeBlock! = UnicodeBlock("BAMUM")
		// *
		//          * Constant for the "Modifier Tone Letters" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let MODIFIER_TONE_LETTERS: UnicodeBlock! = UnicodeBlock("MODIFIER_TONE_LETTERS", "MODIFIER TONE LETTERS", "MODIFIERTONELETTERS")
		// *
		//          * Constant for the "Latin Extended-D" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let LATIN_EXTENDED_D: UnicodeBlock! = UnicodeBlock("LATIN_EXTENDED_D", "LATIN EXTENDED-D", "LATINEXTENDED-D")
		// *
		//          * Constant for the "Syloti Nagri" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let SYLOTI_NAGRI: UnicodeBlock! = UnicodeBlock("SYLOTI_NAGRI", "SYLOTI NAGRI", "SYLOTINAGRI")
		// *
		//          * Constant for the "Common Indic Number Forms" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let COMMON_INDIC_NUMBER_FORMS: UnicodeBlock! = UnicodeBlock("COMMON_INDIC_NUMBER_FORMS", "COMMON INDIC NUMBER FORMS", "COMMONINDICNUMBERFORMS")
		// *
		//          * Constant for the "Phags-pa" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let PHAGS_PA: UnicodeBlock! = UnicodeBlock("PHAGS_PA", "PHAGS-PA")
		// *
		//          * Constant for the "Saurashtra" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let SAURASHTRA: UnicodeBlock! = UnicodeBlock("SAURASHTRA")
		// *
		//          * Constant for the "Devanagari Extended" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let DEVANAGARI_EXTENDED: UnicodeBlock! = UnicodeBlock("DEVANAGARI_EXTENDED", "DEVANAGARI EXTENDED", "DEVANAGARIEXTENDED")
		// *
		//          * Constant for the "Kayah Li" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let KAYAH_LI: UnicodeBlock! = UnicodeBlock("KAYAH_LI", "KAYAH LI", "KAYAHLI")
		// *
		//          * Constant for the "Rejang" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let REJANG: UnicodeBlock! = UnicodeBlock("REJANG")
		// *
		//          * Constant for the "Hangul Jamo Extended-A" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let HANGUL_JAMO_EXTENDED_A: UnicodeBlock! = UnicodeBlock("HANGUL_JAMO_EXTENDED_A", "HANGUL JAMO EXTENDED-A", "HANGULJAMOEXTENDED-A")
		// *
		//          * Constant for the "Javanese" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let JAVANESE: UnicodeBlock! = UnicodeBlock("JAVANESE")
		// *
		//          * Constant for the "Cham" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let CHAM: UnicodeBlock! = UnicodeBlock("CHAM")
		// *
		//          * Constant for the "Myanmar Extended-A" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let MYANMAR_EXTENDED_A: UnicodeBlock! = UnicodeBlock("MYANMAR_EXTENDED_A", "MYANMAR EXTENDED-A", "MYANMAREXTENDED-A")
		// *
		//          * Constant for the "Tai Viet" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let TAI_VIET: UnicodeBlock! = UnicodeBlock("TAI_VIET", "TAI VIET", "TAIVIET")
		// *
		//          * Constant for the "Ethiopic Extended-A" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let ETHIOPIC_EXTENDED_A: UnicodeBlock! = UnicodeBlock("ETHIOPIC_EXTENDED_A", "ETHIOPIC EXTENDED-A", "ETHIOPICEXTENDED-A")
		// *
		//          * Constant for the "Meetei Mayek" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let MEETEI_MAYEK: UnicodeBlock! = UnicodeBlock("MEETEI_MAYEK", "MEETEI MAYEK", "MEETEIMAYEK")
		// *
		//          * Constant for the "Hangul Jamo Extended-B" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let HANGUL_JAMO_EXTENDED_B: UnicodeBlock! = UnicodeBlock("HANGUL_JAMO_EXTENDED_B", "HANGUL JAMO EXTENDED-B", "HANGULJAMOEXTENDED-B")
		// *
		//          * Constant for the "Vertical Forms" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let VERTICAL_FORMS: UnicodeBlock! = UnicodeBlock("VERTICAL_FORMS", "VERTICAL FORMS", "VERTICALFORMS")
		// *
		//          * Constant for the "Ancient Greek Numbers" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let ANCIENT_GREEK_NUMBERS: UnicodeBlock! = UnicodeBlock("ANCIENT_GREEK_NUMBERS", "ANCIENT GREEK NUMBERS", "ANCIENTGREEKNUMBERS")
		// *
		//          * Constant for the "Ancient Symbols" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let ANCIENT_SYMBOLS: UnicodeBlock! = UnicodeBlock("ANCIENT_SYMBOLS", "ANCIENT SYMBOLS", "ANCIENTSYMBOLS")
		// *
		//          * Constant for the "Phaistos Disc" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let PHAISTOS_DISC: UnicodeBlock! = UnicodeBlock("PHAISTOS_DISC", "PHAISTOS DISC", "PHAISTOSDISC")
		// *
		//          * Constant for the "Lycian" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let LYCIAN: UnicodeBlock! = UnicodeBlock("LYCIAN")
		// *
		//          * Constant for the "Carian" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let CARIAN: UnicodeBlock! = UnicodeBlock("CARIAN")
		// *
		//          * Constant for the "Old Persian" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let OLD_PERSIAN: UnicodeBlock! = UnicodeBlock("OLD_PERSIAN", "OLD PERSIAN", "OLDPERSIAN")
		// *
		//          * Constant for the "Imperial Aramaic" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let IMPERIAL_ARAMAIC: UnicodeBlock! = UnicodeBlock("IMPERIAL_ARAMAIC", "IMPERIAL ARAMAIC", "IMPERIALARAMAIC")
		// *
		//          * Constant for the "Phoenician" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let PHOENICIAN: UnicodeBlock! = UnicodeBlock("PHOENICIAN")
		// *
		//          * Constant for the "Lydian" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let LYDIAN: UnicodeBlock! = UnicodeBlock("LYDIAN")
		// *
		//          * Constant for the "Kharoshthi" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let KHAROSHTHI: UnicodeBlock! = UnicodeBlock("KHAROSHTHI")
		// *
		//          * Constant for the "Old South Arabian" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let OLD_SOUTH_ARABIAN: UnicodeBlock! = UnicodeBlock("OLD_SOUTH_ARABIAN", "OLD SOUTH ARABIAN", "OLDSOUTHARABIAN")
		// *
		//          * Constant for the "Avestan" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let AVESTAN: UnicodeBlock! = UnicodeBlock("AVESTAN")
		// *
		//          * Constant for the "Inscriptional Parthian" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let INSCRIPTIONAL_PARTHIAN: UnicodeBlock! = UnicodeBlock("INSCRIPTIONAL_PARTHIAN", "INSCRIPTIONAL PARTHIAN", "INSCRIPTIONALPARTHIAN")
		// *
		//          * Constant for the "Inscriptional Pahlavi" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let INSCRIPTIONAL_PAHLAVI: UnicodeBlock! = UnicodeBlock("INSCRIPTIONAL_PAHLAVI", "INSCRIPTIONAL PAHLAVI", "INSCRIPTIONALPAHLAVI")
		// *
		//          * Constant for the "Old Turkic" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let OLD_TURKIC: UnicodeBlock! = UnicodeBlock("OLD_TURKIC", "OLD TURKIC", "OLDTURKIC")
		// *
		//          * Constant for the "Rumi Numeral Symbols" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let RUMI_NUMERAL_SYMBOLS: UnicodeBlock! = UnicodeBlock("RUMI_NUMERAL_SYMBOLS", "RUMI NUMERAL SYMBOLS", "RUMINUMERALSYMBOLS")
		// *
		//          * Constant for the "Brahmi" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let BRAHMI: UnicodeBlock! = UnicodeBlock("BRAHMI")
		// *
		//          * Constant for the "Kaithi" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let KAITHI: UnicodeBlock! = UnicodeBlock("KAITHI")
		// *
		//          * Constant for the "Cuneiform" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let CUNEIFORM: UnicodeBlock! = UnicodeBlock("CUNEIFORM")
		// *
		//          * Constant for the "Cuneiform Numbers and Punctuation" Unicode
		//          * character block.
		//          * @since 1.7
		//          
		// 
		public let CUNEIFORM_NUMBERS_AND_PUNCTUATION: UnicodeBlock! = UnicodeBlock("CUNEIFORM_NUMBERS_AND_PUNCTUATION", "CUNEIFORM NUMBERS AND PUNCTUATION", "CUNEIFORMNUMBERSANDPUNCTUATION")
		// *
		//          * Constant for the "Egyptian Hieroglyphs" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let EGYPTIAN_HIEROGLYPHS: UnicodeBlock! = UnicodeBlock("EGYPTIAN_HIEROGLYPHS", "EGYPTIAN HIEROGLYPHS", "EGYPTIANHIEROGLYPHS")
		// *
		//          * Constant for the "Bamum Supplement" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let BAMUM_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("BAMUM_SUPPLEMENT", "BAMUM SUPPLEMENT", "BAMUMSUPPLEMENT")
		// *
		//          * Constant for the "Kana Supplement" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let KANA_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("KANA_SUPPLEMENT", "KANA SUPPLEMENT", "KANASUPPLEMENT")
		// *
		//          * Constant for the "Ancient Greek Musical Notation" Unicode character
		//          * block.
		//          * @since 1.7
		//          
		// 
		public let ANCIENT_GREEK_MUSICAL_NOTATION: UnicodeBlock! = UnicodeBlock("ANCIENT_GREEK_MUSICAL_NOTATION", "ANCIENT GREEK MUSICAL NOTATION", "ANCIENTGREEKMUSICALNOTATION")
		// *
		//          * Constant for the "Counting Rod Numerals" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let COUNTING_ROD_NUMERALS: UnicodeBlock! = UnicodeBlock("COUNTING_ROD_NUMERALS", "COUNTING ROD NUMERALS", "COUNTINGRODNUMERALS")
		// *
		//          * Constant for the "Mahjong Tiles" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let MAHJONG_TILES: UnicodeBlock! = UnicodeBlock("MAHJONG_TILES", "MAHJONG TILES", "MAHJONGTILES")
		// *
		//          * Constant for the "Domino Tiles" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let DOMINO_TILES: UnicodeBlock! = UnicodeBlock("DOMINO_TILES", "DOMINO TILES", "DOMINOTILES")
		// *
		//          * Constant for the "Playing Cards" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let PLAYING_CARDS: UnicodeBlock! = UnicodeBlock("PLAYING_CARDS", "PLAYING CARDS", "PLAYINGCARDS")
		// *
		//          * Constant for the "Enclosed Alphanumeric Supplement" Unicode character
		//          * block.
		//          * @since 1.7
		//          
		// 
		public let ENCLOSED_ALPHANUMERIC_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("ENCLOSED_ALPHANUMERIC_SUPPLEMENT", "ENCLOSED ALPHANUMERIC SUPPLEMENT", "ENCLOSEDALPHANUMERICSUPPLEMENT")
		// *
		//          * Constant for the "Enclosed Ideographic Supplement" Unicode character
		//          * block.
		//          * @since 1.7
		//          
		// 
		public let ENCLOSED_IDEOGRAPHIC_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("ENCLOSED_IDEOGRAPHIC_SUPPLEMENT", "ENCLOSED IDEOGRAPHIC SUPPLEMENT", "ENCLOSEDIDEOGRAPHICSUPPLEMENT")
		// *
		//          * Constant for the "Miscellaneous Symbols And Pictographs" Unicode
		//          * character block.
		//          * @since 1.7
		//          
		// 
		public let MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS: UnicodeBlock! = UnicodeBlock("MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS", "MISCELLANEOUS SYMBOLS AND PICTOGRAPHS", "MISCELLANEOUSSYMBOLSANDPICTOGRAPHS")
		// *
		//          * Constant for the "Emoticons" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let EMOTICONS: UnicodeBlock! = UnicodeBlock("EMOTICONS")
		// *
		//          * Constant for the "Transport And Map Symbols" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let TRANSPORT_AND_MAP_SYMBOLS: UnicodeBlock! = UnicodeBlock("TRANSPORT_AND_MAP_SYMBOLS", "TRANSPORT AND MAP SYMBOLS", "TRANSPORTANDMAPSYMBOLS")
		// *
		//          * Constant for the "Alchemical Symbols" Unicode character block.
		//          * @since 1.7
		//          
		// 
		public let ALCHEMICAL_SYMBOLS: UnicodeBlock! = UnicodeBlock("ALCHEMICAL_SYMBOLS", "ALCHEMICAL SYMBOLS", "ALCHEMICALSYMBOLS")
		// *
		//          * Constant for the "CJK Unified Ideographs Extension C" Unicode
		//          * character block.
		//          * @since 1.7
		//          
		// 
		public let CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C: UnicodeBlock! = UnicodeBlock("CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C", "CJK UNIFIED IDEOGRAPHS EXTENSION C", "CJKUNIFIEDIDEOGRAPHSEXTENSIONC")
		// *
		//          * Constant for the "CJK Unified Ideographs Extension D" Unicode
		//          * character block.
		//          * @since 1.7
		//          
		// 
		public let CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D: UnicodeBlock! = UnicodeBlock("CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D", "CJK UNIFIED IDEOGRAPHS EXTENSION D", "CJKUNIFIEDIDEOGRAPHSEXTENSIOND")
		// *
		//          * Constant for the "Arabic Extended-A" Unicode character block.
		//          * @since 1.8
		//          
		// 
		public let ARABIC_EXTENDED_A: UnicodeBlock! = UnicodeBlock("ARABIC_EXTENDED_A", "ARABIC EXTENDED-A", "ARABICEXTENDED-A")
		// *
		//          * Constant for the "Sundanese Supplement" Unicode character block.
		//          * @since 1.8
		//          
		// 
		public let SUNDANESE_SUPPLEMENT: UnicodeBlock! = UnicodeBlock("SUNDANESE_SUPPLEMENT", "SUNDANESE SUPPLEMENT", "SUNDANESESUPPLEMENT")
		// *
		//          * Constant for the "Meetei Mayek Extensions" Unicode character block.
		//          * @since 1.8
		//          
		// 
		public let MEETEI_MAYEK_EXTENSIONS: UnicodeBlock! = UnicodeBlock("MEETEI_MAYEK_EXTENSIONS", "MEETEI MAYEK EXTENSIONS", "MEETEIMAYEKEXTENSIONS")
		// *
		//          * Constant for the "Meroitic Hieroglyphs" Unicode character block.
		//          * @since 1.8
		//          
		// 
		public let MEROITIC_HIEROGLYPHS: UnicodeBlock! = UnicodeBlock("MEROITIC_HIEROGLYPHS", "MEROITIC HIEROGLYPHS", "MEROITICHIEROGLYPHS")
		// *
		//          * Constant for the "Meroitic Cursive" Unicode character block.
		//          * @since 1.8
		//          
		// 
		public let MEROITIC_CURSIVE: UnicodeBlock! = UnicodeBlock("MEROITIC_CURSIVE", "MEROITIC CURSIVE", "MEROITICCURSIVE")
		// *
		//          * Constant for the "Sora Sompeng" Unicode character block.
		//          * @since 1.8
		//          
		// 
		public let SORA_SOMPENG: UnicodeBlock! = UnicodeBlock("SORA_SOMPENG", "SORA SOMPENG", "SORASOMPENG")
		// *
		//          * Constant for the "Chakma" Unicode character block.
		//          * @since 1.8
		//          
		// 
		public let CHAKMA: UnicodeBlock! = UnicodeBlock("CHAKMA")
		// *
		//          * Constant for the "Sharada" Unicode character block.
		//          * @since 1.8
		//          
		// 
		public let SHARADA: UnicodeBlock! = UnicodeBlock("SHARADA")
		// *
		//          * Constant for the "Takri" Unicode character block.
		//          * @since 1.8
		//          
		// 
		public let TAKRI: UnicodeBlock! = UnicodeBlock("TAKRI")
		// *
		//          * Constant for the "Miao" Unicode character block.
		//          * @since 1.8
		//          
		// 
		public let MIAO: UnicodeBlock! = UnicodeBlock("MIAO")
		// *
		//          * Constant for the "Arabic Mathematical Alphabetic Symbols" Unicode
		//          * character block.
		//          * @since 1.8
		//          
		// 
		public let ARABIC_MATHEMATICAL_ALPHABETIC_SYMBOLS: UnicodeBlock! = UnicodeBlock("ARABIC_MATHEMATICAL_ALPHABETIC_SYMBOLS", "ARABIC MATHEMATICAL ALPHABETIC SYMBOLS", "ARABICMATHEMATICALALPHABETICSYMBOLS")
		private let blockStarts: Int32[] = [0, 0x80, 0x100, 0x180, 0x250, 0x2B0, 0x300, 0x370, 0x400, 0x500, 0x530, 0x590, 0x600, 0x700, 0x750, 0x780, 0x7C0, 0x800, 0x840, 0x860, 0x8A0, 0x900, 0x980, 0xA00, 0xA80, 0xB00, 0xB80, 0xC00, 0xC80, 0xD00, 0xD80, 0xE00, 0xE80, 0xF00, 0x1000, 0x10A0, 0x1100, 0x1200, 0x1380, 0x13A0, 0x1400, 0x1680, 0x16A0, 0x1700, 0x1720, 0x1740, 0x1760, 0x1780, 0x1800, 0x18B0, 0x1900, 0x1950, 0x1980, 0x19E0, 0x1A00, 0x1A20, 0x1AB0, 0x1B00, 0x1B80, 0x1BC0, 0x1C00, 0x1C50, 0x1C80, 0x1CC0, 0x1CD0, 0x1D00, 0x1D80, 0x1DC0, 0x1E00, 0x1F00, 0x2000, 0x2070, 0x20A0, 0x20D0, 0x2100, 0x2150, 0x2190, 0x2200, 0x2300, 0x2400, 0x2440, 0x2460, 0x2500, 0x2580, 0x25A0, 0x2600, 0x2700, 0x27C0, 0x27F0, 0x2800, 0x2900, 0x2980, 0x2A00, 0x2B00, 0x2C00, 0x2C60, 0x2C80, 0x2D00, 0x2D30, 0x2D80, 0x2DE0, 0x2E00, 0x2E80, 0x2F00, 0x2FE0, 0x2FF0, 0x3000, 0x3040, 0x30A0, 0x3100, 0x3130, 0x3190, 0x31A0, 0x31C0, 0x31F0, 0x3200, 0x3300, 0x3400, 0x4DC0, 0x4E00, 0xA000, 0xA490, 0xA4D0, 0xA500, 0xA640, 0xA6A0, 0xA700, 0xA720, 0xA800, 0xA830, 0xA840, 0xA880, 0xA8E0, 0xA900, 0xA930, 0xA960, 0xA980, 0xA9E0, 0xAA00, 0xAA60, 0xAA80, 0xAAE0, 0xAB00, 0xAB30, 0xABC0, 0xAC00, 0xD7B0, 0xD800, 0xDB80, 0xDC00, 0xE000, 0xF900, 0xFB00, 0xFB50, 0xFE00, 0xFE10, 0xFE20, 0xFE30, 0xFE50, 0xFE70, 0xFF00, 0xFFF0, 0x10000, 0x10080, 0x10100, 0x10140, 0x10190, 0x101D0, 0x10200, 0x10280, 0x102A0, 0x102E0, 0x10300, 0x10330, 0x10350, 0x10380, 0x103A0, 0x103E0, 0x10400, 0x10450, 0x10480, 0x104B0, 0x10800, 0x10840, 0x10860, 0x10900, 0x10920, 0x10940, 0x10980, 0x109A0, 0x10A00, 0x10A60, 0x10A80, 0x10B00, 0x10B40, 0x10B60, 0x10B80, 0x10C00, 0x10C50, 0x10E60, 0x10E80, 0x11000, 0x11080, 0x110D0, 0x11100, 0x11150, 0x11180, 0x111E0, 0x11680, 0x116D0, 0x12000, 0x12400, 0x12480, 0x13000, 0x13430, 0x16800, 0x16A40, 0x16F00, 0x16FA0, 0x1B000, 0x1B100, 0x1D000, 0x1D100, 0x1D200, 0x1D250, 0x1D300, 0x1D360, 0x1D380, 0x1D400, 0x1D800, 0x1EE00, 0x1EF00, 0x1F000, 0x1F030, 0x1F0A0, 0x1F100, 0x1F200, 0x1F300, 0x1F600, 0x1F650, 0x1F680, 0x1F700, 0x1F780, 0x20000, 0x2A6E0, 0x2A700, 0x2B740, 0x2B820, 0x2F800, 0x2FA20, 0xE0000, 0xE0080, 0xE0100, 0xE01F0, 0xF0000, 0x100000]
		private let blocks: UnicodeBlock![] = [BASIC_LATIN, LATIN_1_SUPPLEMENT, LATIN_EXTENDED_A, LATIN_EXTENDED_B, IPA_EXTENSIONS, SPACING_MODIFIER_LETTERS, COMBINING_DIACRITICAL_MARKS, GREEK, CYRILLIC, CYRILLIC_SUPPLEMENTARY, ARMENIAN, HEBREW, ARABIC, SYRIAC, ARABIC_SUPPLEMENT, THAANA, NKO, SAMARITAN, MANDAIC, nil, ARABIC_EXTENDED_A, DEVANAGARI, BENGALI, GURMUKHI, GUJARATI, ORIYA, TAMIL, TELUGU, KANNADA, MALAYALAM, SINHALA, THAI, LAO, TIBETAN, MYANMAR, GEORGIAN, HANGUL_JAMO, ETHIOPIC, ETHIOPIC_SUPPLEMENT, CHEROKEE, UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS, OGHAM, RUNIC, TAGALOG, HANUNOO, BUHID, TAGBANWA, KHMER, MONGOLIAN, UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED, LIMBU, TAI_LE, NEW_TAI_LUE, KHMER_SYMBOLS, BUGINESE, TAI_THAM, nil, BALINESE, SUNDANESE, BATAK, LEPCHA, OL_CHIKI, nil, SUNDANESE_SUPPLEMENT, VEDIC_EXTENSIONS, PHONETIC_EXTENSIONS, PHONETIC_EXTENSIONS_SUPPLEMENT, COMBINING_DIACRITICAL_MARKS_SUPPLEMENT, LATIN_EXTENDED_ADDITIONAL, GREEK_EXTENDED, GENERAL_PUNCTUATION, SUPERSCRIPTS_AND_SUBSCRIPTS, CURRENCY_SYMBOLS, COMBINING_MARKS_FOR_SYMBOLS, LETTERLIKE_SYMBOLS, NUMBER_FORMS, ARROWS, MATHEMATICAL_OPERATORS, MISCELLANEOUS_TECHNICAL, CONTROL_PICTURES, OPTICAL_CHARACTER_RECOGNITION, ENCLOSED_ALPHANUMERICS, BOX_DRAWING, BLOCK_ELEMENTS, GEOMETRIC_SHAPES, MISCELLANEOUS_SYMBOLS, DINGBATS, MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A, SUPPLEMENTAL_ARROWS_A, BRAILLE_PATTERNS, SUPPLEMENTAL_ARROWS_B, MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B, SUPPLEMENTAL_MATHEMATICAL_OPERATORS, MISCELLANEOUS_SYMBOLS_AND_ARROWS, GLAGOLITIC, LATIN_EXTENDED_C, COPTIC, GEORGIAN_SUPPLEMENT, TIFINAGH, ETHIOPIC_EXTENDED, CYRILLIC_EXTENDED_A, SUPPLEMENTAL_PUNCTUATION, CJK_RADICALS_SUPPLEMENT, KANGXI_RADICALS, nil, IDEOGRAPHIC_DESCRIPTION_CHARACTERS, CJK_SYMBOLS_AND_PUNCTUATION, HIRAGANA, KATAKANA, BOPOMOFO, HANGUL_COMPATIBILITY_JAMO, KANBUN, BOPOMOFO_EXTENDED, CJK_STROKES, KATAKANA_PHONETIC_EXTENSIONS, ENCLOSED_CJK_LETTERS_AND_MONTHS, CJK_COMPATIBILITY, CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A, YIJING_HEXAGRAM_SYMBOLS, CJK_UNIFIED_IDEOGRAPHS, YI_SYLLABLES, YI_RADICALS, LISU, VAI, CYRILLIC_EXTENDED_B, BAMUM, MODIFIER_TONE_LETTERS, LATIN_EXTENDED_D, SYLOTI_NAGRI, COMMON_INDIC_NUMBER_FORMS, PHAGS_PA, SAURASHTRA, DEVANAGARI_EXTENDED, KAYAH_LI, REJANG, HANGUL_JAMO_EXTENDED_A, JAVANESE, nil, CHAM, MYANMAR_EXTENDED_A, TAI_VIET, MEETEI_MAYEK_EXTENSIONS, ETHIOPIC_EXTENDED_A, nil, MEETEI_MAYEK, HANGUL_SYLLABLES, HANGUL_JAMO_EXTENDED_B, HIGH_SURROGATES, HIGH_PRIVATE_USE_SURROGATES, LOW_SURROGATES, PRIVATE_USE_AREA, CJK_COMPATIBILITY_IDEOGRAPHS, ALPHABETIC_PRESENTATION_FORMS, ARABIC_PRESENTATION_FORMS_A, VARIATION_SELECTORS, VERTICAL_FORMS, COMBINING_HALF_MARKS, CJK_COMPATIBILITY_FORMS, SMALL_FORM_VARIANTS, ARABIC_PRESENTATION_FORMS_B, HALFWIDTH_AND_FULLWIDTH_FORMS, SPECIALS, LINEAR_B_SYLLABARY, LINEAR_B_IDEOGRAMS, AEGEAN_NUMBERS, ANCIENT_GREEK_NUMBERS, ANCIENT_SYMBOLS, PHAISTOS_DISC, nil, LYCIAN, CARIAN, nil, OLD_ITALIC, GOTHIC, nil, UGARITIC, OLD_PERSIAN, nil, DESERET, SHAVIAN, OSMANYA, nil, CYPRIOT_SYLLABARY, IMPERIAL_ARAMAIC, nil, PHOENICIAN, LYDIAN, nil, MEROITIC_HIEROGLYPHS, MEROITIC_CURSIVE, KHAROSHTHI, OLD_SOUTH_ARABIAN, nil, AVESTAN, INSCRIPTIONAL_PARTHIAN, INSCRIPTIONAL_PAHLAVI, nil, OLD_TURKIC, nil, RUMI_NUMERAL_SYMBOLS, nil, BRAHMI, KAITHI, SORA_SOMPENG, CHAKMA, nil, SHARADA, nil, TAKRI, nil, CUNEIFORM, CUNEIFORM_NUMBERS_AND_PUNCTUATION, nil, EGYPTIAN_HIEROGLYPHS, nil, BAMUM_SUPPLEMENT, nil, MIAO, nil, KANA_SUPPLEMENT, nil, BYZANTINE_MUSICAL_SYMBOLS, MUSICAL_SYMBOLS, ANCIENT_GREEK_MUSICAL_NOTATION, nil, TAI_XUAN_JING_SYMBOLS, COUNTING_ROD_NUMERALS, nil, MATHEMATICAL_ALPHANUMERIC_SYMBOLS, nil, ARABIC_MATHEMATICAL_ALPHABETIC_SYMBOLS, nil, MAHJONG_TILES, DOMINO_TILES, PLAYING_CARDS, ENCLOSED_ALPHANUMERIC_SUPPLEMENT, ENCLOSED_IDEOGRAPHIC_SUPPLEMENT, MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS, EMOTICONS, nil, TRANSPORT_AND_MAP_SYMBOLS, ALCHEMICAL_SYMBOLS, nil, CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B, nil, CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C, CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D, nil, CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT, nil, TAGS, nil, VARIATION_SELECTORS_SUPPLEMENT, nil, SUPPLEMENTARY_PRIVATE_USE_AREA_A, SUPPLEMENTARY_PRIVATE_USE_AREA_B]

		// *
		//          * Creates a UnicodeBlock with the given identifier name.
		//          * This name must be the same as the block identifier.
		private init(_ idName: String!) {
			self.(idName, true)
		}

		private init(_ idName: String!, _ isMap: Bool) {
			super.init(idName)
			if isMap {
				map.put(idName, self)
			}
		}

		// *
		//          * Creates a UnicodeBlock with the given identifier name and
		//          * alias name.
		private init(_ idName: String!, _ alias: String!) {
			self.(idName)
			map.put(alias, self)
		}

		// *
		//          * Creates a UnicodeBlock with the given identifier name and
		//          * alias names.
		private init(_ idName: String!, _ aliases: String![]) {
			self.(idName)
			for alias in aliases {
				map.put(alias, self)
			}
		}

		// *
		//          * Returns the object representing the Unicode block containing the
		//          * given character, or {@code null} if the character is not a
		//          * member of a defined block.
		//          *
		//          * <p><b>Note:</b> This method cannot handle
		//          * <a href="Character.html#supplementary"> supplementary
		//          * characters</a>.  To support all Unicode characters, including
		//          * supplementary characters, use the {@link #of(int)} method.
		//          *
		//          * @param   c  The character in question
		//          * @return  The {@code UnicodeBlock} instance representing the
		//          *          Unicode block of which this character is a member, or
		//          *          {@code null} if the character is not a member of any
		//          *          Unicode block
		public static func of(_ c: AnsiChar) -> UnicodeBlock! {
			return of((c as? Int32))
		}

		// *
		//          * Returns the object representing the Unicode block
		//          * containing the given character (Unicode code point), or
		//          * {@code null} if the character is not a member of a
		//          * defined block.
		//          *
		//          * @param   codePoint the character (Unicode code point) in question.
		//          * @return  The {@code UnicodeBlock} instance representing the
		//          *          Unicode block of which this character is a member, or
		//          *          {@code null} if the character is not a member of any
		//          *          Unicode block
		//          * @exception IllegalArgumentException if the specified
		//          * {@code codePoint} is an invalid Unicode code point.
		//          * @see Character#isValidCodePoint(int)
		//          * @since   1.5
		public static func of(_ codePoint: Int32) -> UnicodeBlock! {
			if !isValidCodePoint(codePoint) {
				throw IllegalArgumentException()
			}
			var top: Int32
			var bottom: Int32
			var current: Int32
			bottom = 0
			top = blockStarts.length
			current = top / 2
			//  invariant: top > current >= bottom && codePoint >= unicodeBlockStarts[bottom]
			while (top - bottom) > 1 {
				if codePoint >= blockStarts[current] {
					bottom = current
				} else {
					top = current
				}
				current = (top + bottom) / 2
			}return blocks[current]
		}

		// *
		//          * Returns the UnicodeBlock with the given name. Block
		//          * names are determined by The Unicode Standard. The file
		//          * Blocks-&lt;version&gt;.txt defines blocks for a particular
		//          * version of the standard. The {@link Character} class specifies
		//          * the version of the standard that it supports.
		//          * <p>
		//          * This method accepts block names in the following forms:
		//          * <ol>
		//          * <li> Canonical block names as defined by the Unicode Standard.
		//          * For example, the standard defines a "Basic Latin" block. Therefore, this
		//          * method accepts "Basic Latin" as a valid block name. The documentation of
		//          * each UnicodeBlock provides the canonical name.
		//          * <li>Canonical block names with all spaces removed. For example, "BasicLatin"
		//          * is a valid block name for the "Basic Latin" block.
		//          * <li>The text representation of each constant UnicodeBlock identifier.
		//          * For example, this method will return the {@link #BASIC_LATIN} block if
		//          * provided with the "BASIC_LATIN" name. This form replaces all spaces and
		//          * hyphens in the canonical name with underscores.
		//          * </ol>
		//          * Finally, character case is ignored for all of the valid block name forms.
		//          * For example, "BASIC_LATIN" and "basic_latin" are both valid block names.
		//          * The en_US locale's case mapping rules are used to provide case-insensitive
		//          * string comparisons for block name validation.
		//          * <p>
		//          * If the Unicode Standard changes block names, both the previous and
		//          * current names will be accepted.
		//          *
		//          * @param blockName A {@code UnicodeBlock} name.
		//          * @return The {@code UnicodeBlock} instance identified
		//          *         by {@code blockName}
		//          * @throws IllegalArgumentException if {@code blockName} is an
		//          *         invalid name
		//          * @throws NullPointerException if {@code blockName} is null
		//          * @since 1.5
		public final static func forName(_ blockName: String!) -> UnicodeBlock! {
			var block: UnicodeBlock! = map.`get`(blockName.toUpperCase(Locale.US))
			if block == nil {
				throw IllegalArgumentException()
			}
			return block
		}
	}

	public enum UnicodeScript { 
		case COMMON
		case LATIN
		case GREEK
		case CYRILLIC
		case ARMENIAN
		case HEBREW
		case ARABIC
		case SYRIAC
		case THAANA
		case DEVANAGARI
		case BENGALI
		case GURMUKHI
		case GUJARATI
		case ORIYA
		case TAMIL
		case TELUGU
		case KANNADA
		case MALAYALAM
		case SINHALA
		case THAI
		case LAO
		case TIBETAN
		case MYANMAR
		case GEORGIAN
		case HANGUL
		case ETHIOPIC
		case CHEROKEE
		case CANADIAN_ABORIGINAL
		case OGHAM
		case RUNIC
		case KHMER
		case MONGOLIAN
		case HIRAGANA
		case KATAKANA
		case BOPOMOFO
		case HAN
		case YI
		case OLD_ITALIC
		case GOTHIC
		case DESERET
		case INHERITED
		case TAGALOG
		case HANUNOO
		case BUHID
		case TAGBANWA
		case LIMBU
		case TAI_LE
		case LINEAR_B
		case UGARITIC
		case SHAVIAN
		case OSMANYA
		case CYPRIOT
		case BRAILLE
		case BUGINESE
		case COPTIC
		case NEW_TAI_LUE
		case GLAGOLITIC
		case TIFINAGH
		case SYLOTI_NAGRI
		case OLD_PERSIAN
		case KHAROSHTHI
		case BALINESE
		case CUNEIFORM
		case PHOENICIAN
		case PHAGS_PA
		case NKO
		case SUNDANESE
		case BATAK
		case LEPCHA
		case OL_CHIKI
		case VAI
		case SAURASHTRA
		case KAYAH_LI
		case REJANG
		case LYCIAN
		case CARIAN
		case LYDIAN
		case CHAM
		case TAI_THAM
		case TAI_VIET
		case AVESTAN
		case EGYPTIAN_HIEROGLYPHS
		case SAMARITAN
		case MANDAIC
		case LISU
		case BAMUM
		case JAVANESE
		case MEETEI_MAYEK
		case IMPERIAL_ARAMAIC
		case OLD_SOUTH_ARABIAN
		case INSCRIPTIONAL_PARTHIAN
		case INSCRIPTIONAL_PAHLAVI
		case OLD_TURKIC
		case BRAHMI
		case KAITHI
		case MEROITIC_HIEROGLYPHS
		case MEROITIC_CURSIVE
		case SORA_SOMPENG
		case CHAKMA
		case SHARADA
		case TAKRI
		case MIAO
		case UNKNOWN
	}

	class CharacterCache { 
		internal let cache: Character![] = Character[](count: 127 + 1)

		private init() {
		}

		private init() {
			for i in 0 ... cache.length - 1 {
				cache[i] = Character((i as? AnsiChar))
			}
		}
	}
}

