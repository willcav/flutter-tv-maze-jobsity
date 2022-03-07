import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  const MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontWeight: FontWeight.w300, fontSize: 24),
        ),
      ),
    );
  }
}
