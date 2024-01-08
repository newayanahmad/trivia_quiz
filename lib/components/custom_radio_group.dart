import 'package:flutter/material.dart';

class CustomRadioGroup extends StatelessWidget {
  final List<String> options;
  final String groupValue;
  final ValueChanged<String?>? onChanged;

  const CustomRadioGroup({
    Key? key,
    required this.options,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map(
            (option) => RadioListTile(
              enableFeedback: true,
              title: Text(option),
              value: option,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Colors.pinkAccent.shade200,
            ),
          )
          .toList(),
    );
  }
}
