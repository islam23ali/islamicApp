import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';

import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../svg_icon.dart';
class AppNetworkImage extends StatelessWidget {

  final String? imageUrl;
  final double? borderRadius;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? errorImage;
  final bool? isZoom;

  const AppNetworkImage(
      {Key? key,
      this.fit= BoxFit.fill ,
      required this.imageUrl, this.borderRadius, this.height, this.width, this.errorImage, this.isZoom})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (isZoom==true)? GestureZoomBox(
      maxScale: 5.0,
      doubleTapScale: 2.0,
      child: SizedBox(height:height ,width:width ,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius??0.r),
          child: CachedNetworkImage(
            fit: fit,
            imageUrl: imageUrl ?? '',
            placeholder: (context, url) => SpinKitDoubleBounce(
              color: AppColors.primaryColor,
              size: 50.0.r,),
            errorWidget: (context, url, error) => Container(color:AppColors.white,width: 120,height: 122.h,child:  Image.asset(errorImage??Assets.splash,fit: BoxFit.cover,)), /// remove this picture before adding logic from assets for size
          ),
        ),
      ),
    ):SizedBox(height:height ,width:width ,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius??0.r),
        child: CachedNetworkImage(
          fit: fit,
          imageUrl: imageUrl ?? '',
          placeholder: (context, url) => SpinKitDoubleBounce(
            color: AppColors.primaryColor,
            size: 50.0.r,),
          errorWidget: (context, url, error) => Container(color:AppColors.white,width: 120,height: 122.h,child:  Image.asset(errorImage??Assets.splash,fit: BoxFit.cover,)), /// remove this picture before adding logic from assets for size
        ),
      ),
    );
  }
}
