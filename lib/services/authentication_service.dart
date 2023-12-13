import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_muse/app/locator.dart';
import 'package:note_muse/services/database_service.dart';
import 'package:note_muse/services/state_services/user_service.dart';

class Authentication {
  String error = '';
  // register

  Future<Map<String, String>> register(
      String email, String password, String username) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //todo username should be verified on this stage.
      await DatabaseService.registerUser(
          userCredential.user!.uid, email, username);
      error = "The user is successfully registered!";

      return {"success": "true", "message": error};
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        error = 'The password provided is too weak.';
        return {"success": "false", "message": error};
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email.';
        return {"success": "false", "message": error};
      } else if (e.code == 'invalid-email') {
        error = 'The email address is badly formatted.';
        return {"success": "false", "message": error};
      }
      return {"success": "false", "message": e.toString()};
    } catch (e) {
      error = e.toString();
      return {"success": "false", "message": error};
    }
  }

  // login
  Future<Map<String, String>> singin(String email, String password) async {
    final _locator = locator<UserService>();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => _locator.setUserDocId(value.user!.uid));

      //DatabaseServices(uid: userCredential.user!.uid).updateUsersData(user);
      error = "Successfully logged in!";
      return {"success": "true", "message": error};
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_INVALID_EMAIL') {
        error = 'Invalid Email or Password';
        return {"success": "false", "message": error};
      } else if (e.code == 'ERROR_WRONG_PASSWORD') {
        error = 'Invalid Email or Password';
        return {"success": "false", "message": error};
      }
      error = "Invalid Email or Password";
      return {"success": "false", "message": error};
    } catch (e) {
      error = e.toString();
      return {"success": "false", "message": error};
    }
  }

  //get user info from users table
  getUserInfo(String uid) async {
    //Get docs from a collection reference
    var querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where('uid', isEqualTo: uid)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      dynamic userData = querySnapshot.docs.first.data();
      return userData;
    }
    return {};
  }
}
