import 'package:address_app/core/error/failure.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:address_app/features/home/domain/repositories/address_repository.dart';
import 'package:address_app/features/home/domain/usecase/get_address_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/src/either.dart';

class AddressRepositoryMock implements AddressRepository {
  @override
  Future<Either<Failure, AddressEntity>> getAddress(String cep) {
    return Future.value(
      Right(
        AddressEntity(
          postalCode: '12345-678',
          street: 'Rua Exemplo',
          neighborhood: 'Bairro Exemplo',
          stateCode: 'SP',
          state: 'São Paulo',
          city: 'São Paulo',
        ),
      ),
    );
  }
}

void main() {
  test('Deve retornar um endereço válido para um CEP válido', () async {
    final repository = AddressRepositoryMock();
    final response = await GetAddressUsecase(
      addressRepository: repository,
    ).call('12345678');
    response.fold(
      (l) {
        fail(
          'Deve retornar um endereço válido, mas retornou um erro: ${l.message}',
        );
      },
      (r) {
        expect(r.postalCode, '12345-678');
        expect(r.street, 'Rua Exemplo');
        expect(r.neighborhood, 'Bairro Exemplo');
        expect(r.stateCode, 'SP');
        expect(r.state, 'São Paulo');
        expect(r.city, 'São Paulo');
      },
    );
  });
}
