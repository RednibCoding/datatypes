## **`datatypes`**

Brings the whole range of data types, known from other languages like C and C# to Dart.

`byte`, `short`, `sint`, and `long` are the standard signed integer datatypes and `ubyte`, `ushort`, `uint` and `ulong` are the standard unsigned integer datatypes exposed by this library.

All operations and functions can be seamlessly used with other `integer` types, and native `int`, `double` datatypes. Remember that all integer datatypes provided do not actually allocate different bit-widths in memory. This is due to the limitation of Dart's VM.

```dart
/// Use the constructor
sint(32423445435)
/// or use getters
32423445435.i // -1936292933
```

| Data Type  | Getter  |  Bit  |
|     ---    |   ---   |  ---  |
|    byte    |    b    |   8   |
|    short   |    s    |  16   |
|    sint    |    i    |  32   |
|    long    |    l    |  64   |
|    ubyte   |    ub   |   8   |
|    ushort  |    us   |  16   |
|    uint    |    ui   |  32   |
|    ulong   |    ul   |  63   |

> **_NOTE:_** due to the fact that dart only supports 64 bit signed integers, ulong is basically the positive half of long.

Remember to enclose negative integer literals like -34644 or -89 in parenthesis to tell Dart that the getters should be called for the entire literal. Like this

```dart
(-98723447).us // 39305
```

### Operations

All operations are compatible with native `int` and are also compatible with all signed and unsigned `integer` datatypes.

```dart
ushort a = (-982342623).us;
print('Value of 16-bit unsigned integer a is $a');
print('Addition int: ${a + 862} double: ${a + 862.343}');
print('Subtraction int: ${a - 36} double: ${a - 36.909}');
print('Multiplication int: ${a * 6} double: ${a * 6.2345}');
print('Division int: ${a / 6} double: ${a / 6.2345}');
print('Euclidean Modulo int: ${a % 8} double: ${a % 8.923}');
```

Bitshift operations only support `integer` and `int` values
```dart
print('Left Shift: ${a << 3}');
print('Right Shift: ${a >> 9}');
print('Triple Shift: ${a >>> 5}');
```

If `double` values are used in operations of `integer` variables, the value is truncated after the operation.

Below shows the maximum values before each data type wraps around:
```dart
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
```