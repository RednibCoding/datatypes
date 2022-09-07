part of datatypes;

/// Extensions providing getters that return signed integer datatypes
extension SignedIntegerExtension on int {
  /// `8-bit` signed integer
  byte get b => byte(this);

  /// `16-bit` signed integer
  short get s => short(this);

  /// `32-bit` signed integer
  sint get i => sint(this);

  /// `64-bit` signed integer
  long get l => long(this);
}

/// Extensions providing getters that return unsigned integer datatypes
extension UnsignedIntegerExtension on int {
  /// `8-bit` unsigned integer
  ubyte get ub => ubyte(this);

  /// `16-bit` unsigned integer
  ushort get us => ushort(this);

  /// `32-bit` unsigned integer
  uint get ui => uint(this);

  /// `64-bit` unsigned integer
  ulong get ul => ulong(this);
}
