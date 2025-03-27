extension StringExtension on String? {
  /// Returns true if the string is null or empty
  bool get isEmptyOrNull => this == null || this!.isEmpty;

  /// Returns true if the string is not null and not empty
  bool get isNotEmptyOrNull => !isEmptyOrNull;
} 