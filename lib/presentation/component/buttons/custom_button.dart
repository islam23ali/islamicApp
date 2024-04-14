import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/app_colors.dart';
import 'package:islamic_app/presentation/component/svg_icon.dart';

import '../../../../../core/res/text_styles.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../core/resources/app_assets.dart';
import '../component.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback _onTap;
  final Widget? _child;
  final String? _title;
  final Color? _color;
  final Color? _borderColor;
  final Color? _textColor;
  final double? _width;
  final double? _height;
  final double? _buttonRadius;
  final double? _fontSize;
  final String? _icon;
  // final Color? _iconColor;
  final bool _isRounded;
  final bool _isOutlined;
  final bool _widerPadding;
  final bool _loading;
  final Color? _loadColor;

  const CustomButton({
    super.key,
    required VoidCallback onTap,
    Widget? child,
    String? title,
    String? icon,
    // Color? iconColor,
    Color? color,
    Color? loadColor,
    Color? textColor,
    Color? borderColor,
    double? width,
    double? fontSize,
    double? height,
    //double? bottonRadius,
    bool isRounded = true,
    bool isOutlined = false,
    bool widerPadding = false,
    bool loading = false,
    double? buttonRadius,
  })  : _onTap = onTap,
        _child = child,
        _title = title,
        _icon = icon,
        // _iconColor = iconColor,
        _color = color,
        _textColor = textColor,
        _width = width,
        _fontSize = fontSize,
        _height = height,
        _isRounded = isRounded,
        _isOutlined = isOutlined,
        _widerPadding = widerPadding,
        _loading = loading,
        _loadColor = loadColor,
       _buttonRadius = buttonRadius,
       _borderColor = borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width ?? deviceWidth,
      height: (_height ?? 53).h,
      child: TapEffect(
        isClickable: !_loading,
        onClick: _loading ? null : _onTap,
        child: MaterialButton(
          height: _height ?? 53.h,
          color: _isOutlined
              ? Colors.transparent
              : (_color ?? Theme.of(context).primaryColor),
          highlightElevation: 0,
          onPressed: _loading ? () {} : _onTap,
          padding: !_widerPadding
              ? EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w)
              : EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          elevation: 0,
          shape: _isRounded
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_buttonRadius??AppSize.s12.r),
                  side: BorderSide(
                    color: _borderColor ?? Colors.transparent,
                    width: 1.0.w,
                  ))
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_buttonRadius??AppSize.s12.r),
                  side: BorderSide(
                    color: _borderColor ?? Theme.of(context).primaryColor,
                    width: 1.0.w,
                  ),
                ),
          child: _loading
              ? Padding(
                padding:  EdgeInsets.all(6.r),
                child: LoadingSpinner(
                     color:_loadColor ?? Theme.of(context).cardColor),
              )
              : _title != null
                  ? Center(
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (_icon==null)?SizedBox(): Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: SVGIcon(_icon??'',width: 20.w,height: 20.h,),
                          ),
                          Text(
                            _title!,
                            style: TextStyles()
                                .getRegularStyle(fontSize: _fontSize ?? 14.sp)
                                .customColor(_textColor ?? Colors.white),
                          ),
                        ],
                      ),
                    )
                  : _child ?? const SizedBox(),
        ),
      ),
    );
  }
}
