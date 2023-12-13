import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_muse/app/locator.dart';
import 'package:note_muse/models/user.dart';
import 'package:note_muse/services/authentication_service.dart';
import 'package:note_muse/services/state_services/user_service.dart';

class AuthState {
  var error = "";
  var sucess = false;
  var loading = false;

  AuthState copyWith({var error, var sucess, var loading}) {
    return AuthState()
      ..error = error ?? this.error
      ..sucess = sucess ?? this.sucess
      ..loading = loading ?? this.loading;
  }
}

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider() : super(AuthState());
  var service = Authentication();

  Future<bool> registerNewUser(
      String email, String password, String username) async {
    _setState(state.copyWith(loading: true));
    var response = await service.register(email, password, username);
    _setState(
      state.copyWith(
          loading: false,
          error: response["message"],
          sucess: response["success"] == "true"),
    );
    return state.sucess;
  }
  final _locator = locator<UserService>();

  Future<bool> signIn(String email, String password) async {
    _setState(state.copyWith(loading: true));
    //pass the data to the backend for validation
    var response = await service.singin(email, password);
    _setState(
      state.copyWith(
          loading: false,
          error: response["message"],
          sucess: response["success"] == "true"),
    );
    if(state.sucess){
      //fetch user data.
      String docid =_locator.userDocId;
      var userInfo=await service.getUserInfo(docid);

      var user = UserModel.fromMap(userInfo);
      _locator.setUserInfo(user);
    }
    return state.sucess;
  }

  _setState(AuthState newState) {
    state = newState;
  }

  static final provider = StateNotifierProvider<AuthProvider, AuthState>(
    (ref) => AuthProvider(),
  );
}
