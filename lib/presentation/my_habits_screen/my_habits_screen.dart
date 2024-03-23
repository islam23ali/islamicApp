import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/app_loader.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/helper/no_data.dart';
import 'package:islamic_app/presentation/my_habits_screen/my_habits_screen_view_model.dart';
import 'package:islamic_app/presentation/my_habits_screen/widget/select_habits_appBar.dart';
import 'package:islamic_app/presentation/register_screen/widget/top_appbar.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:provider/provider.dart';
import '../../core/res/text_styles.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../component/images/network_image.dart';

class MyHabitsScreen extends StatefulWidget {
  const MyHabitsScreen({Key? key}) : super(key: key);

  @override
  _MyHabitsScreenState createState() => _MyHabitsScreenState();
}

class _MyHabitsScreenState extends State<MyHabitsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HabitsScreenViewModel>(context,listen: false).getAllHabitsAPI(context);
  }


  @override
  Widget build(BuildContext context) {
    final load=context.watch<HabitsScreenViewModel>().isLoading;
    return SafeArea(child:
        Consumer<HabitsScreenViewModel>(builder: (context, data, child) {
          final jHijri = JHijri(fDate: data.habitsModel?.data?.date).hijri;
      return
        load?AppLoader(): Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(color: AppColors.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            TopAppBar(logo: Assets.habitsLogo,
              title: data.habitsModel?.data?.title??'',
             label: data.habitsModel?.data?.text??'',
             date: jHijri.toString(),),
              SelectHabitsAppBar()
          ],),
        ),
        Expanded(
          child: (data.habitsModel?.data?.goodDeeds?.length==0)?NoDataScreen(): AnimationLimiter(
            child:ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
                itemCount: data.habitsModel?.data?.goodDeeds?.length,
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
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    AppNetworkImage(imageUrl:data.habitsModel?.data?.goodDeeds?[index].image??'',width: 32.w,height: 32.h,borderRadius: 4.r,),
                                    SizedBox(width: 5.w,),
                                    SizedBox(width: 100.w,
                                      child: Text(data.habitsModel?.data?.goodDeeds?[index].title??'',
                                        style: TextStyles()
                                            .getTitleStyle(fontSize: 14.sp)
                                            .customColor(AppColors.black),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 10.w,),
                                InkWell(
                                    onTap: (){
                                      Provider.of<HabitsScreenViewModel>(context,listen: false).habitsPostAPI(context,'1',data.habitsModel?.data?.goodDeeds?[index].id.toString()??'');
                                      setState(() {

                                      });
                                    },
                                    child: Icon((data.habitsModel?.data?.goodDeeds?[index].isChecked==1)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 30.r,color: (data.habitsModel?.data?.goodDeeds?[index].isChecked==1)?AppColors.second:AppColors.gray,)
                                ),SizedBox(width: 35.w,),
                                InkWell(
                                    onTap: (){
                                      Provider.of<HabitsScreenViewModel>(context,listen: false).habitsPostAPI(context,'0',data.habitsModel?.data?.goodDeeds?[index].id.toString()??'');
                                      setState(() {

                                      });
                                    },
                                    child: Icon((data.habitsModel?.data?.goodDeeds?[index].isChecked==0)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 30.r,color: (data.habitsModel?.data?.goodDeeds?[index].isChecked==0)?AppColors.second:AppColors.gray,)
                                ),
                              ],),
                          )
                          )));
                }),
          ),
        )
      ],
    );}));
  }
}
