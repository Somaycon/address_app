import 'package:address_app/core/error/failure.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class AddressRepository {
  Future<Either<Failure, AddressEntity>> getAddress(String cep);
}
