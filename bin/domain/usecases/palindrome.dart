import 'dart:io';

import '../adapters/validation_error.dart';
import 'alert.dart';
import 'evaluations.dart';

class Palindrome {
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
