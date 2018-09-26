
// import sun.misc

public final class Float : Number, Comparable<Float!> { 
	// *
	//      * A constant holding the positive infinity of type
	//      * {@code float}. It is equal to the value returned by
	//      * {@code Float.intBitsToFloat(0x7f800000)}.
	//      
	// 
	public let POSITIVE_INFINITY: Float32 = 1.0 / 0.0
	// *
	//      * A constant holding the negative infinity of type
	//      * {@code float}. It is equal to the value returned by
	//      * {@code Float.intBitsToFloat(0xff800000)}.
	//      
	// 
	public let NEGATIVE_INFINITY: Float32 = -1.0 / 0.0
	// *
	//      * A constant holding a Not-a-Number (NaN) value of type
	//      * {@code float}.  It is equivalent to the value returned by
	//      * {@code Float.intBitsToFloat(0x7fc00000)}.
	//      
	// 
	public let NaN: Float32 = 0.0 / 0.0
	// *
	//      * A constant holding the largest positive finite value of type
	//      * {@code float}, (2-2<sup>-23</sup>)&middot;2<sup>127</sup>.
	//      * It is equal to the hexadecimal floating-point literal
	//      * {@code 0x1.fffffeP+127f} and also equal to
	//      * {@code Float.intBitsToFloat(0x7f7fffff)}.
	//      
	// 
	public let MAX_VALUE: Float32 = 3.40282346638529E+38
}

