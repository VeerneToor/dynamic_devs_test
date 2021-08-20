import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import '../bin/domain/usecases/evaluations.dart';

void main() {
  group('All Evaluations Service', () {
    test('When a text is known to be a palindrome', () {
      expect(Evaluations.isPalindrome('oso'), isTrue);
    });

    test('When you know that a text is not a palindrome', () {
      expect(Evaluations.isPalindrome('Alaska'), isFalse);
    });

    test('When is an invalid String', () {
      expect(Evaluations.isValidString(null), isFalse);
      expect(Evaluations.isValidString(''), isFalse);
    });

    test('When is valid String', () {
      expect(Evaluations.isValidString('lorem ipsum dolor'), isTrue);
    });

    test('When a text that should only contain letters contains numbers', () {
      expect(Evaluations.isOnlyLetters('Hello W0rld'), isFalse);
    });

    test('When a text that should only contain letters contains letters', () {
      expect(Evaluations.isOnlyLetters('Hello World'), isTrue);
    });
  });

  group('Palindrome Service', () {
    Future<String> runProcess(dynamic value) async {
      var process = await Process.start(
        'dart',
        ['run'],
      );

      process.stdin.writeln(value);

      final lineStream = process.stdout.transform(
        Utf8Decoder(),
      );

      return await lineStream.last;
    }

    test('When is it a palindrome', () async {
      final processResult = await runProcess('oso');
      expect(
          processResult,
          '\n'
          '      ****************************************************************\n'
          '\n'
          '      Info: The word OSO is a palindrome\n'
          '\n'
          '      ****************************************************************\n'
          '      \n'
          '    \n'
          '');
    });

    test('When it is not a palindrome', () async {
      final processResult = await runProcess('saco');
      expect(
          processResult,
          '\n'
          '      ****************************************************************\n'
          '\n'
          '      Info: The word SACO is NOT a palindrome\n'
          '\n'
          '      ****************************************************************\n'
          '      \n'
          '    \n'
          '');
    });

    test('When the text entered contains numbers', () async {
      final processResult = await runProcess('H0l4');
      expect(
        processResult,
        '\n'
        '      ----------------------------------------------------------------\n'
        '\n'
        '      Error: The word can only contain letters (not numbers)\n'
        '\n'
        '      ----------------------------------------------------------------\n'
        '      Terminating Application ...\n'
        '      \n'
        '    \n'
        '',
      );
    });

    test('When the text entered is not a valid String', () async {
      final processResult = await runProcess('');
      final expectedResult = '\n'
          '      ----------------------------------------------------------------\n'
          '\n'
          '      Error: You have not entered a word\n'
          '\n'
          '      ----------------------------------------------------------------\n'
          '      Terminating Application ...\n'
          '      \n'
          '    \n'
          '';
      expect(
        processResult,
        expectedResult,
      );
    });
  });
}
