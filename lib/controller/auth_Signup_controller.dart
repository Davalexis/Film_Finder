import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAccountController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}
  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    state = AsyncLoading();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email, 
            password: password
     );
    } on FirebaseAuthException catch (e) {
      state = AsyncError(e.message ?? 'Signup Failed', StackTrace.current);
      rethrow;
    }
  }
}

final CreateAccountControllerProvider =
    AsyncNotifierProvider<CreateAccountController, void>(
        () => CreateAccountController());
