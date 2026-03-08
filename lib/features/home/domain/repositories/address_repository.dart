import 'package:address_app/features/home/domain/entities/address_entity.dart';

abstract class AddressRepository {
  AddressEntity getAddress(String cep);
}
