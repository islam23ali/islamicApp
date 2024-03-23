import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/app_assets.dart';
import 'package:islamic_app/presentation/component/component.dart';
import 'package:islamic_app/presentation/tools_screen/tools_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_loader.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/locale_keys.g.dart';

class ImsakiyaPage extends StatefulWidget {
  const ImsakiyaPage({Key? key}) : super(key: key);

  @override
  _ImsakiyaPageState createState() => _ImsakiyaPageState();
}

class _ImsakiyaPageState extends State<ImsakiyaPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ToolsViewModel>(context,listen: false).getImsakiaAPI(context);
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(
      topColor: AppColors.primaryColor,
      topColorIcon: Brightness.light,
      titleColor: AppColors.white,
      color: AppColors.primaryColor,title: LocaleKeys.imsakiya.tr(),isBackButtonExist: false,
      actions: [InkWell(onTap: (){
        Navigator.pop(context);
      },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w),
          child: Icon(Icons.keyboard_arrow_left_rounded,color: AppColors.white,size: 26.r,),
        ),
      )],),
    body: Consumer<ToolsViewModel>(builder: (context, data, child) {
    // final jHijri = JHijri(fDate: data.nextPrayerModel?.data?.date).hijri;
    return data.isLoading? AppLoader():
    Padding(padding: EdgeInsets.all(16.r),child: AppNetworkImage(imageUrl:data.imsakiaModel?.data?.ramadanSchedule??'',),);}),);
  }
}
