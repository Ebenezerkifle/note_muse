
import 'package:flutter/material.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/common/app_text_style.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    super.key,
    required this.text,
    required this.onTap,
    this.btnColor = AppColors.primary,
    this.textColor = AppColors.secondary,
    this.height = 50,
    this.width,
    this.stroke = false,
    this.round = true,
    this.stkWidth = 2,
    this.textStyle,
    this.alignment,
    this.icon,
    this.disabled = false,
    this.loading = false,
  });
  final bool stroke;
  final String text;
  final VoidCallback onTap;
  final Color btnColor;
  final Color textColor;
  final double height;
  final double? width;
  final bool round;
  final double stkWidth;
  final TextStyle? textStyle;
  final Widget? icon;
  final MainAxisAlignment? alignment;
  final bool disabled;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? MediaQuery.of(context).size.width * .5,
      child: ElevatedButton(
        onPressed: disabled || loading
            ? null
            : () => {
                  FocusScope.of(context).unfocus(),
                  onTap(),
                },
        style: ElevatedButton.styleFrom(
            backgroundColor: stroke ? null : btnColor,
            side: stroke
                ? BorderSide(
                    color: btnColor,
                    width: stkWidth,
                    strokeAlign: BorderSide.strokeAlignInside)
                : BorderSide.none,
            shape: round
                ? const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))
                : const BeveledRectangleBorder()),
        child: Row(
          mainAxisAlignment: alignment ?? MainAxisAlignment.center,
          children: [
            loading
                ? const CircularProgressIndicator(
                    color: AppColors.secondary,
                    strokeWidth: 2,
                  )
                : Text(
                    text,
                    style: textStyle ??
                        AppTextStyle.withColor(
                            color: textColor, style: AppTextStyle.h4Normal),
                  ),
            icon ?? const SizedBox(height: 0, width: 0),
          ],
        ),
      ),
    );
  }
}
