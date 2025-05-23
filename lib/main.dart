import 'package:Film_Finder/firebase_options.dart';
import 'package:Film_Finder/views/Auth_View/screen/auth_checker_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FilmFinder',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor:
                  const Color.fromARGB(255, 157, 157, 157).withOpacity(0.9)),
          textTheme: GoogleFonts.inriaSansTextTheme(),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, // Text color
              backgroundColor:
                  const Color.fromARGB(255, 10, 20, 24), // Button background
              minimumSize: const Size(double.infinity, 50),
              // Full width, fixed height
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(
                    color: Colors.black,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    style: BorderStyle.solid,
                  )),
              textStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, // Text color for Log in
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          //SCAFFOLD BACKGROUNG COLOR
          scaffoldBackgroundColor:
              Color.fromARGB(255, 157, 157, 157).withOpacity(0.9),
        ),

  
        home: AuthCheckerScreen());
  }
}
