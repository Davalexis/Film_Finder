import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void CheckOnBoardingStatus(context) async{
 final prefs = await SharedPreferences.getInstance();
 final completed = prefs.getBool("onboarding completed") ?? false;

 if (completed){
  Navigator.pushReplacementNamed(context, 'AuthSignUpScreen');
 }else { 
  Navigator.pushReplacementNamed(context, 'OnboardingScreen');
 }

}