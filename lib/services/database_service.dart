import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_muse/app/locator.dart';
import 'package:note_muse/services/state_services/user_service.dart';

class DatabaseService {
  //register new user
  static registerUser(
    String userId,
    String email,
    String phoneNumber,
  ) {
    final _locator = locator<UserService>();
    FirebaseFirestore.instance.collection("user").add({
      "uid": userId,
      "phoneNumber": phoneNumber,
      "email": email,
    }).then((DocumentReference doc) {
      _locator.setUserDocId(doc.id);
      return true;
    }).catchError((_) {
      return false;
    });
  }

}
