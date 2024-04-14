import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/res/text_styles.dart';
import 'package:islamic_app/core/resources/app_assets.dart';
import 'package:islamic_app/core/utils/showToast.dart';
import 'package:islamic_app/injection.dart';
import 'package:islamic_app/presentation/component/inputs/new/customTextFormField.dart';
import '../../../../core/res/theme/value_manager.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/locale_keys.g.dart';
import '../../component/animation/list_animator.dart';
import '../../component/buttons/custom_button.dart';
import '../../component/custom_scaffold.dart';
import '../../component/inputs/new/customTextFormFieldPassword.dart';
import '../../component/spaces.dart';
import '../auth_view_model.dart';

AuthViewModel provider=getIt();
class Register extends StatefulWidget {
  const Register({Key? key}): super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
    provider.passwordRegisterController.text='';
    provider.nameController.text='';
    provider.emailRegisterController.text='';
    provider.phoneController.text='';
  }

  final _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (provider.nameController.text.isEmpty) {
          ToastUtils.showToast('الاسم مطلوب');
        } else if (provider.emailRegisterController.text.isEmpty) {
          ToastUtils.showToast(LocaleKeys.emailRequired.tr());
        }else if (provider.phoneController.text.isEmpty) {
          ToastUtils.showToast("الهاتف مطلوب");
        }else if (provider.passwordRegisterController.text.isEmpty) {
          ToastUtils.showToast(LocaleKeys.passwordRequired.tr());
        } else if (provider.passwordRegisterController.text.length < 6) {
          ToastUtils.showToast('يجب الا يقل عن 6 احرف');
        }else {
          Provider.of<AuthViewModel>(context, listen: false).register(context);
        }
      }
    }
  }

  ValueNotifier userCredential = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<AuthViewModel>().isLoading;

    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ListAnimator(
              children: [
                isKeyboard?SizedBox():  Image.asset(
                  Assets.loginLogo,
                  height: 188.h,
                  width: 292.w,
                ),
                VerticalSpace(AppSize.s8.h),
                _buildForm(),
                SizedBox(height: 0.h,),
                CustomButton(
                  title: LocaleKeys.register.tr(),
                  loading: isLoading,
                  onTap: (){
                    _onSubmit(context);
                  },),
              ],
            ),
            // if (!isKeyboard)
            //   Align(
            //     alignment: Alignment.bottomLeft,
            //     child: SVGIcon(
            //       Assets.homeSelect,
            //       width:200.w,
            //       height: 200.h,
            //     ),
            //   )
          ],
        ),
      ),
    );
  }

  _buildForm() {
    return Form(
      key: _formKey,
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الاسم',
                style:  TextStyle()
                    .titleStyle(fontSize: 14.sp)
                    .customColor(AppColors.black),
              ),
              SizedBox(height: 5.h,),
              CustomTextFormFiled(
                backGroundColor: AppColors.white,
                // validationMSG:Provider.of<AuthViewModel>(context, listen: true).validationMSG,
                hintText: '',
                paddingHorizontal: 10.w,
                textInputType: TextInputType.text,
                controller: provider.nameController,
                borderColor: AppColors.grayLight,
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               'البريد الالكتروني',
                style:  TextStyle()
                    .titleStyle(fontSize: 14.sp)
                    .customColor(AppColors.black),
              ),
              SizedBox(height: 5.h,),
              CustomTextFormFiled(
                backGroundColor: AppColors.white,
                // validationMSG:Provider.of<AuthViewModel>(context, listen: true).validationMSG,
                hintText: '',
                paddingHorizontal: 10.w,
                textInputType: TextInputType.emailAddress,
                controller: provider.emailRegisterController,
                borderColor: AppColors.grayLight,
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الهاتف',
                style:  TextStyle()
                    .titleStyle(fontSize: 14.sp)
                    .customColor(AppColors.black),
              ),
              SizedBox(height: 5.h,),
              CustomTextFormFiled(
                backGroundColor: AppColors.white,
                // validationMSG:Provider.of<AuthViewModel>(context, listen: true).validationMSG,
                hintText: '',
                paddingHorizontal: 10.w,
                textInputType: TextInputType.phone,
                controller: provider.phoneController,
                borderColor: AppColors.grayLight,
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.password.tr(),
                style:  TextStyle()
                    .titleStyle(fontSize: 14.sp)
                    .customColor(AppColors.black),
              ),
              SizedBox(height: 5.h,),
              CustomTextFormFiledPassword(
                backGroundColor: AppColors.white,
                // validationMSG:Provider.of<AuthViewModel>(context, listen: true).validationMSG,
                hintText: '',
                textInputType: TextInputType.text,
                controller: provider.passwordRegisterController,
                borderColor: AppColors.grayLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}