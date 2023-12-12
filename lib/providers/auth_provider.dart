import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_muse/services/authentication_service.dart';

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
      String email, String password, String phoneNumber) async {
    _setState(state.copyWith(loading: true));
    var response = await service.register(email, password, phoneNumber);
    _setState(
      state.copyWith(
          loading: false,
          error: response["message"],
          sucess: response["success"] == "true"),
    );
    return state.sucess;
  }

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
    return state.sucess;
  }

  _setState(AuthState newState) {
    state = newState;
  }

  static final provider = StateNotifierProvider<AuthProvider, AuthState>(
    (ref) => AuthProvider(),
  );
}
