import 'package:note_muse/models/user.dart';

class UserService {
  var user;
  var userDocId = "";

  setUserDocId(String userDocId) {
    this.userDocId = userDocId;
  }

  setUserInfo(UserModel user) {
    this.user = user;
  }
}
