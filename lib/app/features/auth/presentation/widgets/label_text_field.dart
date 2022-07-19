import 'package:flutter/material.dart';

class LabelTextField extends StatelessWidget {
  const LabelTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 16.0)),
        TextField(
          controller: controller,
        ),
      ],
    );
  }
}
