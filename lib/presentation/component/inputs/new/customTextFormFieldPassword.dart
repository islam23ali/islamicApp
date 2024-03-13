import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../svg_icon.dart';



class CustomTextFormFiledPassword extends StatefulWidget {
  final Widget? widget;
  final Widget? suffixData;
  final bool isDark;
  final bool? readOnly;
  final String ?image;
  final String ?defaultValue;
  final String? icon;
  final String? hintText;
  final String? validationMSG;
  final IconData? suffixIconData;
  // final String? validationMSG;
  final double? height;
  final double? borderWidth;
  final double? borderRadius;
  final Color? backGroundColor;
  final Color? borderColor;
  final Color? hintColor;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  const CustomTextFormFiledPassword({
    Key? key,
    this.widget,
    this.image,
    this.hintText,
    this.isDark = false,
    this.controller,
    this.textInputAction,
    this.textInputType, this.height, this.backGroundColor, this.borderColor, this.icon, this.hintColor, this.readOnly, this.validationMSG, this.borderWidth, this.borderRadius, this.defaultValue, this.suffixData, this.suffixIconData
  }) : super(key: key);

  @override
  State<CustomTextFormFiledPassword> createState() => _CustomTextFormFiledPasswordState();
}

class _CustomTextFormFiledPasswordState extends State<CustomTextFormFiledPassword> {
  bool _showPassword = true;
  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null && widget.controller != null) {
      widget.controller!.text = widget.defaultValue!;
    }else{
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(

          children: [
            Expanded(
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return widget.validationMSG;
                  }
                  return null;
                },
                // autovalidateMode:validationMSG ,
                // initialValue: validationMSG,
                readOnly: widget.readOnly == null ? false : true,
                autofocus: false,
                obscureText:_showPassword,
                decoration: InputDecoration(

                  contentPadding: EdgeInsets.symmetric(vertical: widget.height??20.h),
                  filled: true,
                  fillColor: widget.backGroundColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: widget.borderWidth??1, color:widget.borderColor??AppColors.primaryColor), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(widget.borderRadius??10),
                  ),
                  errorBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(
                        width:widget.borderWidth??1, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(widget.borderRadius??10),
                  ),
                  focusedBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(
                        width:widget.borderWidth??1, color: widget.borderColor??AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(widget.borderRadius??10),),
                  focusedErrorBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(
                        width:widget.borderWidth??1, color: widget.borderColor??AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(widget.borderRadius??10),),
                  // enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  // errorBorder: InputBorder.none,
                  focusColor:Colors.transparent ,
                  suffixIcon:widget.suffixData!= null ? Container(width: 50, alignment: Alignment.center, child: widget.suffixData,) :
                  (widget.suffixData ?? (widget.suffixIconData == null ? null : Icon(widget.suffixIconData, color: Theme.of(context).primaryColor,))) ??
                      IconButton(
                        icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off,color:widget.isDark?Theme.of(context).cardColor:Theme.of(context).primaryColor),
                        onPressed: () {
                          _togglePasswordVisibility();
                        },
                      ),
                  prefixIcon:widget.icon==null ?SizedBox(width: 0,height: 0,):SVGIcon(
                    widget.icon??'',
                    width: (20.w),
                    height: (20.h),
                  ),

                  //border: InputBorder.none,
                  hintText: widget.hintText?.tr(),
                  hintStyle: TextStyles()
                      .getRegularStyle(fontSize: 14.sp)
                      .customColor(widget.hintColor??AppColors.black),
                ),
                controller: widget.controller,
                textInputAction: widget.textInputAction,
                keyboardType: widget.textInputType ?? TextInputType.text,
                cursorColor: AppColors.primaryColor,
                style: TextStyle(
                    letterSpacing: 0.5, fontSize: 18.sp, color: AppColors.black),
                // validator: (value) {
                //   return null;
                // },
                onSaved: (newValue) {},
              ),
            ),

            Container(
              child: widget.widget,
            ),
          ],
        ),


      ],
    );
  }
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}

