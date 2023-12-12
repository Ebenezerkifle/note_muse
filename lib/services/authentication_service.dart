import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_muse/services/database_service.dart';

class Authentication {
  String error = '';

  // register

  Future<Map<String, String>> register(
      String email, String password, String phoneNumber) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //todo phoneNumber should be verified on this stage.
      await DatabaseService.registerUser(
          userCredential.user!.uid, email, phoneNumber);
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
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
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
}
