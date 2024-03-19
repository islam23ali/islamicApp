import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/app_assets.dart';
import 'package:islamic_app/presentation/component/animation/column_animator.dart';
import 'package:islamic_app/presentation/component/svg_icon.dart';
import 'package:islamic_app/presentation/component/custom_circle_pant.dart';

import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../component/appbars/custom_app_bar.dart';
import '../../../component/custom_scaffold.dart';
import '../../../home_screen/home_screen.dart';

class RosaryChildPage extends StatefulWidget {
  const RosaryChildPage({Key? key}) : super(key: key);

  @override
  _RosaryChildPageState createState() => _RosaryChildPageState();
}

class _RosaryChildPageState extends State<RosaryChildPage> {
  int number=0;
  double status=0.0;
  void increaseNumber() {
    setState(() {
      number++;
      if (status < 1.0) {
        status += 0.1;
      }else{
        setState(() {
          status=0.1;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(

      appBar: CustomAppBar(
        topColor: AppColors.primaryColor,
        topColorIcon: Brightness.light,
        titleColor: AppColors.white,
        color: AppColors.primaryColor,
        title: LocaleKeys.rosary.tr(),
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
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: ColumnAnimator(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text('اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ .',
            style: TextStyles()
                .getDisplayMediumStyle(fontSize: 18.sp)
                .customColor(AppColors.black),
          ),
          SizedBox(height: 50.h,),
          // Spacer(),
          Stack(
            children: [
              SVGIcon(Assets.rosary,width:278.w,height: 278.h,),
              Positioned(top: 0,bottom: 0,left: 0,right: 0,
                  child: Center(
                    child: Stack(
                      children: [
                        // CustomPaint(
                        //     size: const Size(100, 100), // no effect while adding child
                        //     painter: CustomCircularPaint(
                        //       gradientColor: AppColors.primaryColor,
                        //       borderThickness: 5,
                        //       progressValue: status, //[0-1]
                        //     ),
                        //     child:
                    Container(
                              margin: EdgeInsets.all(5.r),
                                child: InkWell(
                                  onTap: (){
                                    increaseNumber();
                                  },
                                    child: SVGIcon(Assets.rosaryButton,width: 98.w,height: 98.h,))
                  // )
                        ),
                        Positioned(left: 0,right: 0,bottom: 0,top: 0,
                          child: Center(
                            child: InkWell(onTap: (){
                              increaseNumber();           ///   ليها لازمه علشان تلغي ال activation بتاع ال text من غيرها ال onTap تعلق
                            },
                              child: Text('$number',
                                style: TextStyles()
                                    .getTitleStyle(fontSize: 24.sp)
                                    .customColor(AppColors.white),
                              ),
                            ),
                          ),)
                      ],
                    ),
                  ))
            ],
          )
        ],),
      ),
    );
  }
}
