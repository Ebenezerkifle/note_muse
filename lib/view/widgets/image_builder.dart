import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder(
      {super.key,
      required this.image,
      this.url=false,
      this.fit = BoxFit.cover,
      required this.height,
      this.width,
      this.circle = false});
  final String image;
  final bool url;
  final BoxFit fit;
  final double height;
  final double? width;
  final bool circle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: circle ? BoxShape.circle : BoxShape.rectangle,
          image: url
              ? DecorationImage(image: NetworkImage(image), fit: fit)
              : DecorationImage(image: AssetImage(image), fit: fit)),
      height: height,
      width: width ?? height,
    );
  }
}