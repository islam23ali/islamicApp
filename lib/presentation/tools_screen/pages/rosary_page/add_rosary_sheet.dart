import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/injection.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../../core/utils/showToast.dart';
import '../../../component/buttons/custom_button.dart';
import '../../../component/inputs/new/customTextFormField.dart';
import '../../tools_view_model.dart';
ToolsViewModel provider =getIt();
class AddRosarySheet extends StatefulWidget {
  const AddRosarySheet({Key? key}) : super(key: key);

  @override
  _AddRosarySheetState createState() => _AddRosarySheetState();
}

class _AddRosarySheetState extends State<AddRosarySheet> {
  @override
  void initState() {
provider.rosaryTextController.text='';
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 24.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r)),
            color: AppColors.whiteCard,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 8.h,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: AppColors.grayLight,
                ),
              ),
              SizedBox(height: 10.h,),
              CustomTextFormFiled(
                controller: provider.rosaryTextController,
                borderColor: Colors.transparent,hintText: LocaleKeys.nameRosary.tr(),paddingHorizontal: 10.w,),
              SizedBox(height: 10.h,),
              CustomButton(
                onTap: () {
                  if (provider.rosaryTextController.text.isEmpty){
                    ToastUtils.showToast(LocaleKeys.addNameRosary.tr());
                  }else{
                    setState(() {
                      provider.rosaryItems.add(provider.rosaryTextController.text);
                    });
                    provider.refreshData();
                  Navigator.pop(context);}
                },
                title: LocaleKeys.add.tr(),
                color: AppColors.primaryColor,
              )
            ],
          ),
        ));
  }
}
