import 'package:flutter/material.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/common/app_text_style.dart';

class CustomeCardTile extends StatelessWidget {
  const CustomeCardTile({
    super.key,
    required this.title,
    required this.imageWidget,
    this.subtitle,
    this.centerText = false,
    required this.onTap,
  });
  final String title;
  final Widget imageWidget;
  final String? subtitle;
  final bool centerText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Container(
          height: MediaQuery.of(context).size.width * .45,
          width: MediaQuery.of(context).size.width * .45,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 3.0,
                offset: const Offset(1, 2),
                spreadRadius: 2,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: centerText
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  imageWidget,
                  Column(
                    crossAxisAlignment: centerText
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.h4Bold,
                      ),
                      Text(
                        subtitle ?? '',
                        style: AppTextStyle.thinSmall,
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
