// import 'package:Film_Finder/views/Auth_View/screen/auth_login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _controller = PageController();

//   int _currentScreen = 0;

//   final List<Map<String, String>> _onboardingData = [
//     {
//       'image': 'assets/Image/Aladdin.jpeg',
//       'title': 'Unlimited Stories Await ',
//       'subtitle':
//           'dive into the world of blockbusters classics and hiddens gem all in one place '
//     },
//     {
//       'image':
//           'assets/Image/Couch, snacks, adventure flick tonight with her….jpeg',
//       'title': 'Tailored just for You',
//       'subtitle': "pick your favourite genre and actors - all in one place."
//     },
//     {
//       'image': 'assets/Image/ea4fb977-1520-43da-8b34-8b51b7f42ae3.jpeg',
//       'title': 'Stream. Save. Repeat. ',
//       'subtitle':
//           "watch online or offline. your movies, your rules - where you go "
//     }
//   ];

//   ///
//   void _onScreenChange(int index) {
//     setState(() {
//       _currentScreen = index;
//     });
//   }

//   ///
//   static const String onboardingKey = "onboarding_completed";

// void _onNextPressed() async {
//   final isLastPage = _currentScreen == _onboardingData.length - 1;

//   if (isLastPage) {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(onboardingKey, true);

//     if (!mounted) return;

//     // Replace with your routing mechanism if using GoRouter, AutoRoute, etc.
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => const  AuthLoginScreen()),
//     );
//   } else {
//     _controller.nextPage(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeIn,
//     );
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(children: [
//       Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage(_onboardingData[_currentScreen]['image']!),
//               fit: BoxFit.cover,
//               colorFilter: ColorFilter.mode(
//                   Colors.black.withOpacity(0.1), BlendMode.darken)),
//         ),
//       ),
//       Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.transparent,
//               Colors.black.withOpacity(0.9),
//               Colors.black,
//             ],
//             stops: [0.1, 0.5, 1.2],
//           ),
//         ),
//       ),

//       ///
//       PageView.builder(
//           controller: _controller,
//           itemCount: _onboardingData.length,
//           onPageChanged: _onScreenChange,
//           itemBuilder: (_, index) {
//             final data = _onboardingData[index];
//             return Padding(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Text(
//                       data['title']!,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(height: 40),
//                   Center(
//                     child: Text(
//                       data['subtitle']!,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(height: 120),
//                   ElevatedButton(
//                       onPressed: _onNextPressed,
//                       child: Center(
//                           child: Text(
//                         _currentScreen == _onboardingData.length - 1
//                             ? "Get Started"
//                             : "Next",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ))),
//                 ],
//               ),
//             );
//           }),
//     ]));
//   }
// }
