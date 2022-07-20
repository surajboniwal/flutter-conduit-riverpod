import 'package:flutter/material.dart';

class LabelTextField extends StatelessWidget {
  const LabelTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.error,
  })  : assert(error == null ? controller != null : true),
        super(key: key);

  final String label;
  final TextEditingController controller;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 16.0)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            errorText: error,
          ),
        ),
      ],
    );
  }
}
