import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthLoginController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> LoginWithEmail(String email, String password) async {
    state = const AsyncLoading();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      state = AsyncError(e.message ?? 'Login Falied', StackTrace.current);
      rethrow;
    }
  }
}

final AuthLoginControllerProvider =
    AsyncNotifierProvider<AuthLoginController, void>(() => AuthLoginController());
