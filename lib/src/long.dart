// ignore_for_file: camel_case_types

part of datatypes;

/// 64-bit Signed Integer
///
/// `-9223372036854775808` to `9223372036854775807`
///
/// The `long` type is contagious. Most operations on `long` will return `long`
///  values
class long extends signed {
  /// 64-bit Signed Integer
  ///
  /// `-9223372036854775808` to `9223372036854775807`
  long(int value) : super(value: value);

  /// 64-bit Signed Integer
  ///
  /// `-9223372036854775808` to `9223372036854775807`
  ///
  /// Create `long` from another `integer` value
  long.integer(integer val) : super(value: val.value);

  /// 64-bit Signed Integer
  ///
  /// `-9223372036854775808` to `9223372036854775807`
  ///
  /// Returns the integer value of the given environment declaration [name].
  ///
  /// The result is the same as would be returned by:
  /// ```dart template:expression
  /// long(int.tryParse(const String.fromEnvironment(name, defaultValue: ""))
  ///     ?? defaultValue)
  /// ```
  /// Example:
  /// ```dart
  /// long.fromEnvironment("defaultPort", defaultValue: 80)
  /// ```
  factory long.fromEnvironment(String name, {int defaultValue = 0}) {
    return long(
      int.fromEnvironment(
        name,
        defaultValue: defaultValue,
      ),
    );
  }

  /// 64-bit Signed Integer
  ///
  /// `-9223372036854775808` to `9223372036854775807`
  ///
  /// Parse [source] as a, possibly signed, integer literal and return its value.
  ///
  /// The [source] must be a non-empty sequence of base-[radix] digits,
  /// optionally prefixed with a minus or plus sign ('-' or '+').
  ///
  /// The [radix] must be in the range 2..36. The digits used are
  /// first the decimal digits 0..9, and then the letters 'a'..'z' with
  /// values 10 through 35. Also accepts upper-case letters with the same
  /// values as the lower-case ones.
  ///
  /// If no [radix] is given then it defaults to 10. In this case, the [source]
  /// digits may also start with `0x`, in which case the number is interpreted
  /// as a hexadecimal integer literal.
  long.parse(
    String source, {
    int? radix,
  }) : super(
          value: int.parse(
            source,
            radix: radix,
          ),
        );

  /// Parse [source] as a, signed integer literal.
  ///
  /// Like [parse] except that this function returns `null` where a
  /// similar call to [parse] would throw a [FormatException].
  static long? tryParse(String source) {
    int? val = int.tryParse(source);
    if (val != null) {
      return long(val);
    }
    return null;
  }

  /// Multiplies this integer by `other`.
  ///
  /// If the `other` number is `double`, the value is truncated after
  ///  multiplication
  ///
  /// Returns `long`
  @override
  long operator *(dynamic other) {
    if (other is integer) {
      return long(value * other.value);
    } else if (other is int) {
      return long(value * other);
    } else if (other is double) {
      return long((value * other).truncate());
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// Adds `other` to this number.
  ///
  /// If the `other` number is `double`, the value is truncated after
  ///  addition
  ///
  /// Returns `long`
  @override
  long operator +(dynamic other) {
    if (other is integer) {
      return long(value + other.value);
    } else if (other is int) {
      return long(value + other);
    } else if (other is double) {
      return long((value + other).truncate());
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// Subtracts `other` from this number.
  ///
  /// If the `other` number is `double`, the value is truncated after
  ///  subtraction
  ///
  /// Returns `long`
  @override
  long operator -(dynamic other) {
    if (other is integer) {
      return long(value - other.value);
    } else if (other is int) {
      return long(value - other);
    } else if (other is double) {
      return long((value - other).truncate());
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// Truncating division operator.
  ///
  /// Performs truncating division of this number by [other].
  /// Truncating division is division where a fractional result
  /// is converted to an integer by rounding towards zero.
  ///
  /// If both operands are [int]s, then [other] must not be zero.
  /// Then `a ~/ b` corresponds to `a.remainder(b)`
  /// such that `a == (a ~/ b) * b + a.remainder(b)`.
  ///
  /// `a ~/ b` is equivalent to `(a / b).truncate()`.
  /// This means that the intermediate result of the double division
  /// must be a finite integer (not an infinity or [double.nan]).
  ///
  /// Returns `long`
  @override
  long operator ~/(dynamic other) {
    if (other is integer) {
      return long(value ~/ other.value);
    } else if (other is int) {
      return long(value ~/ other);
    } else if (other is double) {
      return long(value ~/ other);
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// Euclidean modulo of this number by [other].
  ///
  /// Returns the remainder of the Euclidean division.
  /// The Euclidean division of two integers `a` and `b`
  /// yields two integers `q` and `r` such that
  /// `a == b * q + r` and `0 <= r < b.abs()`.
  ///
  /// The Euclidean division is only defined for integers, but can be easily
  /// extended to work with doubles. In that case, `q` is still an integer,
  /// but `r` may have a non-integer value that still satisfies `0 <= r < |b|`.
  ///
  /// The sign of the returned value `r` is always positive.
  ///
  /// See [remainder] for the remainder of the truncating division.
  ///
  /// Returns `long`
  @override
  long operator %(dynamic other) {
    if (other is integer) {
      return long(value % other.value);
    } else if (other is int) {
      return long(value % other);
    } else if (other is double) {
      return long((value % other).truncate());
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// The remainder of the truncating division of `this` by [other].
  ///
  /// The result `r` of this operation satisfies:
  /// `this == (this ~/ other) * other + r`.
  /// As a consequence, the remainder `r` has the same sign as the divider
  /// `this`.
  @override
  long remainder(dynamic other) {
    if (other is integer) {
      return long(value.remainder(other.value));
    } else if (other is int) {
      return long(value.remainder(other));
    } else if (other is double) {
      return long((value.remainder(other)).truncate());
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// Bit-wise and operator.
  ///
  /// Treating both `this` and [other] as sufficiently large two's component
  /// integers, the result is a number with only the bits set that are set in
  /// both `this` and [other]
  ///
  /// If both operands are negative, the result is negative, otherwise
  /// the result is non-negative.
  ///
  /// Returns `long`
  @override
  long operator &(dynamic other) {
    if (other is integer) {
      return long(value & other.value);
    } else if (other is int) {
      return long(value & other);
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// Bit-wise or operator.
  ///
  /// Treating both `this` and [other] as sufficiently large two's component
  /// integers, the result is a number with the bits set that are set in either
  /// of `this` and [other]
  ///
  /// If both operands are non-negative, the result is non-negative,
  /// otherwise the result is negative.
  ///
  /// Returns `long`
  @override
  long operator |(dynamic other) {
    if (other is integer) {
      return long(value | other.value);
    } else if (other is int) {
      return long(value | other);
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// Bit-wise exclusive-or operator.
  ///
  /// Treating both `this` and [other] as sufficiently large two's component
  /// integers, the result is a number with the bits set that are set in one,
  /// but not both, of `this` and [other]
  ///
  /// If the operands have the same sign, the result is non-negative,
  /// otherwise the result is negative.
  ///
  /// Returns `long`
  @override
  long operator ^(dynamic other) {
    if (other is integer) {
      return long(value ^ other.value);
    } else if (other is int) {
      return long(value ^ other);
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// The bit-wise negate operator.
  ///
  /// Treating `this` as a sufficiently large two's component integer,
  /// the result is a number with the opposite bits set.
  ///
  /// This maps any integer `x` to `-x - 1`.
  ///
  /// Returns `long`
  @override
  long operator ~() => long(~value);

  /// Shift the bits of this integer to the left by [shiftAmount].
  ///
  /// Shifting to the left makes the number larger, effectively multiplying
  /// the number by `pow(2, shiftIndex)`.
  ///
  /// There is no limit on the size of the result. It may be relevant to
  /// limit intermediate values by using the "and" operator with a suitable
  /// mask.
  ///
  /// It is an error if [shiftAmount] is negative.
  ///
  /// Returns `long`
  @override
  long operator <<(dynamic other) {
    if (other is integer) {
      return long(value << other.value);
    } else if (other is int) {
      return long(value << other);
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// Shift the bits of this integer to the right by [shiftAmount].
  ///
  /// Shifting to the right makes the number smaller and drops the least
  /// significant bits, effectively doing an integer division by
  /// `pow(2, shiftIndex)`.
  ///
  /// It is an error if [shiftAmount] is negative.
  ///
  /// Returns `long`
  @override
  long operator >>(dynamic other) {
    if (other is integer) {
      return long(value >> other.value);
    } else if (other is int) {
      return long(value >> other);
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// Bitwise unsigned right shift by [shiftAmount] bits.
  ///
  /// The least significant [shiftAmount] bits are dropped,
  /// the remaining bits (if any) are shifted down,
  /// and zero-bits are shifted in as the new most significant bits.
  ///
  /// The [shiftAmount] must be non-negative.
  ///
  /// Returns `long`
  @override
  long operator >>>(dynamic other) {
    if (other is integer) {
      return long(value >>> other.value);
    } else if (other is int) {
      return long(value >>> other);
    } else {
      throw Exception('Invalid type for operand: ${other.runtimeType}');
    }
  }

  /// Returns this integer to the power of [exponent] modulo [modulus].
  ///
  /// The [exponent] must be non-negative and [modulus] must be positive.
  @override
  long modPow(unsigned exponent, unsigned modulus) => long(value.modPow(exponent.value, modulus.value));

  /// Returns the modular multiplicative inverse of this integer
  /// modulo [modulus].
  ///
  /// The [modulus] must be positive.
  ///
  /// It is an error if no modular inverse exists.
  @override
  long modInverse(unsigned modulus) => long(value.modInverse(modulus.value));

  /// Returns the greatest common divisor of this integer and [other].
  ///
  /// If either number is non-zero, the result is the numerically greatest
  /// integer dividing both `this` and `other`.
  ///
  /// The greatest common divisor is independent of the order,
  /// so `x.gcd(y)` is  always the same as `y.gcd(x)`.
  ///
  /// For any integer `x`, `x.gcd(x)` is `x.abs()`.
  ///
  /// If both `this` and `other` is zero, the result is also zero.
  @override
  long gcd(integer other) => long(value.gcd(other.value));

  /// Return the negative value of this integer.
  ///
  /// The result of negating an integer always has the opposite sign, except
  /// for zero, which is its own negation.
  @override
  long operator -() => long(-value);

  /// Returns the absolute value of this integer.
  ///
  /// For any integer `value`,
  /// the result is the same as `value < 0 ? -value : value`.
  @override
  ulong abs() => ulong(value.abs());

  /// Returns an Int8List of the value
  ///
  /// If the value is outside of it's range, it will wrap
  Int8List get bytes => toBytes(8);
}
