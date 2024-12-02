import 'package:flutter/material.dart';
import 'package:introduction_flutter/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onPressed;

  const CustomBackButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.fucsia,
        size: 20,
      ),
    );
  }
}
