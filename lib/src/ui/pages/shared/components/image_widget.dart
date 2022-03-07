import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageNetworkPath;
  const ImageWidget({
    Key? key,
    required this.imageNetworkPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageNetworkPath.isEmpty) {
      return Image.asset(
        'assets/images/default_image.png',
        fit: BoxFit.cover,
      );
    }

    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/default_image.png',
      image: imageNetworkPath,
      fit: BoxFit.cover,
    );
  }
}
