import 'package:datatypes/datatypes.dart';

void main() {
  /// A Signed Integer that is bound within the limits of 32 bits
  var v32 = 34234324.i;
  print('Conversion of 34234324 to 32-bit signed integer is $v32');

  /// Operations
  ushort a = (-982342623).us;
  print('Value of 16-bit unsigned integer a is $a');
  print('Addition int: ${a + 862} double: ${a + 862.343}');
  print('Subtraction int: ${a - 36} double: ${a - 36.909}');
  print('Multiplication int: ${a * 6} double: ${a * 6.2345}');
  print('Euclidean Modulo int: ${a % 8} double: ${a % 8.923}');

  /// Division always returns `double` datatype and not the `integer` datatype of the operand
  print('Division int: ${a / 6} double: ${a / 6.2345}');

  /// Bitshift operations only support `integer` and `int` values
  print('Left Shift: ${a << 3}');
  print('Right Shift: ${a >> 9}');
  print('Triple Shift: ${a >>> 5}');

  /// An Unsigned Integer that is bound within the limits of 8 bits
  ///
  /// Remember to enclose negative integer literals in parenthesis, or else
  ///  the results will not be as expected
  print('Conversion of -34234 to unsigned 8-bit integer is ${(-34234).ub}');

  // These are the maximum values each data type can hold, add one to it and it will wrap
  byte s8 = 127.b;
  print("byte: ${s8.bytes}"); // [127]

  ubyte u8 = 255.ub;
  print("ubyte: ${u8.bytes}"); // [255]

  short s16 = 32767.s;
  print("short: ${s16.bytes}"); // [127, 255]

  ushort u16 = 65535.us;
  print("ushort: ${u16.bytes}"); // [255, 255]

  sint i32 = 2147483647.i;
  print("sint: ${i32.bytes}"); // [127, 255, 255, 255]

  uint u32 = 4294967295.ui;
  print("uint: ${u32.bytes}"); // [255, 255, 255, 255]

  long l64 = 9223372036854775807.l;
  print("long: ${l64.bytes}"); // [127, 255, 255, 255, 255, 255, 255, 255]

  // Dart only supports a maximum of 64 bit signed integers
  ulong u64 = 9223372036854775807.ul;
  print("ulong: ${u64.bytes}"); // [127, 255, 255, 255, 255, 255, 255, 255]

  // But this wraps around as intended
  ulong u_64 = (-1).ul;
  print("negative ulong: ${u_64.bytes}"); // [127, 255, 255, 255, 255, 255, 255, 255]
}
