import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/bloc/theme_cubit.dart';
import 'package:sport_app/bloc/theme_state.dart';
import 'package:sport_app/router/router.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return MaterialApp(
          theme: state.themeData,
          routes: routes,
          initialRoute: '/login',
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
