
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/app_loader.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/presentation/component/component.dart';
import 'package:islamic_app/presentation/component/inputs/new/customTextFormField.dart';
import 'package:islamic_app/presentation/register_screen/register_screen_view_model.dart';
import 'package:islamic_app/presentation/register_screen/widget/top_appbar.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:provider/provider.dart';
import '../../core/res/text_styles.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../../injection.dart';
import '../component/svg_icon.dart';
RegisterScreenViewModel provider =getIt();
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
@override
  void initState() {
    super.initState();
    Provider.of<RegisterScreenViewModel>(context,listen: false).prayersAPI(context);
    Provider.of<RegisterScreenViewModel>(context,listen: false).getAllAssumptions(context);
    Provider.of<RegisterScreenViewModel>(context,listen: false).nextPrayAPI(context);
    provider.praysDateController.text='';
  }
Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),//DateFormat(provider.startDateController.text??'')
    // firstDate: (isStart)? DateTime.now():DateTime.,
    firstDate: DateTime(2022),
    lastDate: DateTime.now(),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          textTheme: TextTheme(titleLarge: TextStyles().getTitleStyle(),titleMedium: TextStyles().getDisplayMediumStyle(),titleSmall: TextStyles().getRegularStyle(),
            labelLarge: TextStyles().getTitleStyle(),labelMedium: TextStyles().getDisplayMediumStyle(),labelSmall: TextStyles().getRegularStyle(),
            bodyLarge: TextStyles().getTitleStyle(),bodySmall: TextStyles().getRegularStyle(),displayLarge: TextStyles().getTitleStyle(),displayMedium: TextStyles().getDisplayMediumStyle(),
            displaySmall: TextStyles().getRegularStyle(),headlineLarge: TextStyles().getTitleStyle(),
            headlineMedium: TextStyles().getDisplayMediumStyle(),headlineSmall: TextStyles().getRegularStyle()
          ),
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryColor,
          ),
        ),
        child: child!,
      );},
  );

  if (picked != null) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd', 'en');
    final String formattedDate = formatter.format(picked);

    setState(() {
      provider.praysDateController.text = formattedDate ;
      provider.prayersAPI(context);
      provider.getAllAssumptions(context);
    });
  }
}

  @override
  Widget build(BuildContext context) {
    final load =context.watch<RegisterScreenViewModel>().isLoading;
    return SafeArea(
      child:
        Consumer<RegisterScreenViewModel>(builder: (context, data, child) {
          final jHijri = JHijri(fDate: data.nextPrayerModel?.data?.date).hijri;
      return  RefreshIndicator(
        onRefresh: () async {
          Provider.of<RegisterScreenViewModel>(context,listen: false).prayersAPI(context);
          Provider.of<RegisterScreenViewModel>(context,listen: false).getAllAssumptions(context);
          Provider.of<RegisterScreenViewModel>(context,listen: false).nextPrayAPI(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(color: AppColors.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopAppBar(logo: Assets.praying, title: data.nextPrayerModel?.data?.title??'',
                   label: data.nextPrayerModel?.data?.text??'',
                   date:jHijri.toString() ??'',),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                    height: 91.h,
                    child:Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                            // width: 75.h,
                            child:Row(crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                          InkWell(onTap:(){
                            _selectDate(context);
                          },
                            child: SizedBox(width: 40.w,
                              child: Column(
                                children: [
                                  SVGIcon(Assets.expandLess,width: 24.w,height: 20.h,color: AppColors.white),
                                  SVGIcon(Assets.expandMore,width: 24.w,height: 20.h,color: AppColors.white,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          Text(
                            provider.praysDateController.text==''? LocaleKeys.today.tr():provider.praysDateController.text,
                            style: TextStyles()
                                .getDisplayMediumStyle(fontSize: 14.sp)
                                .customColor(AppColors.white),
                          ),
                                SizedBox(width:provider.praysDateController.text==''? 30.w:0,),
                        ],)),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            scrollDirection: Axis.horizontal,
                            itemCount: data.assumptionsModel?.data?.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                height: 61.h,width: 50.w,
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                  Text(
                                    data.assumptionsModel?.data?[index].title??'',
                                    style: TextStyles()
                                        .getDisplayMediumStyle(fontSize: 10.sp)
                                        .customColor(AppColors.white),
                                  ),
                                  SizedBox(height: 3.h,),
                                  AppNetworkImage(imageUrl:data.assumptionsModel?.data?[index].image??'',width: 30.w,height: 40.h,borderRadius: 4.r,),
                                ],),);

                            },
                          ),
                        ),
                      ],
                    ) ,)
                ],
              ),
            ),
            Expanded(
              child: (data.prayersModel?.data?.length==0)?NoDataScreen(): AnimationLimiter(
                child:ListView.builder(
                  // physics:const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
                    itemCount: data.prayersModel?.data?.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      String slug =data.prayersModel?.data?[index].slug??'';
                      return AnimationConfiguration.staggeredGrid(
                          duration:const Duration(milliseconds: 900),
                          position: index,
                          columnCount: 1,
                          child: ScaleAnimation(
                              duration:const Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(child:
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: Colors.grey.withOpacity(.07),),
                                padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                                margin: EdgeInsets.symmetric(vertical: 4.h),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        AppNetworkImage(
                                          imageUrl:data.prayersModel?.data?[index].image??'',width: 32.w,height: 32.h,borderRadius: 4.r,),
                                        SizedBox(width: 10.w,),
                                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                          SizedBox(width: 70.w,
                                            child: Text(data.prayersModel?.data?[index].title??'',
                                              style: TextStyles()
                                                  .getTitleStyle(fontSize: 14.sp)
                                                  .customColor(AppColors.black),
                                            ),
                                          ),
                                          Text(data.prayersModel?.data?[index].time??'',
                                            style: TextStyles()
                                                .getRegularStyle(fontSize: 10.sp)
                                                .customColor(AppColors.black),
                                          ),
                                        ],)
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Provider.of<RegisterScreenViewModel>(context,listen: false).makeAssumptions(context, data.prayersModel?.data?[index].id.toString(), data.assumptionsModel?.data?[0].slug).then((value) => data.prayersAPI(context));
                                      },
                                        child: Icon((data.prayersModel?.data?[index].group==1)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 25.r,color: (data.prayersModel?.data?[index].group==1)?AppColors.second:AppColors.gray,)
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Provider.of<RegisterScreenViewModel>(context,listen: false).makeAssumptions(context, data.prayersModel?.data?[index].id.toString(), data.assumptionsModel?.data?[1].slug).then((value) => data.prayersAPI(context));
                                      },
                                        child: Icon((data.prayersModel?.data?[index].individually==1)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 25.r,color: (data.prayersModel?.data?[index].individually==1)?AppColors.second:AppColors.gray,)
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Provider.of<RegisterScreenViewModel>(context,listen: false).makeAssumptions(context, data.prayersModel?.data?[index].id.toString(), data.assumptionsModel?.data?[2].slug).then((value) => data.prayersAPI(context));
                                      },
                                        child: Icon((data.prayersModel?.data?[index].late==1)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 25.r,color: (data.prayersModel?.data?[index].late==1)?AppColors.second:AppColors.gray,)
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Provider.of<RegisterScreenViewModel>(context,listen: false).makeAssumptions(context, data.prayersModel?.data?[index].id.toString(), data.assumptionsModel?.data?[3].slug).then((value) => data.prayersAPI(context));
                                      },
                                        child: Icon((data.prayersModel?.data?[index].nawafel==1)?Icons.check_box:Icons.check_box_outline_blank,size: 25.r,color: (data.prayersModel?.data?[index].nawafel==1)?AppColors.second:AppColors.gray,)
                                    ),
                                  ],),
                              )
                              )));
                    }),
              ),
            )
          ],
        ),
      );})
    );
  }
}
