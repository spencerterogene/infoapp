import 'package:flutter/material.dart';
import 'CreateNewPasswordPage.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your email to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Simuler l'envoi d'un email (ajouter la logique réelle si nécessaire)
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateNewPasswordPage(),
                  ),
                );
              },
              child: const Text('Send Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}