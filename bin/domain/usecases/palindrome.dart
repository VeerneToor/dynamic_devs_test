import 'dart:io';

import '../adapters/validation_error.dart';
import 'alert.dart';
import 'evaluations.dart';

/// This class contains the necessary methods to feed information
///  to other services that by means of data return will
/// facilitate the responses to the user
class Palindrome {
  /// This method has the task of leading the procedural
  /// issues necessary to notify the user regarding whether
  /// his entered word is a palindrome
  void evaluate() {
    try {
      stdout.write('Enter the text to evaluate if it is a palindrome: ');
      final word = stdin.readLineSync() ?? '';

      if (!Evaluations.isValidString(word)) {
        throw ValidationError('You have not entered a word');
      } else if (!Evaluations.isOnlyLetters(word)) {
        throw ValidationError(
          'The word can only contain letters (not numbers)',
        );
      }

      final isPalindrome = Evaluations.isPalindrome(word);
      final upperCaseWord = word.toUpperCase();

      if (isPalindrome) {
        return Alert.printInfo('The word $upperCaseWord is a palindrome');
      } else {
        return Alert.printInfo('The word $upperCaseWord is NOT a palindrome');
      }
    } on ValidationError catch (error) {
      Alert.printError(error.message);
    }
  }
}
