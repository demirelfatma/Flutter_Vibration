import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration_appp/view/splash/view/splash_view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MyApp());
}

final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FutureBuilder(future: _initialization, builder: (context, snapshot){
        if(snapshot.hasError){
          return const Center(child: Text('Beklenmeyen Bir Hata Oluştu'));
        }else if(snapshot.hasData){
          return const SplashView();
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}