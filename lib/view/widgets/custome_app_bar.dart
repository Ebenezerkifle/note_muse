import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/common/app_text_style.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.bgcolor = AppColors.primary,
    this.back = true,
    this.height,
  });
  final String title;
  final String? subtitle;
  final Color bgcolor;
  final bool back;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * .08,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: bgcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                back
                    ? IconButton(
                        onPressed: () => context.popRoute(),
                        icon: const Icon(FontAwesomeIcons.angleLeft,
                            color: AppColors.light))
                    : const SizedBox(width: 0, height: 0),
                back ? const SizedBox(width: 15) : const SizedBox(width: 0),
                Text(
                  title,
                  style: AppTextStyle.withColor(
                      color: AppColors.light, style: AppTextStyle.big),
                )
              ]),
        ],
      ),
    );
  }
}
