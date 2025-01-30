import 'package:flutter/material.dart';
import 'CreateNewPasswordPage.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Check your email',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'We sent a reset link to contact@dscode...com\n'
              'Enter the 5-digit code mentioned in the email',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Code Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) => SizedBox(
                  width: 50,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      counterText: '',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Verify Button
            ElevatedButton(
              onPressed: () {
                // Ajouter la logique de vérification ici
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateNewPasswordPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Verify Code',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Resend Email Option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Haven't got the email yet? "),
                GestureDetector(
                  onTap: () {
                    // Ajouter la logique pour renvoyer l'email
                  },
                  child: const Text(
                    'Resend email',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
