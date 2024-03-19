import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/presentation/component/svg_icon.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../component/appbars/custom_app_bar.dart';
import '../../../component/custom_scaffold.dart';

class SupplicationsPage extends StatefulWidget {
  const SupplicationsPage({Key? key}) : super(key: key);

  @override
  _SupplicationsPageState createState() => _SupplicationsPageState();
}

class _SupplicationsPageState extends State<SupplicationsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(
      topColor: AppColors.primaryColor,
      topColorIcon: Brightness.light,
      titleColor: AppColors.white,
      color: AppColors.primaryColor,title: LocaleKeys.supplications.tr(),isBackButtonExist: false,
      actions: [InkWell(onTap: (){
        Navigator.pop(context);
      },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w),
          child: Icon(Icons.keyboard_arrow_left_rounded,color: AppColors.white,size: 26.r,),
        ),
      )],),
      body:Padding(
        padding: EdgeInsets.all(12.r),
        child: AnimationLimiter(
          child:ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return AnimationConfiguration.staggeredGrid(
                    duration:const Duration(milliseconds: 900),
                    position: index,
                    columnCount: 1,
                    child: ScaleAnimation(
                        duration:const Duration(milliseconds: 1000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(child:
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Icon(Icons.control_camera_outlined,size: 10.r,color: AppColors.primaryColor,),
                            SizedBox(width: MediaQuery.of(context).size.width-50,
                              child: Text('bsdjsbasjkgfhjlrv gnioercjfoihrngihrjngvihsdrnbfwekalseksqw;lkedpoewhjfbuykrsjhcjfmpoqewnvj98gy45bv89y57yubvw8nrnqfjrw8ubht98reuhigjslcwfnrbajetvbrstuiobcungxriubecgjniostubjvitucbwnr79qcuwihndk',
                                style: TextStyles()
                                    .getRegularStyle(fontSize: 16.sp)
                                    .customColor(AppColors.black),
                              ),
                            ),
                          ],
                        ),
                        )));
              }),
        ),
      ) ,);
  }
}
