import 'package:address_app/features/home/data/datasources/address_datasource.dart';
import 'package:address_app/core/error/failure.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:address_app/features/home/domain/repositories/address_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressDatasource addressDatasource;

  AddressRepositoryImpl({required this.addressDatasource});
  @override
  Future<Either<Failure, AddressEntity>> getAddress(String cep) async {
    return await addressDatasource.getAddress(cep);
  }
}
