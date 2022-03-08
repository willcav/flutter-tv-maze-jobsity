import '../core/image_link_options_entity.dart';

class PersonBasicInfoEntity {
  final String id;
  final String name;
  final String birthday;
  final String deathday;
  final String gender;
  final ImageLinkOptionsEntity image;

  const PersonBasicInfoEntity({
    required this.id,
    required this.name,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.image,
  });
}
