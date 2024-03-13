import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  const SendButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenWidth * 0.05,
        horizontal: screenWidth * 0.05,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return theme.colorScheme.secondary;
              } else {
                return theme.colorScheme.primary;
              }
            },
          ),
        ),
        child: Container(
          height: screenHeight * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Center(
            child: Text(
              label,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
