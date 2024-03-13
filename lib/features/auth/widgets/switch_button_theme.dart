import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/bloc/theme_cubit.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: () {
        final themeCubit = context.read<ThemeCubit>();
        themeCubit.toggleTheme();
      },
      icon: const Icon(Icons.dark_mode),
      color: theme.colorScheme.primary,
    );
  }
}
