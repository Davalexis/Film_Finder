import 'package:Film_Finder/constants/constants_files.dart';
import 'package:Film_Finder/views/Navigation_bar_view/screen/Nav_screen.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthLoginScreen extends StatelessWidget {
  const AuthLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final  textTheme = Theme.of(context).textTheme;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Text('Lets Login  into your \nAccont  ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                      color: Colors.white,
                      fontSize: 36)),
              SizedBox(height: 20),
              TextField(
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


              SizedBox(height: 15),


              TextField(
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


              SizedBox(height: 15),


              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                  spacing: 20,
                  children: [
                    Container(
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
              SizedBox(height: 15),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => NavScreen()));
                  },
                  child: Text(" Log in " , 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  )),

              SizedBox(height: 5)
            ],
          ),
        )
      ]),
    );
  }
}
