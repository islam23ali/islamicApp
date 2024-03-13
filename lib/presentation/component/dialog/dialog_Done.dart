import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';

class DialogDone extends StatefulWidget {
  const DialogDone({Key? key,required this.title, this.onTap}) : super(key: key);
  final String title;
  final Function? onTap;

  @override
  State<DialogDone> createState() => _DialogDoneState();
}

class _DialogDoneState extends State<DialogDone> {
  // final Widget widget;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {Navigator.pop(context);});
  }
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(24.r)),
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 10.h,width: 50.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),color: AppColors.grayLight,)),
              Lottie.asset(
                'assets/lolitJson/success.json',
                height: 250.h,
                width: 250.w,
              ),
              // Image.asset(Assets.doneGif,height: 250.h,),
              SizedBox(width: 250.w,
                child: Text(
                  widget.title??'',
                  style: TextStyles()
                      .getDisplayMediumStyle(fontSize: 16.sp)
                      .customColor(AppColors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12.h,),
              // Row(mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //    Container(child: widget,),
              //     Icon(Icons.arrow_forward_ios,color: AppColors.second,size: 12.r,)
              //   ],
              // ),

            ],),),
      );
  }
}
