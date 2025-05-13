import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handleStartupLogic();
  }

  Future<void> _handleStartupLogic() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate splash time

    final prefs = await SharedPreferences.getInstance();
    final hasCompletedOnboarding =
        prefs.getBool('onboarding_completed') ?? false;

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User already logged in
      Navigator.pushReplacementNamed(context, '/home');
    } else if (hasCompletedOnboarding) {
      // Show login screen
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      // First time user
      Navigator.pushReplacementNamed(context, '/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Image/image2.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.darken)),
        ),
      ),

      // Gradient overlay to darken bottom only
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.9),
              Colors.black,
            ],
            stops: [0.1, 0.5, 1.2],
          ),
        ),
      ),

      Center(child: CircularProgressIndicator(color: Colors.white)),
    ]));
  }
}
