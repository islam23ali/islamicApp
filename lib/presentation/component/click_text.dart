import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/res/text_styles.dart';

class TextClickWidget extends StatelessWidget {
  final String? text ;
  final String? subText ;
  final Color? textColor ;
  final Color? subTextColor ;
  final TextStyle? subTextStyle ;
  final TextStyle? textStyle ;
  final GestureTapCallback? subTextOnTap;
  final GestureTapCallback? textOnTap;
  const TextClickWidget({super.key,
    this.textColor,
    this.text,
    this.subText,
    this.subTextOnTap, this.subTextColor, this.subTextStyle, this.textStyle, this.textOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${text ?? ''} ' ,
            style: textStyle ??TextStyles().getRegularStyle().blackStyle().copyWith(
                height: 1.4,color: textColor
            ),
            recognizer: TapGestureRecognizer()..onTap = textOnTap,
          ),
          TextSpan(
            text: subText ?? '',
            style:subTextStyle??TextStyles().getRegularStyle().copyWith( height: 1.4,color:subTextColor  ),
            recognizer: TapGestureRecognizer()..onTap = subTextOnTap,
          ),
        ],
      ),
    );
  }
}

