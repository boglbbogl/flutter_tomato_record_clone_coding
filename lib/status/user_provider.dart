import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tomato_record_clone_coding/constant/shared_pref_keys.dart';
import 'package:flutter_tomato_record_clone_coding/data/user_model.dart';
import 'package:flutter_tomato_record_clone_coding/repo/user_service.dart';
import 'package:flutter_tomato_record_clone_coding/utils/logger.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    initUser();
  }
  User? _user;
  UserModel? _userModel;

  void initUser() {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      await setNewUser(user);
      notifyListeners();
    });
  }

  Future<void> setNewUser(User? user) async {
    _user = user;
    if (user != null || user!.phoneNumber != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String address = prefs.getString(SHARED_ADDRESS) ?? "";
      double lat = prefs.getDouble(SHARED_LAT) ?? 0;
      double lon = prefs.getDouble(SHARED_LON) ?? 0;
      String phoneNumber = user.phoneNumber!;
      String userKey = user.uid;
      UserModel userModel = UserModel(
        userKey: userKey,
        phoneNumber: phoneNumber,
        address: address,
        geoFirePoint: GeoFirePoint(lat, lon),
        createdDate: DateTime.now().toUtc(),
      );

      await UserService().createNewUser(userModel.toJson(), userKey);
      _userModel = await UserService().getUserModel(userKey);
      logger.d(_userModel!.toJson());
    }
  }

  User? get user => _user;
}
