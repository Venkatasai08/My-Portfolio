import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';

class ContactTextFeild extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int? maxLines;
  const ContactTextFeild(
      {super.key,
      required this.hintText,
      required this.controller,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    InputDecoration buildInputDecoration({required String hintText}) {
      return InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.comfortaaStyle(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: AppColors.bgColor2,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16));
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "$hintText should not be empty";
                  }
                  return null;
                },
                maxLines: maxLines,
                controller: controller,
                cursorColor: AppColors.white,
                style: AppTextStyles.normalStyle(),
                decoration: buildInputDecoration(hintText: hintText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
