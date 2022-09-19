class Result {
  final bool isValid;
  final String error;
  final Object data;

  Result._(this.isValid, this.error, this.data);

  factory Result.Success(Object data) {
    return Result._(true, "", data);
  }

  factory Result.Error(String error) {
    return Result._(false, error, "");
  }
}
