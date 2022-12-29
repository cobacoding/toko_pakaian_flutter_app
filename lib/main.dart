import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toko_pakaian_flutter_app/users/authentication/login_screen.dart';
import 'package:toko_pakaian_flutter_app/users/fragments/dashboard_of_fragments.dart';
import 'package:toko_pakaian_flutter_app/users/userPreferences/user_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  GetMaterialApp dari install depedencies get di pubspec.yaml
    return GetMaterialApp(
      title: 'Toko Pakaian ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // Menampilak tampilan awal
      home: FutureBuilder(
        future: RememberUserPrefs.readUserInfo(),
        builder: (context, dataSnapShot)
        {
          if(dataSnapShot.data == null)
          {
            return LoginScreen();
          }
          else
          {
            return DashboardOfFragments();
          }
        },
      ),
    );
  }
}
