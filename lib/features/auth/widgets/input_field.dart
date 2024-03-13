import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final Icon icon;
  final TextEditingController? controller;
  //final Widget? widget;
  const InputField({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenWidth * 0.025,
        horizontal: screenWidth * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyLarge,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      BorderSide(color: theme.colorScheme.primary, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide:
                      BorderSide(color: theme.colorScheme.secondary, width: 4)),
              prefixIcon: icon,
              prefixIconColor: theme.colorScheme.primary,
              hintText: hint,
              fillColor: theme.colorScheme.primary,
              hintStyle: theme.textTheme.bodyMedium,
              contentPadding:
                  EdgeInsets.symmetric(vertical: screenWidth * 0.025),
            ),
          ),
        ],
      ),
    );
  }
}
