import 'package:address_app/core/error/failure.dart';
import 'package:dio/dio.dart';

class DioExceptionHandler {
  static Failure toFailure(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Tempo de conexao esgotado. Tente novamente.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Tempo de envio esgotado. Tente novamente.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Tempo de resposta esgotado. Tente novamente.');
      case DioExceptionType.badCertificate:
        return ServerFailure('Certificado invalido para conexao segura.');
      case DioExceptionType.badResponse:
        return ServerFailure('Resposta invalida do servidor. Tente novamente.');
      case DioExceptionType.cancel:
        return ServerFailure('Requisicao cancelada.');
      case DioExceptionType.connectionError:
        return ServerFailure('Sem conexao com a internet.');
      case DioExceptionType.unknown:
        return ServerFailure('Erro de rede inesperado. Tente novamente.');
    }
  }
}
