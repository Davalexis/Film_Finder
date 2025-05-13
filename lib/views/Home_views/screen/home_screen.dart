import 'package:Film_Finder/views/Home_views/widget/pageview_widget.dart';
import 'package:Film_Finder/views/Home_views/widget/topbar_widget.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,

        child: Stack(
            children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage(''),
                fit: BoxFit.fill,
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
                            Colors.black.withOpacity(0.7),
                            Colors.black,],
                             // Adjust these to control where the dark area starts
                            stops: [ 0.3, 0.6 , .9 ],
                            ),
                          ),
                        ),

                //APP BAR WIDGET
                TopbarWidget(),

                //BODY WIDGET
                PageviewWidget(),
              ]
            )
          )
        );
       } 
}
