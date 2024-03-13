import 'package:sport_app/features/auth/view/login_screen.dart';
import 'package:sport_app/features/auth/view/signup_screen.dart';
import 'package:sport_app/repositories/auth/auth_repository.dart';

final routes = {
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => SignUpScreen(
        authRepository: AuthRepository(),
      ),
};
