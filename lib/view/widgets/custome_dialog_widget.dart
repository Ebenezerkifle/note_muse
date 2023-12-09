import 'package:flutter/material.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/common/app_text_style.dart';
import 'package:note_muse/view/widgets/custome_button.dart';

class CustomDialog {
  static show({required BuildContext context, required Widget widget}) =>
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: const EdgeInsets.all(0.0),
          content: widget,
        ),
      );
}

class TextFieldBuilder extends StatelessWidget {
  const TextFieldBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
       height:  MediaQuery.of(context).size.height * .27,
      width: MediaQuery.of(context).size.width * .5,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }
}

class DialogBuilder extends StatelessWidget {
  const DialogBuilder({
    super.key,
    required this.title,
    required this.description,
    required this.action,
    required this.onApprove,
    required this.onCancel,
    required this.icon,
    this.height,
  });
  final String title;
  final String description;
  final VoidCallback onApprove;
  final VoidCallback onCancel;
  final bool action;
  final IconData icon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * .27,
      width: MediaQuery.of(context).size.width * .5,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 50,
              color: AppColors.light,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Text(
                title,
                style: AppTextStyle.h1Bold,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyle.h4Normal,
              ),
              const SizedBox(height: 30),
              action
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomeButton(
                          text: 'No',
                          onTap: onCancel,
                          width: MediaQuery.of(context).size.width * .3,
                          btnColor: AppColors.secondary,
                          textStyle: AppTextStyle.h3Bold,
                        ),
                        CustomeButton(
                          text: 'Yes',
                          onTap: onApprove,
                          width: MediaQuery.of(context).size.width * .3,
                          textStyle: AppTextStyle.withColor(
                              color: AppColors.secondary,
                              style: AppTextStyle.h3Bold),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
