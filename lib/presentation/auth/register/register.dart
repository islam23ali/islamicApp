// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:islamic_app/core/extensions/num_extensions.dart';
// import 'package:islamic_app/core/res/text_styles.dart';
// import 'package:islamic_app/core/resources/app_assets.dart';
// import 'package:islamic_app/core/routing/route.dart';
// import 'package:islamic_app/core/utils/showToast.dart';
// import 'package:islamic_app/injection.dart';
// import 'package:islamic_app/presentation/auth/register/widgets/location_widgets/city_button_sheet.dart';
// import 'package:islamic_app/presentation/auth/register/widgets/location_widgets/distract_button_sheet.dart';
// import 'package:islamic_app/presentation/auth/register/widgets/location_widgets/location_row_widget/city_row.dart';
// import 'package:islamic_app/presentation/auth/register/widgets/location_widgets/location_row_widget/distract_row.dart';
// import 'package:islamic_app/presentation/auth/register/widgets/location_widgets/location_row_widget/governorate_row.dart';
// import 'package:islamic_app/presentation/auth/register/widgets/location_widgets/state_button_sheet.dart';
// import 'package:islamic_app/presentation/auth/register/widgets/sex_type/sex_type_row.dart';
// import 'package:islamic_app/presentation/component/buttons/custom_button_app.dart';
// import 'package:islamic_app/presentation/component/inputs/new/customTextFormField.dart';
// import 'package:islamic_app/presentation/component/svg_icon.dart';
// import '../../../../core/res/theme/value_manager.dart';
// import '../../../../../core/resources/app_colors.dart';
// import '../../../../../core/resources/locale_keys.g.dart';
// import '../../component/animation/list_animator.dart';
// import '../../component/appbars/custom_app_bar.dart';
// import '../../component/custom_scaffold.dart';
// import '../../component/dialog/dialog_Done.dart';
// import '../../component/spaces.dart';
// import '../auth_view_model.dart';
//
// AuthViewModel provider=getIt();
// class Register extends StatefulWidget {
//   const Register({Key? key,  this.phone, this.phoneCode, required this.isEditProfile}): super(key: key);
//   final bool isEditProfile;
//   final String? phone;   ///    لو مش هاتحتاجهم شياهم
//   final String? phoneCode;
//
//   @override
//   State<Register> createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//
//
//
//
//   final _formKey = GlobalKey<FormState>();
//
//   void _onSubmit(context) async {
//     if (_formKey.currentState != null) {
//       if (_formKey.currentState!.validate()) {
//         _formKey.currentState!.save();
//         String firstName = provider.firstNameController.text;
//         String lastName = provider.lastNameController.text;
//         String email = provider.emailController.text;
//         String dateOfBirth = provider.dateOfBarthController.text;
//         if (firstName.isEmpty) {
//           ToastUtils.showToast(LocaleKeys.enterFirstName.tr());
//         } else if (lastName.isEmpty) {
//           ToastUtils.showToast(LocaleKeys.enterLastName.tr());
//         } else if (email.isEmpty) {
//           ToastUtils.showToast(LocaleKeys.emailRequired.tr());
//         }else if (!email.isValidEmail()) {
//           ToastUtils.showToast(LocaleKeys.checkEmail.tr());
//         }else if (dateOfBirth.isEmpty) {
//           ToastUtils.showToast(LocaleKeys.birthRequired.tr());
//         }else if (provider.isSexSelect==null) {
//           ToastUtils.showToast(LocaleKeys.genderRequired.tr());
//         }else if (provider.stateIndex==null) {
//           ToastUtils.showToast(LocaleKeys.chooseGovernorate.tr());
//         }else if (provider.cityIndex==null) {
//           ToastUtils.showToast(LocaleKeys.chooseCity.tr());
//         }else if (provider.areaIndex==null) {
//           ToastUtils.showToast(LocaleKeys.chooseRegion.tr());
//         } else {
//           Provider.of<AuthViewModel>(context,listen: false).register(context).then((value) =>
//           showDialog<String>(
//               context: context,
//               builder: (BuildContext context) => DialogDone(title:LocaleKeys.accountSuccessfullyCreated.tr(),)).then((value) => push(FavoriteSportsPage(fromSetting: false,)))
//           );
//         }
//       }
//     }
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1700),
//       lastDate: DateTime(2050),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: AppColors.primaryColor,
//             ),
//           ),
//           child: child!,
//         );},
//     );
//
//     if (picked != null) {
//       final DateFormat formatter = DateFormat('dd-MM-yyyy', 'en');
//       final String formattedDate = formatter.format(picked);
//
//       setState(() {
//         provider.dateOfBarthController.text = formattedDate;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('qqqqqqqq${ provider.dateOfBarthController.text}');
//     bool isLoading = context.watch<AuthViewModel>().isLoading;
//     // bool isClicked = Provider.of<AuthViewModel>(context, listen: true).isClicked;
//     return CustomScaffold(
//       appBar: CustomAppBar(
//           title:(widget.isEditProfile==true)?LocaleKeys.editAccount.tr(): tr(LocaleKeys.createAccount),
//           titleColor: AppColors.black,
//           color: AppColors.white),
//       body:  Padding(
//         padding: EdgeInsets.all(16.r),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListAnimator(
//                 children: [
//                   _buildForm(),
//                   VerticalSpace(AppSize.s8.h),
//                 ],
//               ),
//             ),
//             CustomButtonApp(
//               text:(widget.isEditProfile==true)?LocaleKeys.confirm.tr(): LocaleKeys.create.tr(),
//               onTap: (){
//                 _onSubmit(context);
//             },loading: isLoading,)
//           ],
//         ),
//       ),
//     );
//   }
//
//   _buildForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           _buildTitle(image: Assets.user, name:(widget.isEditProfile==true)?LocaleKeys.fullName.tr(): LocaleKeys.userName.tr()),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 width: 167.5.w,
//                 child: CustomTextFormFiled(
//                   paddingHorizontal: 10.w,
//                   hintText: LocaleKeys.firstName.tr(),
//                   controller: provider.firstNameController,
//                   borderColor: AppColors.grayLight,
//                 ),
//               ),
//               SizedBox(
//                 width: 167.5.w,
//                 child: CustomTextFormFiled(
//                   paddingHorizontal: 10.w,
//                   hintText: LocaleKeys.lastName.tr(),
//                   controller: provider.lastNameController,
//                   borderColor: AppColors.grayLight,
//                 ),
//               ),
//             ],
//           ),
//           (widget.isEditProfile==false)?SizedBox(): SizedBox(height: 16.h,),
//           (widget.isEditProfile==false)?SizedBox(): _buildTitle(image: Assets.phone, name: LocaleKeys.phoneNumber.tr()),
//           (widget.isEditProfile==false)?SizedBox():  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(width: 275.w,height: 60,
//                 child: CustomTextFormFiled(
//                   height: 22.h,
//                   readOnly: true,
//                   textAlign: TextAlign.end,
//                   paddingHorizontal: 10.w,
//                   hintText:'0xxxxxxxx',
//                   hintColor: AppColors.black,
//                   suffixText: '996+',
//                   textInputType: TextInputType.phone,
//                   // suffixWidget:Text(
//                   //   tr(LocaleKeys.bodyLogin),
//                   //   style: const TextStyle()
//                   //       .bodyStyle(fontSize: FontSize.s14.sp)
//                   //       .textColor(),
//                   // ) ,
//                   // icon: Assets.flag,
//                   backGroundColor: Colors.grey.shade400,
//                   borderColor: AppColors.grayLight,
//                   // controller: provider.phoneProfileController,
//                 ),
//               ),
//               Container(height: 60.h,width: 60.w,
//                 decoration: BoxDecoration(color: Colors.grey.shade400,borderRadius: BorderRadius.circular(12.r),border: Border.all(width: 1.w,color: AppColors.grayLight)),
//                 child:SVGIcon(Assets.flagSaudi) ,
//               )
//             ],
//           ),
//           SizedBox(height: 16.h,),
//           Row(crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//             _buildTitle(image: Assets.email, name: LocaleKeys.email.tr()),SizedBox(width: 5.w,),
//             (widget.isEditProfile==false)?SizedBox(): Text('( ${LocaleKeys.optional.tr()} )',style: TextStyles().getRegularStyle(fontSize: 12.sp).customColor(AppColors.gray),)
//           ],),
//           CustomTextFormFiled(
//             paddingHorizontal: 10.w,
//             textInputType: TextInputType.emailAddress,
//             controller: provider.emailController,
//             hintText: LocaleKeys.exampleEmail.tr(),borderColor: AppColors.grayLight,),
//           SizedBox(height: 16.h,),
//           _buildTitle(image: Assets.date, name: LocaleKeys.dateBirth.tr()),
//           CustomTextFormFiled(
//             readOnly: true,
//             onTap: (){
//               _selectDate(context);
//             },
//             paddingHorizontal: 10.w,image: Assets.date,
//             controller: provider.dateOfBarthController,
//             imageColor: AppColors.gray,
//             hintText: 'DD/MM/YYYY',borderColor: AppColors.grayLight,),
//           SizedBox(height: 16.h,),
//           _buildTitle(image: Assets.sexType, name: LocaleKeys.sex.tr()),
//           SexTypeRow(),
//           SizedBox(height: 16.h,),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 width: 167.5.w,
//                 child: Column(
//                   children: [
//                     _buildTitle(image: Assets.flagSvg, name: LocaleKeys.governorate.tr()),
//                     GovernorateRow()
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 167.5.w,
//                 child: Column(
//                   children: [
//                     _buildTitle(image: Assets.city, name: LocaleKeys.city.tr()),
//                     CityRow()
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16.h,),
//           _buildTitle(image: Assets.distract, name: LocaleKeys.district.tr()),
//           DistractRow()
//         ],
//       ),
//
//     );
//   }
//  _buildTitle({required String image,required String name}){
//    return
//     Column(
//       children: [
//         Row(children: [
//           SVGIcon(image,width: 20.w,height: 20.h,),
//           SizedBox(width: 5.w,),
//           Text(name,style: TextStyles().getRegularStyle(fontSize: 14.sp).customColor(AppColors.black),)
//         ],),
//         SizedBox(height: 10.h,),
//       ],
//     );
//   }
// }
// Future<dynamic> showAddStateSheet(BuildContext context) async {
//   return showModalBottomSheet(
//     // expand: false,
//     context: context,
//     backgroundColor: Colors.transparent,
//     builder: (context) =>  SafeArea(child: AddStateButtonSheet()),
//   );
// }
// Future<dynamic> showAddCitySheet(BuildContext context) async {
//   return showModalBottomSheet(
//     // expand: false,
//     context: context,
//     backgroundColor: Colors.transparent,
//     builder: (context) =>  SafeArea(child: AddCityButtonSheet()),
//   );
// }
// Future<dynamic> showAddDistractSheet(BuildContext context) async {
//   return showModalBottomSheet(
//     // expand: false,
//     context: context,
//     backgroundColor: Colors.transparent,
//     builder: (context) =>  SafeArea(child: AddDistractButtonSheet()),
//   );
// }