import 'package:flutter/material.dart';
import 'package:introduction_flutter/theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final String? validationMessage;
  final bool obscureText;
  final bool isMultiLine;
  final bool readOnly;
  final double? fontSize;
  final Color? colorText;
  final Function(String)? onChanged;
  final Function()? onFieldSubmitted;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hint,
    this.validationMessage,
    this.obscureText = false,
    this.isMultiLine = false,
    this.readOnly = false,
    this.fontSize,
    this.colorText,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 2, right: 16, bottom: 4),
        child: TextFormField(
          onFieldSubmitted: (value) {
            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!();
            }
          },
          textCapitalization: TextCapitalization.sentences,
          controller: widget.controller,
          readOnly: widget.readOnly,
          maxLines: widget.isMultiLine ? null : 1,
          cursorColor: AppColors.stroke,
          textAlignVertical: TextAlignVertical.center,
          validator: widget.validator != null
              ? widget.validator!
              : (value) {
                  if (value == null || value.isEmpty) {
                    return widget.validationMessage;
                  }
                  return null;
                },
          obscureText: widget.obscureText && !passwordVisible,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintMaxLines: 1,
            errorMaxLines: 2,
            suffixIcon: widget.obscureText
                ? InkWell(
                    child: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onTap: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  )
                : null,
            hintStyle: TextStyle(
              color: Colors.black54,
              fontSize: widget.fontSize ?? 18,
            ),
            border: InputBorder.none,
            errorStyle: const TextStyle(
              fontSize: 15,
              color: Colors.red,
            ),
          ),
          style: TextStyle(
            color: widget.colorText ?? Colors.black,
            fontSize: widget.fontSize ?? 18,
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
