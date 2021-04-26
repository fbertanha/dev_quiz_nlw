import 'package:dev_quiz_nlw/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;

  NextButtonWidget({
    required this.label,
    required this.onTap,
    this.backgroundColor = AppColors.darkGreen,
    this.fontColor = AppColors.white,
    this.borderColor = AppColors.border,
  });

  NextButtonWidget.purple({required String label, required onTap})
      : this.label = label,
        this.onTap = onTap,
        this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.purple;

  NextButtonWidget.transparent({required String label, required onTap})
      : this.label = label,
        this.onTap = onTap,
        this.backgroundColor = AppColors.transparent,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.transparent;

  NextButtonWidget.darkGreen({required String label, required onTap})
      : this.label = label,
        this.onTap = onTap,
        this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.darkGreen;

  NextButtonWidget.white({required String label, required onTap})
      : this.label = label,
        this.onTap = onTap,
        this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all(Colors.grey.withOpacity(0.15)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600, fontSize: 15, color: fontColor),
        ),
      ),
    );
  }
}
