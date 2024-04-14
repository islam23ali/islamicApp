import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:islamic_app/presentation/auth/register/register.dart';
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
        if (provider.emailController.text.isEmpty) {
          ToastUtils.showToast(LocaleKeys.emailRequired.tr());
        } else if (provider.passwordController.text.isEmpty) {
          ToastUtils.showToast(LocaleKeys.passwordRequired.tr());
        } else if (provider.passwordController.text.length < 6) {
          ToastUtils.showToast('يجب الا يقل عن 6 احرف');
        }else {
           Provider.of<AuthViewModel>(context, listen: false)
              .login(context);
        }
      }
    }
  }

  ValueNotifier userCredential = ValueNotifier('');


  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<AuthViewModel>().isLoading;
    bool isSocialLoading = context.watch<AuthViewModel>().isSocialLoading;

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
                VerticalSpace(AppSize.s36.h),
                CustomButton(
                  loading: isSocialLoading,
                  loadColor: AppColors.primaryColor,
                  onTap: () async {
                  userCredential.value = await signInWithGoogle();
                  if (userCredential.value != null){
                    print("fffffffffffff");
                    print(userCredential.value.user!.email);
                    print(userCredential.value.user!.displayName);
                    Provider.of<AuthViewModel>(context, listen: false).loginSocial(context,userCredential.value.user!.email);
                  }else{
                    print("7777777777777");

                  }

                },
                  title: LocaleKeys.registerGoogleAccount.tr(),textColor: AppColors.black,
                  color: AppColors.white,borderColor: AppColors.grayLight,icon: Assets.google,),
                VerticalSpace(AppSize.s8.h),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(width:85.w,height: .5.h,color: AppColors.gray,),
                    Text(
                      LocaleKeys.orRegistrationEmail.tr(),
                      style: TextStyles()
                          .getRegularStyle(fontSize: 15.sp)
                          .customColor(AppColors.gray),
                    ),
                    Container(width: 85.w,height: .5.h,color: AppColors.gray,),
                ],),
                VerticalSpace(AppSize.s8.h),
                _buildForm(),
                SizedBox(height: 0.h,),
                CustomButton(
                  title: LocaleKeys.signIn.tr(),
                  loading: isLoading,
                  onTap: (){
                  _onSubmit(context);
                },),
                VerticalSpace(AppSize.s8.h),
                Center(
                  child: InkWell(onTap: (){
                    push(Register());
                  },
                    child: Text(
                      'او التسجيل',
                      style: TextStyles()
                          .getRegularStyle(fontSize: 15.sp)
                          .customColor(AppColors.primaryColor),
                    ),
                  ),
                ),
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
                LocaleKeys.emailPhone.tr(),
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
                controller: provider.emailController,
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
                controller: provider.passwordController,
                borderColor: AppColors.grayLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

}
