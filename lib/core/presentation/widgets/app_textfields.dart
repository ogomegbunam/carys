import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTextfields {
  static TextFormField labelField(
          {required String label,
          TextEditingController? controller,
          FormFieldValidator? validator}) =>
      TextFormField(
        controller: controller,
        validator: validator,
        cursorColor: AppColors.darkGray.withOpacity(0.5),
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 2.w),
            labelText: "  $label  ",
            labelStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGray.withOpacity(0.5)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
              borderRadius: BorderRadius.circular(0.5.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
              borderRadius: BorderRadius.circular(0.5.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
              borderRadius: BorderRadius.circular(0.5.w),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(0.5.w),
            )),
      );
}
