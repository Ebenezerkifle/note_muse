import 'package:flutter/material.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/common/app_text_style.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .09,
        width: MediaQuery.of(context).size.width,
        child: Card(
            elevation: 0,
            child: Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 3.0,
                      offset: const Offset(1, 2),
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(color: AppColors.primary, width: 3)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('New Survey', style: AppTextStyle.h3Bold),
                            Text(
                              'A new survey is added which perfectly matchs with you',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.h4Normal,
                            )
                          ],
                        ),
                      ),
                      const Text('today, 2:34pm', style: AppTextStyle.thinSmall)
                    ],
                  ),
                ))));
  }
}
