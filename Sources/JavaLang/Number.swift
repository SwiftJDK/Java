
open /* __abstract */ class Number : java.io.Serializable { 
	// * use serialVersionUID from JDK 1.0.2 for interoperability 
	// 
	private let serialVersionUID: Int64 = -8742448824652078965

	// *
	//      * Returns the value of the specified number as an {@code int},
	//      * which may involve rounding or truncation.
	//      *
	//      * @return  the numeric value represented by this object after conversion
	//      *          to type {@code int}.
	open override func intValue() -> Int32 {
	}

	// *
	//      * Returns the value of the specified number as a {@code long},
	//      * which may involve rounding or truncation.
	//      *
	//      * @return  the numeric value represented by this object after conversion
	//      *          to type {@code long}.
	open override func longValue() -> Int64 {
	}

	// *
	//      * Returns the value of the specified number as a {@code float},
	//      * which may involve rounding.
	//      *
	//      * @return  the numeric value represented by this object after conversion
	//      *          to type {@code float}.
	open override func floatValue() -> Float32 {
	}

	// *
	//      * Returns the value of the specified number as a {@code double},
	//      * which may involve rounding.
	//      *
	//      * @return  the numeric value represented by this object after conversion
	//      *          to type {@code double}.
	open override func doubleValue() -> Float64 {
	}

	// *
	//      * Returns the value of the specified number as a {@code byte},
	//      * which may involve rounding or truncation.
	//      *
	//      * <p>This implementation returns the result of {@link #intValue} cast
	//      * to a {@code byte}.
	//      *
	//      * @return  the numeric value represented by this object after conversion
	//      *          to type {@code byte}.
	//      * @since   JDK1.1
	open func byteValue() -> Int8 {
		return (intValue() as? Int8)
	}

	// *
	//      * Returns the value of the specified number as a {@code short},
	//      * which may involve rounding or truncation.
	//      *
	//      * <p>This implementation returns the result of {@link #intValue} cast
	//      * to a {@code short}.
	//      *
	//      * @return  the numeric value represented by this object after conversion
	//      *          to type {@code short}.
	//      * @since   JDK1.1
	open func shortValue() -> Int16 {
		return (intValue() as? Int16)
	}
}

