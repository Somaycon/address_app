sealed class Failure {
  final String message;

  Failure(this.message);
}

class InvalidCepFailure extends Failure {
  InvalidCepFailure(super.message);
}

class AddressNotFoundFailure extends Failure {
  AddressNotFoundFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}
