import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/common/app_text_style.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.width,
    this.hint = "Type here...",
    this.suffixTxt,
    required this.controller,
    this.disabled = false,
    this.onchange,
    this.inputType,
    this.stroke = true,
    this.prefixIcon,
    this.suffixIcon,
    this.hideText = false,
    this.onTap,
    this.darkText = true,
    this.validator,
    this.readOnly = false,
    this.error = false,
    this.onEditingComplete,
    this.focusNode,
    this.autoValiation = false,
    this.onSubmit,
  });
  final double? width;
  final String hint;
  final String? suffixTxt;
  final TextEditingController controller;
  final bool disabled;
  final Function(dynamic)? onchange;
  final TextInputType? inputType;
  final bool stroke;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hideText;
  final VoidCallback? onTap;
  final bool darkText;
  final Function(dynamic)? validator;
  final bool readOnly;
  final bool error;
  final VoidCallback? onEditingComplete;
  final Function(dynamic)? onSubmit;
  final FocusNode? focusNode;
  final bool autoValiation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: 50,
      child: TextFormField(
        autovalidateMode:
            autoValiation ? AutovalidateMode.onUserInteraction : null,
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        validator: (value) => validator!(value),
        keyboardType: inputType ?? TextInputType.text,
        onChanged: onchange,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        autofocus: false,
        textAlignVertical: TextAlignVertical.center,
        obscureText: hideText,
        onFieldSubmitted: onSubmit,
        style: darkText
            ? AppTextStyle.h4Normal
            : AppTextStyle.withColor(
                color: Colors.white,
                style: AppTextStyle.h4Normal,
              ),
        decoration: InputDecoration(
          enabled: !disabled,
          border: stroke
              ? const OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: AppColors.primary),
                  borderRadius: BorderRadius.all(Radius.circular(5)))
              : InputBorder.none,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: darkText
              ? AppTextStyle.h4Normal
              : AppTextStyle.withColor(
                  color: Colors.white,
                  style: AppTextStyle.h4Normal,
                ),
          suffixText: suffixTxt ?? '',
          enabledBorder: stroke
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                      width: .0,
                      color: error ? AppColors.danger : AppColors.primary),
                  borderRadius: const BorderRadius.all(Radius.circular(5)))
              : InputBorder.none,
        ),
      ),
    );
  }
}
