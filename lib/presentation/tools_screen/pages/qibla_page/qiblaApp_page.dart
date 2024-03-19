import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/app_assets.dart';
import 'package:islamic_app/presentation/component/component.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/locale_keys.g.dart';

class QiblahAppPage extends StatefulWidget {
  const QiblahAppPage({Key? key}) : super(key: key);

  @override
  State<QiblahAppPage> createState() => _QiblahAppPageState();
}

class _QiblahAppPageState extends State<QiblahAppPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _begin = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 0.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.qibla),
            fit: BoxFit.fill,
          ),
        ),
        child: CustomScaffold(
          appBar: CustomAppBar(
            topColor: AppColors.primaryColor,
            topColorIcon: Brightness.light,
            titleColor: AppColors.white,
            color: AppColors.primaryColor,
            title: LocaleKeys.qibla.tr(),
            isBackButtonExist: false,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Icon(
                    Icons.keyboard_arrow_left_rounded,
                    color: AppColors.white,
                    size: 26.r,
                  ),
                ),
              )
            ],
          ),
          body: StreamBuilder<QiblahDirection>(
            stream: FlutterQiblah.qiblahStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Color(0xff87854f),
                  ),
                );
              }
              if (!snapshot.hasData) {
                final qiblahDirection = snapshot.data!;
                _animation = Tween(
                  begin: _begin,
                  end: (qiblahDirection.qiblah * (pi / 180) * -1),
                ).animate(_animationController);
                _begin = (qiblahDirection.qiblah * (pi / 180) * -1);
                _animationController.forward(from: 0);
                return Center(
                  child: SizedBox(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _animation.value,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Image.asset(Assets.qibla),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Transform.rotate(
                    angle: _animation.value,
                    child: Padding(
                    padding: const EdgeInsets.all(30.0),
              child: Image.asset(Assets.quraan),
              )); // Replace with the desired placeholder widget
              }
            },
          ),
        ),
      ),
    );
  }
}