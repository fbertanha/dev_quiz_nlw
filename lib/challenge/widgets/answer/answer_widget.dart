import 'package:dev_quiz_nlw/core/core.dart';
import 'package:dev_quiz_nlw/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool disabled;

  final VoidCallback onTap;

  AnswerWidget({
    required this.answer,
    required this.onTap,
    this.disabled = false,
    this.isSelected = false,
  });

  Color get _iconColor {
    if (!isSelected) return AppColors.white;
    return answer.isCorrect ? AppColors.darkGreen : AppColors.darkRed;
  }

  Color get _iconBorderColor {
    if (!isSelected) return AppColors.border;
    return answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;
  }

  Color get _cardBackgroundColor {
    if (!isSelected) return AppColors.white;
    return answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;
  }

  Color get _cardBorderColor {
    if (!isSelected) return AppColors.border;
    return answer.isCorrect ? AppColors.green : AppColors.red;
  }

  TextStyle get _textStyle {
    if (!isSelected) return AppTextStyles.body;
    return answer.isCorrect ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  }

  Icon? get _icon {
    if (!isSelected) return null;
    return Icon(
      answer.isCorrect ? Icons.check : Icons.close,
      color: AppColors.white,
      size: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
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
                  answer.title,
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
        ),
      ),
    );
  }
}
