import 'package:flutter/material.dart';

class DividerWithText extends StatefulWidget {
  final String text;

  const DividerWithText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<DividerWithText> createState() => _DividerWithTextState();
}

class _DividerWithTextState extends State<DividerWithText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.text,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
