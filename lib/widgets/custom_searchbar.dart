import 'package:flutter/material.dart';
import 'package:introduction_flutter/widgets/custom_text_form_field.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChangedSearchNameText;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChangedSearchNameText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: const Icon(Icons.search, size: 32),
            ),
            Flexible(child: buildTextFormField),
          ],
        ),
      ),
    );
  }

  Widget get buildTextFormField {
    return CustomTextFormField(
      controller: controller,
      hint: 'Search by name',
      onChanged: onChangedSearchNameText,
    );
  }
}
