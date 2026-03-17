import 'package:address_app/features/home/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.postalCode,
    required super.street,
    required super.neighborhood,
    required super.stateCode,
    required super.state,
    required super.city,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      postalCode: json['cep'] ?? '',
      street: json['logradouro'] ?? '',
      neighborhood: json['bairro'] ?? '',
      stateCode: json['uf'] ?? '',
      state: json['estado'] ?? '',
      city: json['localidade'] ?? '',
    );
  }
}
