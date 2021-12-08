import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tomato_record_clone_coding/constant/data_keys.dart';
import 'package:flutter_tomato_record_clone_coding/data/user_model.dart';

class UserService {
  static final UserService _userService = UserService._internal();
  factory UserService() => _userService;
  UserService._internal();

  Future<UserModel> getUserModel(String userKey) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection(COL_USERS).doc(userKey);
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await documentReference.get();

    UserModel userModel = UserModel.fromSnapshot(documentSnapshot);
    return userModel;
  }

  Future createNewUser(Map<String, dynamic> json, String userKey) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection(COL_USERS).doc(userKey);
    final DocumentSnapshot snapshot = await documentReference.get();
    if (!snapshot.exists) {
      await documentReference.set(json);
    }
  }
}
