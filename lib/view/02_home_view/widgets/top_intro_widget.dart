import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_muse/app/locator.dart';
import 'package:note_muse/services/state_services/user_service.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/common/app_text_style.dart';

class TopIntroWidget extends StatelessWidget {
   TopIntroWidget({super.key});
  final _locator = locator<UserService>();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(text:  TextSpan(text:'Good Morning  ', style: AppTextStyle.h4Normal , children: [
            TextSpan(text: _locator.user.username, style: AppTextStyle.h3Bold)
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