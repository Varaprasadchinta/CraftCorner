import 'package:craft_corner/screens/artisians/models/artisans.dart';
import 'package:craft_corner/screens/artisians/services/artisan_auth.dart';
import 'package:flutter/material.dart';

class ArtianProvider with ChangeNotifier{
  ArtisanDetails? _artisan;
  final Authentication _authentication = Authentication();

  ArtisanDetails? get getArtisan => _artisan;
  Future<void> refresherArtisan() async {
    ArtisanDetails user = await _authentication.getArtisanDetails();
    _artisan = user;
    notifyListeners();
  }
}