import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonDatesInfoWidget extends StatelessWidget {
  final String birthday;
  final String deathday;
  const PersonDatesInfoWidget({
    Key? key,
    required this.birthday,
    required this.deathday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w700),
            children: [
              const TextSpan(text: 'Born'),
              const TextSpan(
                text: '  ·  ',
              ),
              TextSpan(
                  text: _formatDate(birthday),
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        deathday.isNotEmpty
            ? Text.rich(
                TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w700),
                  children: [
                    const TextSpan(text: 'Died'),
                    const TextSpan(
                      text: '  ·  ',
                    ),
                    TextSpan(
                        text: _formatDate(deathday),
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  String _formatDate(String date) {
    try {
      if (birthday.isEmpty) {
        return 'No date reported';
      }

      final year = int.parse(date.substring(0, 4));
      final month = int.parse(date.substring(5, 7));
      final day = int.parse(date.substring(8));

      final convertedDate = DateTime(year, month, day);

      final formattedDate = DateFormat.yMMMMd().format(convertedDate);

      return '$formattedDate ${_calculateAge(convertedDate)}';
    } catch (e) {
      debugPrint(e.toString());
      return 'No date reported';
    }
  }

  String _calculateAge(DateTime birthDate) {
    if (deathday.isNotEmpty) {
      return '';
    }
    final age = (DateTime.now().difference(birthDate).inDays / 365).floor();

    return '($age years)';
  }
}
