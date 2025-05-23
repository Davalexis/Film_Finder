import 'package:Film_Finder/controller/SignIn_with_google.dart';
import 'package:Film_Finder/controller/auth_Login_controller.dart';
import 'package:Film_Finder/views/Home_views/screen/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Film_Finder/constants/constants_files.dart';
import 'package:Film_Finder/views/Auth_View/screen/auth_signup_screen.dart';
import 'package:Film_Finder/views/Navigation_bar_view/screen/Nav_screen.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthLoginScreen extends ConsumerStatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  ConsumerState<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends ConsumerState<AuthLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(AuthLoginControllerProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
         Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Image/image2.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.darken)),
          ),
        ),
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



        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Text('Login  into your \nAccount  ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                        color: Colors.white,
                        fontSize: 36)),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    return  value == null || value.isEmpty ? 'Enter Email' : null;
                     
                  },
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.symmetric(
                        vertical: 18, horizontal: 20),
                    hintText: 'Email ',
                    hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    filled: true,
                    fillColor: kBackgroundColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    return  value == null || value.isEmpty ? 'Enter password' : null;
                    
                  },
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.symmetric(
                        vertical: 18, horizontal: 20),
                    hintText: ' Password',
                    hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    filled: true,
                    fillColor: kBackgroundColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'Dont have an Account ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthSignUpScreen()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 15,
                            color: kPrimaryColor,
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: Row(
                    spacing: 30,
                    children: [
                      GestureDetector(
                        onTap:  () async {
                          final userCredential =
                              await signInWithGoogle(context);
                          if (userCredential != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HomeScreen()));
                          }
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: kBackgroundColor),
                          child: Center(
                              child: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      GestureDetector(
                          child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kBackgroundColor),
                        child: Center(
                            child: FaIcon(
                          FontAwesomeIcons.apple,
                          color: Colors.white,
                        )),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {
                    //  ref.read(AuthLoginControllerProvider.notifier).login(
                    //       email: emailController.text,
                    //       password: passwordController.text,
                    //     );
                    //   if (authState.isLoading == false) {
                    //     Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (_) => NavScreen()));
                    //   }
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(15, 25, 30, 1),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: authState.isLoading
                      ? CircularProgressIndicator(
                          color: kPrimaryColor,
                          strokeWidth: 2,
                        )
                      : Text('Login'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
