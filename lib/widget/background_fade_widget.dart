import 'package:flutter/material.dart';

class BackgroundFadeWidget extends StatelessWidget {
  const BackgroundFadeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image with gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
                Colors.black,
              ],
              stops: [0.3, 0.6, 0.9],
            ),
          ),
        ),
      ],
    );
  }
}
