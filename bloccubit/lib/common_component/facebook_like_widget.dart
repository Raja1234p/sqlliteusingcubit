import 'package:flutter/material.dart';

class FacebookWidget extends StatelessWidget {
  const FacebookWidget(
      {Key? key,
      required this.text,
      required this.iconData,
      this.color = Colors.grey})
      : super(key: key);
  final String text;
  final IconData iconData;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: color,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text),
      ],
    );
  }
}
