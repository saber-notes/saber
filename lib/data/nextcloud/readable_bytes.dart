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

  final unit = units[i];
  // Return 3 significant figures
  if (groupedBytes < 10) {
    return '${groupedBytes.toStringAsFixed(2)} $unit';
  } else if (groupedBytes < 100) {
    return '${groupedBytes.toStringAsFixed(1)} $unit';
  } else {
    return '${groupedBytes.round()} $unit';
  }
}
