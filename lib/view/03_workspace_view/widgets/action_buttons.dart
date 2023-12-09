import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/widgets/icon_decore.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconDecore(
          onTap: () {},
          icon: FontAwesomeIcons.textWidth,
          bgColor: AppColors.background,
          iconColor: AppColors.primary,
        ),
         IconDecore(
          onTap: () {},
          icon: FontAwesomeIcons.squareCheck,
          bgColor: AppColors.background,
          iconColor: AppColors.primary,
        ),
        IconDecore(
          onTap: () {},
          icon: FontAwesomeIcons.listUl,
          bgColor: AppColors.background,
          iconColor: AppColors.primary,
        ),
        IconDecore(
          onTap: () {},
          icon: FontAwesomeIcons.listOl,
          bgColor: AppColors.background,
          iconColor: AppColors.primary,
        ),
        IconDecore(
          onTap: () {},
          icon: FontAwesomeIcons.paragraph,
          bgColor: AppColors.background,
          iconColor: AppColors.primary,
        ),
      ],
    );
  }
}
