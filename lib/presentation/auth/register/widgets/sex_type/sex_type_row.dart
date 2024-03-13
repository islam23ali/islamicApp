// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:islamic_app/core/extensions/num_extensions.dart';
// import 'package:islamic_app/injection.dart';
// import 'package:islamic_app/presentation/auth/auth_view_model.dart';
//
// import '../../../../../../core/res/text_styles.dart';
// import '../../../../../../core/resources/app_assets.dart';
// import '../../../../../../core/resources/app_colors.dart';
// import '../../../../../../core/resources/locale_keys.g.dart';
// import '../../../../component/svg_icon.dart';
// AuthViewModel provider=getIt();
// class SexTypeRow extends StatefulWidget {
//   const SexTypeRow({Key? key}) : super(key: key);
//
//   @override
//   _SexTypeRowState createState() => _SexTypeRowState();
// }
//
// class _SexTypeRowState extends State<SexTypeRow> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         InkWell(onTap: (){
//           setState(() {
//             provider.isSexSelect=true;
//             provider.sexType='male';
//           });
//         },
//           child: SizedBox(
//             width: 167.5.w,
//             child: Container(
//               height: 56.h,
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),border: Border.all(width: 1.w,color:(provider.isSexSelect==true)?AppColors.primaryColor:AppColors.grayLight),color:(provider.isSexSelect==true)?AppColors.backgroundColor: AppColors.ofWhite),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SVGIcon(Assets.man),
//                   SizedBox(width: 10.w,),
//                   Text(LocaleKeys.male.tr(),style: TextStyles().getRegularStyle(fontSize: 14.sp).customColor((provider.isSexSelect==true)?AppColors.primaryColor:AppColors.black),)
//                 ],),
//             ),
//           ),
//         ),
//         InkWell(onTap: (){
//           setState(() {
//             provider.isSexSelect=false;
//             provider.sexType='female';
//           });
//         },
//           child: SizedBox(
//             width: 167.5.w,
//             child: Container(
//               height: 56.h,
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),border: Border.all(width: 1.w,color:(provider.isSexSelect==false)?AppColors.primaryColor: AppColors.grayLight),color:(provider.isSexSelect==false)?AppColors.backgroundColor: AppColors.ofWhite),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SVGIcon(Assets.wommen),
//                   SizedBox(width: 10.w,),
//                   Text(LocaleKeys.female.tr(),style: TextStyles().getRegularStyle(fontSize: 14.sp).customColor((provider.isSexSelect==false)?AppColors.primaryColor:AppColors.black),)
//                 ],),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
