import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String postalCode;
  final String street;
  final String neighborhood;
  final String stateCode;
  final String state;
  final String city;

  const AddressEntity({
    required this.postalCode,
    required this.street,
    required this.neighborhood,
    required this.stateCode,
    required this.state,
    required this.city,
  });

  @override
  List<Object?> get props => [
    postalCode,
    street,
    neighborhood,
    stateCode,
    state,
    city,
  ];
}
