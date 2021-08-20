import 'domain/usecases/palindrome.dart';

//A class is executed from the initial method whose
//intention is to identify if a text that is entered
//by the console is considered as a palindrome, depending
//on the state of the process, it will return an alert
//of the type error or the type info.
void main(List<String> arguments) {
  return Palindrome().evaluate();
}
