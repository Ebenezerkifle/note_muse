import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_muse/models/note.dart';
import 'package:note_muse/providers/editing.provider.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/widgets/icon_decore.dart';

class ActionButtons extends ConsumerWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editNotifier = ref.watch(EditingProvider.provider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconDecore(
          onTap: () {
            editNotifier.addNote(Note(
              data: '',
              type: 'type',
              createdTime: DateTime.now(),
              updatedTime: DateTime.now(),
            ));
          },
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
