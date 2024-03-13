import 'package:flutter/material.dart';
import 'package:sport_app/features/auth/widgets/input_field.dart';
import 'package:sport_app/features/auth/widgets/next_page.dart';
import 'package:sport_app/features/auth/widgets/send_button.dart';
import 'package:sport_app/features/auth/widgets/switch_button_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
              Icons.lock_outline,
              size: width * 0.25,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              'Welcome back, master!',
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
            SendButton(
              label: 'Sign In',
              onPressed: () {},
            ),
            NextPage(
              text: 'Not a registered?',
              label: 'Register now',
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
