import 'package:flutter/material.dart';

import '../../../../domain/entities/search_people/person_basic_info_entity.dart';
import '../../../themes/app_colors.dart';
import '../../shared/components/image_widget.dart';

class PersonCard extends StatelessWidget {
  final int index;
  final String heroTag;
  final PersonBasicInfoEntity personInfoItem;
  final void Function({required PersonBasicInfoEntity personEntity}) onTap;
  const PersonCard({
    Key? key,
    required this.index,
    required this.personInfoItem,
    required this.onTap,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: index == 0 || index == 1 ? 32 : 0),
      child: InkWell(
        onTap: () => onTap(personEntity: personInfoItem),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.grey1,
                ),
                child: Hero(
                  tag: heroTag,
                  child: ImageWidget(
                    imageNetworkPath: personInfoItem.image.medium,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(personInfoItem.name,
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
