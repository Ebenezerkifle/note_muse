import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_muse/view/common/app_text_style.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('All Workspaces', style: AppTextStyle.h3Bold),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.list),
            )
          ],
        ),
      ],
    );
  }
}
