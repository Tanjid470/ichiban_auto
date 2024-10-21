import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/const/app_color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'backend/google_sheet_init.dart';
import 'const/dynamic_font.dart';
import 'module/splash/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GoogleSheetInit().inti();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        builder: FlutterSmartDialog.init(
          toastBuilder: (String msg) => Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Colors.red.shade300
              ),
              child: Text(msg,
                style:   TextStyle(
                  color: Colors.white,
                  fontSize: TextSize.font16(context),
                ),
              ),
            ),
          ),
          loadingBuilder: (String msg) => LoadingAnimationWidget.hexagonDots(
              color:AppColors.baseColorRed,
              size: 100
          ),
        ),
      );
    }
}


