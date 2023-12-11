import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/common/app_text_style.dart';

class TopIntroWidget extends StatelessWidget {
  const TopIntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(text: const TextSpan(text:'Good Morning  ', style: AppTextStyle.h4Normal , children: [
            TextSpan(text: 'Ebenezer', style: AppTextStyle.h3Bold)
          ])),
          const Text("What do you have\non your Mind\ntoday?", style: AppTextStyle.bigPlus, overflow: TextOverflow.clip)
        ],
      ),
      IconButton(
        onPressed: () {}, //context.pushRoute(const NotificationRoute()),
        icon: const Icon(
          FontAwesomeIcons.ellipsisVertical,
          color: AppColors.primary,
        ),
      )
    ]);
  }
}