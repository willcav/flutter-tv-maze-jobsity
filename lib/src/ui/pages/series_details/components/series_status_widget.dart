import 'package:flutter/material.dart';

class SeriesStatusWidget extends StatelessWidget {
  final String status;
  const SeriesStatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Status: $status',
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
