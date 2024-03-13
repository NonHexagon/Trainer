import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final String text;
  final String label;
  final Function()? onPressed;
  const NextPage({
    super.key,
    required this.text,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenWidth * 0.005,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(
            width: screenWidth * 0.05,
          ),
          TextButton(
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
            child: Center(
              child: Text(
                label,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
