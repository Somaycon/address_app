import 'package:address_app/features/home/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.cep,
    required super.logadouro,
    required super.bairro,
    required super.uf,
    required super.estado,
    required super.localidade,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: json['cep'] ?? '',
      logadouro: json['logradouro'] ?? '',
      bairro: json['bairro'] ?? '',
      uf: json['uf'] ?? '',
      estado: json['estado'] ?? '',
      localidade: json['localidade'] ?? '',
    );
  }
}
