import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/routing/route.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../injection.dart';
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
        // Provider.of<AuthViewModel>(context,listen: false).updateFCMToken();
      //   if(sp.getUserData()?.data?.type=='store_keeper'){
      //     pushAndRemoveUntil(const HomeStoreKeeper());
      //   }else if(sp.getUserData()?.data?.type=='captain'){
      //     pushAndRemoveUntil(const DeliveryHome());
      //   }else if(sp.getUserData()?.data?.type=='site_supervisor'){
      //     pushAndRemoveUntil(const SiteSupervisorHome());
      //   }else if(sp.getUserData()?.data?.type=='quality_specialist'){
      //     pushAndRemoveUntil(const QualitySpecialistHome());
      //   }else if(sp.getUserData()?.data?.type=='association_supervisor'){
      //     pushAndRemoveUntil(const AssociationSupervisorHome());
      //   }else if(sp.getUserData()?.data?.type=='field_supervisor'){
      //     pushAndRemoveUntil(const HomeSupervisor());
      //   }else if(sp.getUserData()?.data?.type=='general_supervisor'){
      //     pushAndRemoveUntil(const HomeSupervisor());
      //   }else if(sp.getUserData()?.data?.type=='director_association'){
      //     pushAndRemoveUntil(const HomeDirector());
      //   }
      // }else{
      //   pushAndRemoveUntil(const Login());
      }
      // pushAndRemoveUntil(const Login());
      pushAndRemoveUntil(const BottomNavigationBarApp());
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
