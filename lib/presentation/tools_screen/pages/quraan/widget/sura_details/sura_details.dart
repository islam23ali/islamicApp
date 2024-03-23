import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/presentation/tools_screen/pages/quraan/widget/sura_details/sura_detailsProvider.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../component/appbars/custom_app_bar.dart';
import '../../../../../component/custom_scaffold.dart';
import '../../my_provider_quraan.dart';
import '../sura_model.dart';

class suraDetails extends StatelessWidget {
  static const String routename = "suraDetails";

  suraDetails({super.key});


  @override
  Widget build(BuildContext context) {
    var suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    var pro = Provider.of<MyProviderQuraan>(context);
    return ChangeNotifierProvider<suraDetailsProvider>(
      create: (context) =>suraDetailsProvider()..readsurafile(suraModel.index) ,
      builder: (context, child) {
        var provider =Provider.of<suraDetailsProvider>(context);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(pro.getbackgroundPath()), fit: BoxFit.fill),
          ),
          child: CustomScaffold(
            appBar: CustomAppBar(
              topColor: AppColors.primaryColor,
              topColorIcon: Brightness.light,
              titleColor: AppColors.white,
              color: AppColors.primaryColor,
              title: LocaleKeys.quraan.tr(),
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
            body: Container(
              padding: EdgeInsets.all(12.r),
              margin: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                  color: Color(0XFFFAEBD7).withOpacity(0.2),
                  // border: Border.all(color: Color(0XFFB7935F))
              ),
              child: Column(
                children: [
                  Container(width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                    margin: EdgeInsets.only(bottom: 15.h),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: Colors.blue.shade100),
                    child: Center(
                      child: Text(" ${LocaleKeys.surat.tr()} ${suraModel.name}",
                        // textDirection: TextDirection.rtl,
                        style: TextStyles()
                            .getDisplayMediumStyle(fontSize: 22.sp)
                            .customColor(AppColors.black),
                      ),
                    ),),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        // thickness: 1,
                        // endIndent: 50,
                        // indent: 50,
                        // color: Color(0XFFB7935F),
                      ),
                      itemBuilder: (context, index) {
                        return
                        Center(
                          child:
                          (index==0)? Text("${provider.verses[index]} ",
                          // textDirection: TextDirection.rtl,
                            style: TextStyles()
                                .getDisplayMediumStyle(fontSize: 22.sp)
                                .customColor(AppColors.black),
                          ):
                          Text("${provider.verses[index]} (${index})",
                          // textDirection: TextDirection.rtl,
                            style: TextStyles()
                                .getDisplayMediumStyle(fontSize: 18.sp)
                                .customColor(AppColors.black),
                          ),
                        );
                      },
                      itemCount: provider.verses.length,
                    ),
                  ),
                ],
              ),
    // Wrap(
    // spacing: 8.0,
    // children: data.items.map((item) {})
            ),
          ),
        );

      },
    );
  }


}
