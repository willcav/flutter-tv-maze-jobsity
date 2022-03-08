import 'package:flutter_tv_maze_jobsity/src/data/models/core/image_link_options_model.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/search_people/person_basic_info_entity.dart';

class PersonBasicInfoModel extends PersonBasicInfoEntity {
  final String dtoId;
  final String dtoName;
  final String dtoBirthday;
  final String dtoDeathday;
  final String dtoGender;
  final ImageLinkOptionsModel imageModel;

  PersonBasicInfoModel({
    required this.dtoId,
    required this.dtoName,
    required this.dtoBirthday,
    required this.dtoDeathday,
    required this.dtoGender,
    required this.imageModel,
  }) : super(
          id: dtoId,
          name: dtoName,
          birthday: dtoBirthday,
          deathday: dtoDeathday,
          gender: dtoGender,
          image: imageModel,
        );

  factory PersonBasicInfoModel.fromMap(Map<String, dynamic> map) {
    return PersonBasicInfoModel(
      dtoId: (map['id'] ?? '').toString(),
      dtoName: (map['name'] ?? '').toString(),
      dtoBirthday: (map['birthday'] ?? '').toString(),
      dtoDeathday: (map['deathday'] ?? '').toString(),
      dtoGender: (map['gender'] ?? '').toString(),
      imageModel: ImageLinkOptionsModel.fromMap(
        map['image'] ?? {},
      ),
    );
  }
}
