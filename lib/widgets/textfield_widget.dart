import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final double? borderRadius;
  final int? maxLines ;
  final bool readOnly ;
  const TextFieldWidget({
    Key? key,
    required this.textController,
    required this.hintText,
     this.borderRadius = 30 ,
    this.maxLines = 1 ,
    this.readOnly = false ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly ,
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }
}
