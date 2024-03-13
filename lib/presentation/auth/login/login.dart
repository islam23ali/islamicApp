import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/routing/route.dart';
import 'package:islamic_app/core/utils/showToast.dart';
import 'package:islamic_app/injection.dart';
import 'package:islamic_app/presentation/component/buttons/custom_button.dart';
import 'package:islamic_app/presentation/component/inputs/new/customTextFormField.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/locale_keys.g.dart';
import '../../../../core/resources/values_manager.dart';
import '../../component/animation/list_animator.dart';
import '../../component/appbars/custom_app_bar.dart';
import '../../component/custom_scaffold.dart';
import '../../component/inputs/new/customTextFormFieldPassword.dart';
import '../../component/spaces.dart';
import '../../component/svg_icon.dart';
import '../auth_view_model.dart';

AuthViewModel provider=getIt();
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (provider.userNameController.text.isEmpty) {
          ToastUtils.showToast('LocaleKeys.usernameRequired.tr()');
        } else if (provider.passwordController.text.isEmpty) {
          ToastUtils.showToast('LocaleKeys.passwordRequired.tr()');
        // } else if (provider.passwordController.text.length < 7) {
        //   ToastUtils.showToast('يجب الا يغل عن 7 احرف');
        }else {
           Provider.of<AuthViewModel>(context, listen: false)
              .login(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<AuthViewModel>().isLoading;

    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return CustomScaffold(appBar:CustomAppBar(isBackButtonExist: false,) ,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: AppSize.s16.w, left: AppSize.s16.w, bottom: AppSize.s8.h),
            child: ListAnimator(
              children: [
                SVGIcon(
                  Assets.backgroundPoint,
                  height: 64.h,
                  width: 220.w,
                ),
                VerticalSpace(AppSize.s36.h),
                Text(
                  'tr(LocaleKeys.heyYou)',
                  style: const TextStyle()
                      .titleStyle(fontSize: FontSize.s28.sp)
                      .textColor(),
                ),
                Text(
                  'tr(LocaleKeys.enterYourRegistered)',
                  style:  TextStyle()
                      .bodyStyle(fontSize: 14.sp)
                      .customColor(AppColors.textColor),
                ),
                VerticalSpace(AppSize.s24.h),
                _buildForm(),
                SizedBox(height: 0.h,),
                CustomButton(
                  title: 'LocaleKeys.login.tr()',
                  loading: isLoading,
                  onTap: (){
                  _onSubmit(context);
                },),
              ],
            ),
          ),
          if (!isKeyboard)
            Align(
              alignment: Alignment.bottomLeft,
              child: SVGIcon(
                Assets.homeSelect,
                width:200.w,
                height: 200.h,
              ),
            )
        ],
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
                'tr(LocaleKeys.userName)',
                style:  TextStyle()
                    .titleStyle(fontSize: 14.sp)
                    .customColor(AppColors.black),
              ),
              SizedBox(height: 5.h,),
              CustomTextFormFiled(
                validationMSG:Provider.of<AuthViewModel>(context, listen: true).validationMSG,
                hintText: 'LocaleKeys.userName.tr()',
                paddingHorizontal: 10.w,
                textInputType: TextInputType.text,
                controller: provider.userNameController,
                borderColor: AppColors.grayLight,
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'tr(LocaleKeys.password)',
                style:  TextStyle()
                    .titleStyle(fontSize: 14.sp)
                    .customColor(AppColors.black),
              ),
              SizedBox(height: 5.h,),
              CustomTextFormFiledPassword(
                validationMSG:Provider.of<AuthViewModel>(context, listen: true).validationMSG,
                hintText: '*********',
                textInputType: TextInputType.text,
                controller: provider.passwordController,
                borderColor: AppColors.grayLight,
              ),
            ],
          ),
        ],
      ),
    );
  }


}
