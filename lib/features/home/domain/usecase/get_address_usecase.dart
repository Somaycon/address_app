import 'package:address_app/core/error/failure.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:address_app/features/home/domain/repositories/address_repository.dart';

class GetAddressUsecase {
  final AddressRepository addressRepository;

  GetAddressUsecase({required this.addressRepository});

  AddressEntity call(String cep) {
    final cleanedCep = cep.replaceAll(RegExp(r'\D'), '');
    if (cleanedCep.isEmpty) throw InvalidCepFailure('CEP não pode estar vazio');
    if (cleanedCep.length != 8) {
      throw InvalidCepFailure('O CEP deve conter exatamente 8 dígitos.');
    }
    if (!RegExp(r'^\d{8}$').hasMatch(cleanedCep)) {
      throw InvalidCepFailure('CEP inválido.');
    }
    return addressRepository.getAddress(cleanedCep);
  }
}
