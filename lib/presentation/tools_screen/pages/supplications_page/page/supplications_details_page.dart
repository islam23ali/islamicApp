import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/helper/no_data.dart';
import 'package:islamic_app/presentation/component/svg_icon.dart';
import 'package:islamic_app/presentation/tools_screen/tools_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../core/app_loader.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/locale_keys.g.dart';
import '../../../../component/appbars/custom_app_bar.dart';
import '../../../../component/custom_scaffold.dart';

class SupplicationsDetailsPage extends StatefulWidget {
  const SupplicationsDetailsPage({Key? key, required this.supplicationId,required this.name}) : super(key: key);
  final String? supplicationId;
  final String? name;

  @override
  _SupplicationsDetailsPageState createState() => _SupplicationsDetailsPageState();
}

class _SupplicationsDetailsPageState extends State<SupplicationsDetailsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ToolsViewModel>(context,listen: false).getAllSupplicationDetailsAPI(context, widget.supplicationId??'');
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(
      topColor: AppColors.primaryColor,
      topColorIcon: Brightness.light,
      titleColor: AppColors.white,
      color: AppColors.primaryColor,title: widget.name??'',isBackButtonExist: false,
      actions: [InkWell(onTap: (){
        Navigator.pop(context);
      },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w),
          child: Icon(Icons.keyboard_arrow_left_rounded,color: AppColors.white,size: 26.r,),
        ),
      )],),
      body:  Consumer<ToolsViewModel>(builder: (context, data, child) {
    return data.isLoading?AppLoader(): Padding(
        padding: EdgeInsets.all(12.r),
        child: (data.supplicationsDetailsModel?.data?.length==0)?NoDataScreen(): AnimationLimiter(
          child:ListView.builder(
              itemCount: data.supplicationsDetailsModel?.data?.length,
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
                        Column(
                          children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Icon(Icons.control_camera_outlined,size: 10.r,color: AppColors.primaryColor,),
                                SizedBox(width: 5.h,),
                                SizedBox(width: MediaQuery.of(context).size.width-50,
                                  child: Text(data.supplicationsDetailsModel?.data?[index].text??'',
                                    style: TextStyles()
                                        .getRegularStyle(fontSize: 16.sp)
                                        .customColor(AppColors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h,)
                          ],
                        ),
                        )));
              }),
        ),
      );}) ,);
  }
}
