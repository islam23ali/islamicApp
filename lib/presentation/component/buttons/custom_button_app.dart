import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../loading_spinner.dart';
import '../svg_icon.dart';

class CustomButtonApp extends StatefulWidget {
  const CustomButtonApp({Key? key, this.text, this.onTap, this.icon, this.firstColor, this.secondColor, this.height, this.borderRadius, this.borderColor, this.loading=false, this.iconColor, this.image, this.imageColor}) : super(key: key);
  final String? text;
  final void Function()? onTap;
  final String? icon;
  final String? image;
  final Color? firstColor;
  final Color? secondColor;
  final Color? iconColor;
  final Color? imageColor;
  final double? height;
  final double? borderRadius;
  final Color? borderColor;
  final bool? loading;

  @override
  _CustomButtonAppState createState() => _CustomButtonAppState();
}

class _CustomButtonAppState extends State<CustomButtonApp> {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: widget.loading??false ? () {} : widget.onTap,
      child: Container(
        height:widget.height?? 52.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [widget.firstColor??AppColors.secondColor, widget.secondColor??AppColors.primaryColor],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,),
          border: Border.all(width: 1.w,color:widget.borderColor?? Colors.transparent),
          borderRadius: BorderRadius.circular(widget.borderRadius??12.r),),child: Center(child:
      Row(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (widget.icon==null||widget.loading==true)?SizedBox():Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SVGIcon(widget.icon??'',color: widget.iconColor,width: 20.w,height: 20.h,),
          ),
          widget.loading??false
              ? Padding(
            padding:  EdgeInsets.all(6.r),
            child: LoadingSpinner(
                color: Theme.of(context).cardColor),
          )
              :
          Text(
            widget.text??'',
            style: TextStyles()
                .getRegularStyle(fontSize: 14.sp)
                .customColor( Colors.white),
          ),
          (widget.image==null||widget.loading==true)?SizedBox():Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SVGIcon(widget.image??'',color: widget.imageColor,width: 20.w,height: 20.h,),
          ),
        ],),),),
    );
  }
}
