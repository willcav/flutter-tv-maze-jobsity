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

    return Image.network(
      imageNetworkPath,
      fit: BoxFit.cover,
    );
  }
}
