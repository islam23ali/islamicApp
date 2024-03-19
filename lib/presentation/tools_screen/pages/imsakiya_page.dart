import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/app_assets.dart';
import 'package:islamic_app/presentation/component/component.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/locale_keys.g.dart';

class ImsakiyaPage extends StatefulWidget {
  const ImsakiyaPage({Key? key}) : super(key: key);

  @override
  _ImsakiyaPageState createState() => _ImsakiyaPageState();
}

class _ImsakiyaPageState extends State<ImsakiyaPage> {
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
    body: Padding(padding: EdgeInsets.all(16.r),child: AppNetworkImage(imageUrl: Assets.imsakiya,),),);
  }
}
