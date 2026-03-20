import 'dart:convert';

import 'package:address_app/features/home/data/models/address_model.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesDatasource {
  final SharedPreferences sharedPreferences;

  FavoritesDatasource({
    required this.sharedPreferences,
  });

  Future<List<AddressEntity>> getFavorites() async {
    final favoriteStrings = sharedPreferences.getStringList('favorites') ?? [];
    return favoriteStrings.map((jsonString) {
      final jsonMap = jsonDecode(jsonString);
      return AddressModel.fromJson(jsonMap);
    }).toList();
  }

  Future<void> addFavorite(AddressEntity address) async {
    final favorites = await getFavorites();
    final jsonAddress = addressToJson(address);
    if (!favorites.any((fav) => addressToJson(fav) == jsonAddress)) {
      favorites.add(address);
      final jsonFavorites = favorites.map(addressToJson).toList();
      await sharedPreferences.setStringList('favorites', jsonFavorites);
    }
  }

  Future<void> removeFavorite(AddressEntity address) async {
    final favorites = await getFavorites();
    final jsonAddress = addressToJson(address);
    favorites.removeWhere((fav) => addressToJson(fav) == jsonAddress);
    final jsonFavorites = favorites.map(addressToJson).toList();
    await sharedPreferences.setStringList('favorites', jsonFavorites);
  }

  String addressToJson(AddressEntity address) {
    return jsonEncode(
      AddressModel(
        postalCode: address.postalCode,
        street: address.street,
        neighborhood: address.neighborhood,
        stateCode: address.stateCode,
        state: address.state,
        city: address.city,
      ).toJson(),
    );
  }
}
