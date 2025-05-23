import 'package:Film_Finder/views/Auth_View/screen/auth_login_screen.dart';
import 'package:Film_Finder/views/Navigation_bar_view/screen/Nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthCheckerScreen extends ConsumerWidget {
  const AuthCheckerScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return NavScreen();
    } else {
      return AuthLoginScreen();
    }
  }
}
