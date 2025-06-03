import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hometest/data/local/user_dao.dart';
import 'package:hometest/repository/user_repository.dart';
import 'package:hometest/ui/home/home.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository = GetIt.instance<UserRepository>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> loading = ValueNotifier(false);
  final ValueNotifier<String?> error = ValueNotifier(null);

  LoginScreen({super.key});

  Future<void> _login(BuildContext context) async {
    loading.value = true;
    error.value = null;
    final email = emailController.text.trim();
    final password = passwordController.text;

    try {
      final userEntity = await _userRepository.getUser(email);
      if (userEntity == null) {
        error.value = 'User not found';
      } else if (userEntity.password != password) {
        error.value = 'Incorrect password';
      } else {
        // Authentication success
        final userModel = userEntity;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen(user: userModel)),
        );
      }
    } catch (e) {
      error.value = 'Login failed: $e';
    } finally {
      loading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              key: const Key('email_field'),
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              key: const Key('password_field'),
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<bool>(
              valueListenable: loading,
              builder: (context, isLoading, _) {
                if (isLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return ElevatedButton(
                    onPressed: () => {_login(context)},
                    child: const Text('Login'),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<String?>(
              valueListenable: error,
              builder: (context, err, _) {
                if (err != null && err.isNotEmpty) {
                  return Text(err, style: const TextStyle(color: Colors.red));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
