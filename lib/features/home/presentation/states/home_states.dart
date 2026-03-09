import 'package:address_app/features/home/domain/entities/address_entity.dart';

sealed class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeLoadedState extends HomeStates {
  final AddressEntity address;

  HomeLoadedState({
    required this.address,
  });
}

class HomeErrorState extends HomeStates {
  final String message;

  HomeErrorState({
    required this.message,
  });
}
