class Evaluations {
  static final _numbersExpresion = RegExp(r'[0-9]');

  static bool isValidString(dynamic value) {
    return value is String && value.isNotEmpty;
  }

  /// This evaluation identifies if a text that is
  /// sent as a parameter only and only contains
  /// LETTERS, in case of containing characters other
  /// than LETTERS (a-z) it returns false
  static bool isOnlyLetters(String text) {
    return !text.contains(_numbersExpresion);
  }

  /// This method is in charge of identifying if a word
  /// is Palindrome, for this it uses [_reverseText],
  /// the internal logic looks for:
  /// ```dart
  /// final text = 'LOGIC';
  ///
  /// return [bool] (_reverseText(text) == text);
  /// ```
  ///
  /// Where the answer matches "if the comparison of the
  /// inverted word is equal"
  static bool isPalindrome(String text) {
    return _reverseText(text) == text;
  }

  /// This method seeks to reorganize the text that is
  /// sent as a parameter using a [for] and [StringBuffer].
  ///
  /// [StringBuffer], unlike a normal String, has the
  /// ability to not create variables every time a
  /// [String] is concatenated
  static String _reverseText(String value) {
    final handleString = StringBuffer();

    for (var i = value.length - 1; i >= 0; i--) {
      final currentLetter = value[i];
      handleString.write(currentLetter);
    }

    return handleString.toString();
  }
}
