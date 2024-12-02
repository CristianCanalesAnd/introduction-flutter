import 'package:flutter/material.dart';
import 'package:introduction_flutter/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final double fontSize;
  final TextStyle? titleStyle;
  final double? elevation;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Function()? onPressed;

  const CustomButton({
    Key? key,
    this.backgroundColor = AppColors.fucsia,
    required this.title,
    this.fontSize = 18,
    this.titleStyle,
    this.elevation,
    this.padding = const EdgeInsets.symmetric(vertical: 14.0),
    this.borderRadius = 30,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: elevation,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          onPressed: onPressed,
          child: buildTitle,
        ),
      ],
    );
  }

  Widget get buildTitle {
    return Text(
      title,
      style: titleStyle ??
          TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
      textAlign: TextAlign.center,
    );
  }
}
