import 'package:address_app/core/error/failure.dart';
import 'package:address_app/core/network/api_client.dart';
import 'package:address_app/core/network/dio_exception_handler.dart';
import 'package:address_app/features/home/data/models/address_model.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class AddressDatasource {
  final ApiClient apiClient;

  AddressDatasource({
    required this.apiClient,
  });

  Future<Either<Failure, AddressEntity>> getAddress(String cep) async {
    try {
      final response = await apiClient.get('$cep/json');
      if (response.data is! Map<String, dynamic>) {
        return Left(
          ServerFailure('Resposta inesperada do servidor. Tente novamente.'),
        );
      }
      if (response.statusCode == 200) {
        final errorValue = response.data['erro'];
        final hasError =
            errorValue == true ||
            (errorValue is String && errorValue.toLowerCase() == 'true');

        if (hasError) {
          return Left(AddressNotFoundFailure('CEP não encontrado.'));
        }
        return Right(AddressModel.fromJson(response.data));
      }
      return Left(ServerFailure('Falha ao consultar CEP. Tente novamente.'));
    } on DioException catch (e) {
      return Left(DioExceptionHandler.toFailure(e));
    }
  }
}
