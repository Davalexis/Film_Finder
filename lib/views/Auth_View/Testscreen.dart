
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:Film_Finder/views/Nav_screen.dart';

class Film_Finder extends StatelessWidget {
  const Film_Finder ({super.key});

  @override
  Widget build(BuildContext context) {

   //final  textTheme = Theme.of(context).textTheme;
    return Scaffold(
    
      body:Stack(

        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/Image/image2.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1),
                   BlendMode.darken) 
              ),
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
          stops: [ 0.1, 0.5 , 1.2 ], 
        ),
      ),
    ),


        Padding(
            padding:EdgeInsets.symmetric(horizontal: 24 , vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Spacer(),

                Text('Lets Get ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  color: Colors.white,
                  fontSize: 36)
                ) ,
                

                   const Text(
                    "Started",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2, // Line height
                    )
                    ),

                    SizedBox(height: 20),


                    ElevatedButton.icon(
                    onPressed: (){}, 
                    label: Text("Sign with Email"),
                    ),

                    SizedBox( height:15),

                    ElevatedButton.icon(
                      icon: FaIcon(FontAwesomeIcons.google,
                      size: 20,
                     ),
                    onPressed: (){}, 
                    label: Text("Continue with Google"),
                    ),

                      SizedBox( height: 15),

                    ElevatedButton.icon(
                      icon: FaIcon(FontAwesomeIcons.apple,
                      size: 20
                      ),
                      onPressed: (){}, 
                      label: Text("Continue with Apple"),
                    ),

                    SizedBox(height: 15),

                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavScreen()));
                      }, 
                      child: Text("Log in ")),
                      SizedBox( height: 5)
              ],
            ),
          )
        ]
      ),
    ); 
  }   
}