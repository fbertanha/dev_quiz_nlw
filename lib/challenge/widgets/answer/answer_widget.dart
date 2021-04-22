import 'package:dev_quiz_nlw/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isCorrect;
  final bool isSelected;

  AnswerWidget({
    required this.title,
    required this.isCorrect,
    required this.isSelected,
  });

  Color get _iconColor {
    if (!isSelected) return AppColors.white;
    return isCorrect ? AppColors.darkGreen : AppColors.darkRed;
  }

  Color get _iconBorderColor {
    if (!isSelected) return AppColors.white;
    return isCorrect ? AppColors.lightGreen : AppColors.lightRed;
  }

  Color get _cardBackgroundColor {
    if (!isSelected) return AppColors.white;
    return isCorrect ? AppColors.lightGreen : AppColors.lightRed;
  }

  Color get _cardBorderColor {
    if (!isSelected) return AppColors.border;
    return isCorrect ? AppColors.green : AppColors.red;
  }

  TextStyle get _textStyle {
    if (!isSelected) return AppTextStyles.body;
    return isCorrect ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  }

  Icon? get _icon {
    if (!isSelected) return null;
    return Icon(
      isCorrect ? Icons.check : Icons.close,
      color: AppColors.white,
      size: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.maxFinite,
      height: 72,
      decoration: BoxDecoration(
        color: _cardBackgroundColor,
        border: Border.fromBorderSide(
          BorderSide(
            color: _cardBorderColor,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: _textStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: _iconColor,
              border: Border.fromBorderSide(
                BorderSide(
                  color: _iconBorderColor,
                ),
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: _icon,
          )
        ],
      ),
    );
  }
}
