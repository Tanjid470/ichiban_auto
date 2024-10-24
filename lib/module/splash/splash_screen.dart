
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ichiban_auto/const/app_color.dart';
import 'package:ichiban_auto/const/dynamic_font.dart';
import 'package:ichiban_auto/module/auth/view/login_form.dart';
import 'package:ichiban_auto/module/home/view/home_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
          splash: Text("Ichiban Auto",
            style: TextStyle(
                color: Colors.white,
                fontSize:TextSize.font30(context),
                fontWeight: FontWeight.w500 ),

          ),

          splashIconSize: 100,
          duration: 100,
          animationDuration: const Duration(seconds: 3),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor:AppColors.baseColorRed.withOpacity(.8),
          nextScreen: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              } else {
                return const LoginForm();
              }
            },
          ),
        )
    );
  }
}