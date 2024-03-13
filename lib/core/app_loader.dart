import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:lottie/lottie.dart';

class AppLoader extends StatefulWidget {
  final String? title;
  final double? height;
  final double? width;

  const AppLoader({super.key, this.title, this.height, this.width});
  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            'assets/lolitJson/appLoader.json',
            height:widget.width?? 100.h,
            width:widget.height?? 200.w,
          ),
        ),
        SizedBox(height: 20),
        Text(widget.title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.grey))
      ],
    );
  }
}
