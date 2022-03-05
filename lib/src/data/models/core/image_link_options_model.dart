import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/image_link_options_entity.dart';

class ImageLinkOptionsModel extends ImageLinkOptionsEntity {
  final String dtoMedium;
  final String dtoOriginal;

  const ImageLinkOptionsModel({
    required this.dtoMedium,
    required this.dtoOriginal,
  }) : super(medium: dtoMedium, original: dtoOriginal);

  factory ImageLinkOptionsModel.fromMap(Map<String, dynamic> map) {
    return ImageLinkOptionsModel(
      dtoMedium: (map['medium'] ?? '').toString(),
      dtoOriginal: (map['original'] ?? '').toString(),
    );
  }
}
