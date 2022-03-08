import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageNetworkPath;
  final double? defaultHeight;
  const ImageWidget({
    Key? key,
    required this.imageNetworkPath,
    this.defaultHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageNetworkPath.isEmpty) {
      return Image.asset(
        'assets/images/default_image.png',
        height: defaultHeight,
        fit: BoxFit.cover,
      );
    }

    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/default_image.png',
      height: 250,
      image: imageNetworkPath,
      fit: BoxFit.cover,
    );
  }
}
