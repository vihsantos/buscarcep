abstract class CepExceptionIf implements Exception {
  final String message;
  final int statusCode;

  CepExceptionIf({required this.message, required this.statusCode});
}
