import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_muse/app/locator.dart';
import 'package:note_muse/services/state_services/user_service.dart';

class DatabaseService {
  //register new user
  static registerUser(
    String userId,
    String email,
    String username,
  ) {
    final _locator = locator<UserService>();
    FirebaseFirestore.instance.collection("users").add({
      "uid": userId,
      "username": username,
      "email": email,
    }).then((DocumentReference doc) {
      _locator.setUserDocId(doc.id);
      return true;
    }).catchError((_) {
      return false;
    });
  }

}
