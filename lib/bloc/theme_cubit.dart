import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/bloc/theme_state.dart';
import 'package:sport_app/theme/theme.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: lightTheme));

  void toggleTheme() {
    if (state.themeData == lightTheme) {
      final updateThemeDark = ThemeState(themeData: darkTheme);
      emit(updateThemeDark);
    } else {
      final updateThemeLight = ThemeState(themeData: lightTheme);
      emit(updateThemeLight);
    }
  }
}
