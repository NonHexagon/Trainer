import 'package:flutter/material.dart';
import 'package:sport_app/features/auth/widgets/input_field.dart';
import 'package:sport_app/features/auth/widgets/next_page.dart';
import 'package:sport_app/features/auth/widgets/send_button.dart';
import 'package:sport_app/features/auth/widgets/switch_button_theme.dart';
import 'package:sport_app/repositories/auth/auth_repository.dart';
import 'package:sport_app/repositories/auth/models/auth_model.dart';

class SignUpScreen extends StatelessWidget {
  final AuthRepository? authRepository;
  const SignUpScreen({super.key, this.authRepository});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        leading: const SwitchThemeButton(),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              color: theme.colorScheme.primary,
              Icons.lock_open_outlined,
              size: width * 0.25,
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Text(
              'Hello, master!',
              style: theme.textTheme.bodyLarge,
            ),
            InputField(
              title: 'Username',
              hint: 'Enter your username',
              icon: const Icon(Icons.account_circle),
              controller: usernameController,
            ),
            InputField(
              title: 'Email',
              hint: 'Enter your email',
              icon: const Icon(Icons.email),
              controller: emailController,
            ),
            InputField(
              title: 'Password',
              hint: 'Enter your password',
              icon: const Icon(Icons.security),
              controller: passwordController,
            ),
            InputField(
              title: 'Confirm password',
              hint: 'Enter your confirm password',
              icon: const Icon(Icons.security),
              controller: confirmPasswordController,
            ),
            SendButton(
              label: 'Sign Up',
              onPressed: () {
                final authData = AuthModel(
                  username: usernameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
                authRepository?.postUserData(authData);
              },
            ),
            NextPage(
              text: 'Registered?',
              label: 'Login now',
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
