/// This class seeks to facilitate the print
/// of the script when causing an error or
/// responding @Info
class Alert {
  // Displays a message for events that terminate
  // or are in error during script execution
  static void printError(String message) {
    print('''

      ----------------------------------------------------------------

      Error: $message

      ----------------------------------------------------------------
      Terminating Application ...
      
    ''');
  }

  /// Shows an alert that tries to write purely
  /// informative messages, such as when a case
  /// is successful
  static void printInfo(String message) {
    print('''

      ****************************************************************

      Info: $message

      ****************************************************************
      
    ''');
  }
}
