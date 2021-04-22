import 'package:dev_quiz_nlw/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonStyle {
  static final purple = LevelButtonStyle(AppColors.levelButtonFacil,
      AppColors.levelButtonBorderFacil, AppColors.levelButtonTextFacil);
  static final green = LevelButtonStyle(AppColors.levelButtonMedio,
      AppColors.levelButtonBorderMedio, AppColors.levelButtonTextMedio);
  static final orange = LevelButtonStyle(AppColors.levelButtonDificil,
      AppColors.levelButtonBorderDificil, AppColors.levelButtonTextDificil);
  static final red = LevelButtonStyle(AppColors.levelButtonPerito,
      AppColors.levelButtonBorderPerito, AppColors.levelButtonTextPerito);

  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  LevelButtonStyle(this.backgroundColor, this.borderColor, this.textColor);
}

class LevelButtonWidget extends StatelessWidget {
  final String label;

  final LevelButtonStyle style;

  LevelButtonWidget({required this.label, required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.style.backgroundColor,
        border: Border.fromBorderSide(
          BorderSide(
            color: this.style.borderColor,
          ),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
        child: Text(
          this.label,
          style: GoogleFonts.notoSans(
            color: this.style.textColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
