import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/painting.dart';


// class used to write binary version of sbn file directly, not using json
class BinaryWriter {

  // Scale factor to preserve 3 decimal places
  static const double _scale = 1000.0;

  final BytesBuilder _buffer = BytesBuilder();

  void clear() {
    _buffer.clear(); // Empties the buffer
  }

  void writeKey(int key) {
    _buffer.addByte(key);
  }


  void writeInt(int key, int val) {
    final b = ByteData(4)..setInt32(0, val, Endian.little);
    _buffer.addByte(key);
    _buffer.add(b.buffer.asUint8List());
  }

  void writeFloat(int key, double val) {
    final b = ByteData(4)..setFloat32(0, val, Endian.little);
    _buffer.addByte(key);
    _buffer.add(b.buffer.asUint8List());
  }

  void writeScaledFloat(int key, double val) {
    // used to write positions on canvas to have small file but enough precision
    int scaledVal = (val * _scale).round();
    final b = ByteData(4)..setInt32(0, scaledVal, Endian.little);
    _buffer.addByte(key);
    _buffer.add(b.buffer.asUint8List());
  }


  void writeDouble(int key, double value) {
    final b = ByteData(8)..setFloat64(0, value, Endian.little);
    _buffer.addByte(key);
    _buffer.add(b.buffer.asUint8List());
  }

  void writeBool(int key, bool val) {
    _buffer.addByte(key);
    _buffer.addByte(val ? 1 : 0);
  }

  void writeColor(int key, Color? color) {
    if (color == null) return;  // do not write it
    writeInt(key, color.toARGB32()); // ARGB32 is just an int
  }

  void writeString(int key, String value) {
    final bytes = utf8.encode(value);
    final lenBytes = ByteData(4)..setUint32(0, bytes.length, Endian.little);
    _buffer.addByte(key);
    _buffer.add(lenBytes.buffer.asUint8List());
    _buffer.add(bytes);
  }

  void writeEnum(int key, Enum value) {
    _buffer.addByte(key);
    _buffer.addByte(value.index);
  }

  void writeFloatNoKey(double val) {
    final b = ByteData(4)..setFloat32(0, val, Endian.little);
    _buffer.add(b.buffer.asUint8List());
  }
  void writeScaledFloatNoKey(double val) {
    // used to write positions on canvas to have small file but enough precision
    int scaledVal = (val * _scale).round();
    final b = ByteData(4)..setInt32(0, scaledVal, Endian.little);
    _buffer.add(b.buffer.asUint8List());
  }
  void writeDoubleNoKey(double value) {
    final b = ByteData(8)..setFloat64(0, value, Endian.little);
    _buffer.add(b.buffer.asUint8List());
  }
  void writeIntNoKey(int val) {
    final b = ByteData(4)..setInt32(0, val, Endian.little);
    _buffer.add(b.buffer.asUint8List());
  }
  void writeBoolNoKey(bool val) {
    _buffer.addByte(val ? 1 : 0);
  }

  void writeStringNoKey(String value) {
    final bytes = utf8.encode(value);
    final lenBytes = ByteData(4)..setUint32(0, bytes.length, Endian.little);
    _buffer.add(lenBytes.buffer.asUint8List());
    _buffer.add(bytes);
  }



  /// Returns the accumulated binary data as a Uint8List
  Uint8List toBytes() => _buffer.toBytes();
}

class BinaryReader {
  late ByteData _data;
  int _offset = 0;

  BinaryReader(Uint8List buffer) {
    _data = ByteData.sublistView(buffer);
  }

  bool get isEOF => _offset >= _data.lengthInBytes;

  int readKey() => _data.getUint8(_offset++);

  int readInt() {
    final val = _data.getInt32(_offset, Endian.little);
    _offset += 4;
    return val;
  }

  double readFloat() {
    final val = _data.getFloat32(_offset, Endian.little);
    _offset += 4;
    return val;
  }
  double readScaledFloat() {
    final val = _data.getInt32(_offset, Endian.little);
    _offset += 4;
    return val / BinaryWriter._scale;
  }

  bool readBool() => _data.getUint8(_offset++) != 0;

  String readString() {
    final length = _data.getUint32(_offset, Endian.little);
    _offset += 4;
    final bytes = _data.buffer.asUint8List(_offset, length);
    final str = utf8.decode(bytes);
    _offset += length;
    return str;
  }

  Enum readEnum(List<Enum> values) {
    final index = _data.getUint8(_offset++);
    return values[index];
  }

  int readIntNoKey() => readInt();
  double readFloatNoKey() => readFloat();
  bool readBoolNoKey() => readBool();
  String readStringNoKey() => readString();

  /// Reads color stored as ARGB int
  Color readColor() => Color(readInt());
}

abstract class SBNBinaryKeys {
  static const int version = 1;
  static const int nextImageId = 2;
  static const int backgroundColor = 3;
  static const int backgroundPattern = 4;
  static const int lineHeight = 5;
  static const int lineThickness = 6;
  static const int pages = 122;
  static const int pageCount = 123;
  static const int initialPageIndex = 7;
}

abstract class PageBinaryKeys {
  static const int version = 1;
  static const int width = 2;         // 'w'
  static const int height = 3;        // 'h'
  static const int strokes = 4;       // 's'
  static const int images = 5;        // 'i'
  static const int quill = 6;         // 'q'
  static const int backgroundImage = 7; // 'b'
}

abstract class ImageBinaryKeys {
  static const int version = 1;
  static const int id = 2;
  static const int extension = 3;
  static const int pageIndex = 4;
  static const int invertible = 5;
  static const int backgroundFit = 6;

  static const int dstLeft = 7;
  static const int dstTop = 8;
  static const int dstWidth = 9;
  static const int dstHeight = 10;

  static const int srcLeft = 11;
  static const int srcTop = 12;
  static const int srcWidth = 13;
  static const int srcHeight = 14;

  static const int naturalWidth = 15;
  static const int naturalHeight = 16;

  // Reserved keys for extensions / subclasses
  static const int imageBytes = 101;
  static const int assetId = 102;
  static const int pdfi = 103;
}

abstract class StrokeBinaryKeys {
  static const int version = 1;
  static const int shape = 2;
  static const int pointCount = 3;
  static const int pageIndex = 4;
  static const int penType = 5;
  static const int pressureEnabled = 6;
  static const int color = 7;
  static const int cx = 8;
  static const int cy = 9;
  static const int r = 10;
  static const int left = 11;
  static const int top = 12;
  static const int width = 13;
  static const int height = 14;

  // options
  static const int size = 101;
  static const int thinning = 102;
  static const int smoothing = 103;
  static const int streamline = 104;
  static const int startTaperEnabled = 105;
  static const int startCustomTaper = 106;
  static const int endTaperEnabled = 107;
  static const int endCustomTaper = 108;
  static const int startCap = 109;
  static const int endCap = 110;
  static const int simulatePressure = 111;
  static const int isComplete = 112;
  static const int endOptions = 130;  // indicate end options
}
