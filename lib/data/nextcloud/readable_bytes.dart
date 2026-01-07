String readableBytes(num? bytes) {
  if (bytes == null) return '... B';
  const units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];

  var i = 0;
  var groupedBytes = bytes.toDouble();
  while (groupedBytes >= 1024 && i < units.length - 1) {
    groupedBytes /= 1024;
    i++;
  }
  if (groupedBytes > 900 && i < units.length - 1) {
    // e.g. 0.95 KB instead of 950 B
    groupedBytes /= 1024;
    i++;
  }

  // Return 3 significant figures, except for bytes which are integers
  final int decimalPlaces;
  if (i == 0) {
    decimalPlaces = 0;
  } else if (groupedBytes < 10) {
    decimalPlaces = 2;
  } else if (groupedBytes < 100) {
    decimalPlaces = 1;
  } else {
    decimalPlaces = 0;
  }

  return '${groupedBytes.toStringAsFixed(decimalPlaces)} ${units[i]}';
}
