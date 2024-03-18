import 'package:craft_corner/models/users.dart';
import 'package:craft_corner/services/auth.dart';
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier{
  UserDetails? _user;
  final Authentication _authentication = Authentication();

  UserDetails? get getUser => _user;
  Future<void> refresherUser() async {
    UserDetails user = await _authentication.getUserDetails();
    _user = user;
    notifyListeners();
  }
}