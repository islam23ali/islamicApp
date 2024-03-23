import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/routing/route.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../injection.dart';
import '../auth/login/login.dart';
import '../button_nav_bar/ButtonNavBar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SaveUserData sp =getIt();
  @override
  void initState() {
    super.initState();
    print("jhjhjhhhhtoken${sp.getUserData()?.data?.token}");
    Timer(const Duration(seconds: 3), () {
      if (sp.getUserData()?.data?.id !=null) {
        pushAndRemoveUntil(const BottomNavigationBarApp());
      }else{
      pushAndRemoveUntil(const Login());}
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.splash),
            fit: BoxFit.fill
          ),
        ),
      ),
    );
  }
}
