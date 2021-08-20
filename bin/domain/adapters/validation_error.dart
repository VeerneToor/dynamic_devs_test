/// This class abstracts from @Error the characteristics
/// necessary to be taken in a throw, with this class errors
/// will be handled during execution
class ValidationError extends Error {
  ValidationError(this.message);

  final String message;
}
