import 'package:Film_Finder/controller/SignIn_with_google.dart';
import 'package:Film_Finder/controller/auth_Signup_controller.dart';
import 'package:Film_Finder/views/Home_views/screen/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Film_Finder/core/constants/constants_files.dart';
import 'package:Film_Finder/views/Auth_View/screen/auth_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthSignUpScreen extends ConsumerStatefulWidget {
  const AuthSignUpScreen({super.key});

  @override
  ConsumerState<AuthSignUpScreen> createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends ConsumerState<AuthSignUpScreen> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final createAccountState = ref.watch(CreateAccountControllerProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              // Adjust these to control where the dark area starts
              stops: [0.1, 0.5, 1.2],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Text("Let's Create an \nAccount  ",
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
                    value == null || value.isEmpty ? 'Enter Email' : null;
                    return null;
                  },
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.symmetric(
                        vertical: 18, horizontal: 20),
                    hintText: 'Enter your Email ',
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
                    value == null || value.length < 6
                        ? 'min 6 character'
                        : null;
                    return null;
                  },
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.symmetric(
                        vertical: 18, horizontal: 20),
                    hintText: 'Create Password',
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
                      'Already have an Account ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthLoginScreen()));
                        },
                        child: Text(
                          'Login',
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
                        onTap: () async {
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
                      Container(
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
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: createAccountState.isLoading
                      ? null
                      : () async {
                          if (!formkey.currentState!.validate()) return;

                          try {
                            await ref
                                .read(CreateAccountControllerProvider.notifier)
                                .createAccount(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );

                            if (context.mounted) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomeScreen()));
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),),

                  child: createAccountState.isLoading
                      ? CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(kPrimaryColor),
                        )
                      : Text('Sign up'),
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
