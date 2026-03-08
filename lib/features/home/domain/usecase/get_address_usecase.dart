import 'package:address_app/core/error/failure.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:address_app/features/home/domain/repositories/address_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAddressUsecase {
  final AddressRepository addressRepository;

  GetAddressUsecase({required this.addressRepository});

  Future<Either<Failure, AddressEntity>> call(String cep) {
    final cleanedCep = cep.replaceAll(RegExp(r'\D'), '');
    if (cleanedCep.length != 8) {
      return Future.value(
        Left(
          InvalidCepFailure('CEP inválido. O CEP deve conter 8 dígitos.'),
        ),
      );
    }
    return Future.value(addressRepository.getAddress(cleanedCep));
  }
}
