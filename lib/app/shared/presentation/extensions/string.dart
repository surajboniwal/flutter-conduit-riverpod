extension StringX on String {
  String get sentenceCase =>
      '${substring(0, 1).toUpperCase()}${substring(1, length)}';
}
