import 'package:flutter/material.dart';
import 'package:tline_calculator/utils/app_styles.dart';

class CustomTextfield extends StatefulWidget {
  final int maxLength;
  final int? maxLines;
  final String hintText;
  final TextEditingController controller;

  const CustomTextfield(
      {super.key,
      required this.maxLength,
      this.maxLines,
      required this.hintText,
      required this.controller});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      cursorColor: Apptheme.accent,
      style: Apptheme.inputStyle,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Apptheme.hintStyle,
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Apptheme.accent)),
        filled: true, // Enable filling
        fillColor: Apptheme.darker, // Set the background color
        border:
            OutlineInputBorder(borderSide: BorderSide(color: Apptheme.accent)),
      ),
    );
  }
}
