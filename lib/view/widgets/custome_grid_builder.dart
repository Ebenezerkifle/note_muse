import 'package:flutter/material.dart';

class CustomeGridBuilder extends StatelessWidget {
  const CustomeGridBuilder({super.key, required this.items});
  final List<Widget> items;

  Widget rowElements(List<Widget> elements) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: elements.map((e) => e).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    int trackIndex = 0;
    return Column(
      children: List.generate((items.length / 2).round(), (index) {
        trackIndex++;
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: rowElements([
            items[index + trackIndex - 1],
            items.length > (index + trackIndex)
                ? items[index + trackIndex]
                : Container()
          ]),
        );
      }),
    );
  }
}
