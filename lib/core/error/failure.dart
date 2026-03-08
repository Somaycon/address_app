sealed class Failure {
  final String message;

  Failure(this.message);
}

class InvalidCepFailure extends Failure{
  InvalidCepFailure(super.message);
}

