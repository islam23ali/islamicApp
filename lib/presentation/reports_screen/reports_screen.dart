import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/app_loader.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/core/utils/showToast.dart';
import 'package:islamic_app/injection.dart';
import 'package:islamic_app/presentation/component/animation/column_animator.dart';
import 'package:islamic_app/presentation/component/buttons/custom_button.dart';
import 'package:islamic_app/presentation/reports_screen/reports_screen_view_model.dart';
import 'package:islamic_app/presentation/reports_screen/widget/from_date_calender.dart';
import 'package:islamic_app/presentation/reports_screen/widget/reports_card.dart';
import 'package:islamic_app/presentation/reports_screen/widget/to_date_calender.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:provider/provider.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../register_screen/widget/top_appbar.dart';
ReportsScreenViewModel provider =getIt();
class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
@override
  void initState() {
    super.initState();
    Provider.of<ReportsScreenViewModel>(context,listen: false).titlePageAPI(context,'reports');
    provider.toDateApiController.text='';
    provider.fromDateApiController.text='';
    provider.toDateController.text='';
    provider.fromDateController.text='';
    provider.showReport=false;
  }

  @override
  Widget build(BuildContext context) {
  final load =context.watch<ReportsScreenViewModel>().isReLoading;
  final loading =context.watch<ReportsScreenViewModel>().isLoading;
    return  Consumer<ReportsScreenViewModel>(builder: (context, data, child) {
      final jHijri = JHijri(fDate:data.titlePagesModel?.data?.date).hijri;
      return SafeArea(child:
      loading?AppLoader(): Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopAppBar(logo: Assets.reportsLogo, title:data.titlePagesModel?.data?.title??'',
                label: data.titlePagesModel?.data?.body??'',
                date: jHijri.toString(),),
              SizedBox(height: 30.h,)
          ],),
        ),
        Expanded(child:
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: ColumnAnimator(
            children: [
              FromDateCalender(),
              ToDateCalender(),
              CustomButton(
                loading: load,
                onTap: (){
                  (data.fromDateApiController.text=='')?
                  ToastUtils.showToast(LocaleKeys.startRequired.tr())
                  :(data.toDateApiController.text=='')?
                  ToastUtils.showToast(LocaleKeys.endRequired.tr()):
                Provider.of<ReportsScreenViewModel>(context,listen: false).reportsAPI(context)
                    .then((value) => setState(() {}));
              },title:(data.showReport==true)?LocaleKeys.hideReports.tr(): LocaleKeys.showReport.tr(),),
              (data.showReport==true)? ReportsCard(gradientColor1: AppColors.primaryColor,):SizedBox(),
          ],),
        ))
      ],
    ));});
  }
}

