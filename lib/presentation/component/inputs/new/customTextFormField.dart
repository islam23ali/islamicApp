import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../svg_icon.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextFormFiled extends StatefulWidget {
  final Widget? widget;
  final bool? readOnly;
  final String? image;
  final String? defaultValue;
  final String? icon;
  final void Function()? iconOnTap;
  final void Function()? imageOnTap;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? hintText;
  final String? validationMSG;
  final String? suffixText;
  final String? prefixText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final List<TextInputFormatter>? formatter;
  // final String? validationMSG;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final double? iconWidth;
  final double? iconHeight;
  final double? paddingHorizontal;
  final int? maxLines;
  final double? borderWidth;
  final double? borderRadius;
  final Color? backGroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? hintColor;
  final Color? imageColor;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextAlign? textAlign;

  const CustomTextFormFiled(
      {Key? key,
        this.widget,
        this.image,
        this.hintText,
        this.controller,
        this.textInputAction,
        this.textInputType,
        this.height,
        this.backGroundColor,
        this.borderColor,
        this.icon,
        this.iconColor,
        this.hintColor,
        this.readOnly,
        this.validationMSG,
        this.borderWidth,
        this.borderRadius,
        this.defaultValue,
        this.formatter, this.maxLines, this.paddingHorizontal, this.iconOnTap, this.imageOnTap, this.imageWidth, this.imageHeight, this.iconWidth, this.iconHeight, this.onTap, this.onChanged, this.suffixText, this.prefixText, this.suffixWidget, this.prefixWidget, this.textAlign, this.imageColor})
      : super(key: key);

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null && widget.controller != null) {
      widget.controller!.text = widget.defaultValue!;
    } else {}
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
                textAlign: widget.textAlign??TextAlign.start,
                onChanged:widget.onChanged ,
                onTap: widget.onTap,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return widget.validationMSG;
                  }
                  return null;
                },
                // autovalidateMode:validationMSG ,
                // initialValue: validationMSG,
                readOnly: widget.readOnly??false ,
                autofocus: false,
                inputFormatters: widget.formatter ??
                    [
                      LengthLimitingTextInputFormatter(500),
                    ],
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: widget.height ?? 20.h,horizontal:widget.paddingHorizontal?? 0),
                  filled: true,
                  fillColor: widget.backGroundColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: widget.borderWidth ?? 1,
                        color: widget.borderColor ??
                            AppColors.primaryColor), //<-- SEE HERE
                    borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10),
                  ),
                  errorBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: widget.borderWidth ?? 1,
                        color: Colors.redAccent),
                    borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: widget.borderWidth ?? 1,
                        color: widget.borderColor ?? AppColors.primaryColor),
                    borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: widget.borderWidth ?? 1,
                        color: widget.borderColor ?? AppColors.primaryColor),
                    borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10),
                  ),
                  // enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  // errorBorder: InputBorder.none,
                  focusColor: Colors.transparent,
                  suffix:widget.suffixWidget ,
                  prefix:widget.prefixWidget ,
                  suffixText: widget.suffixText,
                  prefixText: widget.prefixText,
                  suffixIcon: widget.image == null
                      ? SizedBox()
                      : InkWell(onTap:widget.imageOnTap,
                    child:widget.imageColor==null? SVGIcon(
                      widget.image ?? '',
                      //'assets/images/svg$image.svg',
                      width: (widget.imageWidth??20.w),
                      height: (widget.imageHeight??20.h),
                    ):SVGIcon(
                      widget.image ?? '',
                      //'assets/images/svg$image.svg',
                      width: (widget.imageWidth??20.w),
                      height: (widget.imageHeight??20.h),
                      color: (widget.imageColor??AppColors.gray),
                    ),
                  ),
                  prefixIcon: widget.icon == null
                      ? null
                      : Padding(
                    padding:  EdgeInsets.only(bottom:(widget.maxLines!=null)? 80.h:0),
                    child: InkWell(onTap:widget.iconOnTap,
                      child: SVGIcon(
                        widget.icon ?? '',
                        width: (widget.iconWidth??20.w),
                        height: (widget.iconHeight??20.h),
                        color: widget.iconColor??AppColors.primaryColor,
                      ),
                    ),
                  ),

                  //border: InputBorder.none,
                  hintText: widget.hintText?.tr(),
                  hintStyle: TextStyles()
                      .getRegularStyle(fontSize: 14.sp)
                      .customColor(widget.hintColor ?? AppColors.hintColor),
                ),
                maxLines: widget.maxLines??1,
                controller: widget.controller,
                textInputAction: widget.textInputAction,
                keyboardType: widget.textInputType ?? TextInputType.text,
                cursorColor: AppColors.primaryColor,
                style: TextStyles()
                    .getRegularStyle(fontSize: 14.sp)
                    .customColor(widget.hintColor ?? AppColors.black),
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
}
