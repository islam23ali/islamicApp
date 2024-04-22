import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../auth/auth_view_model.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final load=context.watch<AuthViewModel>().isLoading;
    return AlertDialog(
      content: Text(
        'هل انت متأكد من تسجيل الخروج ؟ ',
        style: TextStyles()
            .getRegularStyle(fontSize: 16.sp)
            .boldStyle()
            .customColor(AppColors.primaryColor),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
          child: !load
              ? GestureDetector(
                  onTap: () {
                    Provider.of<AuthViewModel>(context, listen: false).logout(context);
                  },
                  child: Text(
                    'تأكيد',
                    style: TextStyles()
                        .getRegularStyle(fontSize: 16.sp)
                        .boldStyle()
                        .customColor(AppColors.errorColor),
                  ))
              : SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,color: AppColors.primaryColor,
                  )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "إلغاء",
                style: TextStyles()
                    .getRegularStyle(fontSize: 16.sp)
                    .boldStyle()
                    .customColor(AppColors.primaryColor),
              )),
        ),
      ],
    );
  }
}
