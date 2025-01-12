import 'package:flutter/material.dart';
import 'RegisterPage.dart';
import 'ResetPasswordPage.dart';
import 'HomePage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Contrôleurs pour les champs de texte
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Variable pour le checkbox
  bool rememberMe = false;

  // Fonction pour remplir les champs avec les données de l'utilisateur
  void fillFieldsWithSavedData() {
    if (rememberMe) {
      emailController.text = 'user@example.com'; // Exemple d'email enregistré
      passwordController.text =
          'password123'; // Exemple de mot de passe enregistré
    }
  }
  @override
  Widget build(BuildContext context) {
    // Remplir les champs avec les données de l'utilisateur (si le checkbox est activé)
    fillFieldsWithSavedData();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // // Logo ou Image (optionnel)
                // const SizedBox(height: 40),
                // Image.asset(
                //   'assets/logo.png', // Assurez-vous d'ajouter votre logo dans assets
                //   height: 120,
                // ),
                const SizedBox(height: 40),

                // Champ Email avec coin arrondi et ombre
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Champ Mot de Passe avec coin arrondi et ombre
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Checkbox "Se souvenir de moi"
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text('Remember me'),
                  ],
                ),

                const SizedBox(height: 16),

                // Bouton "Forgot Password"
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Naviguer vers la page ResetPasswordPage
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordPage(),
                        ),
                      );
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),

                const SizedBox(height: 24),

                // Bouton de Connexion avec animation
                ElevatedButton(
                  onPressed: () {
                    // Naviguer vers la HomePage après connexion
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 18)),
                ),

                const SizedBox(height: 16),

                // Bouton "Login with Google"
                ElevatedButton(
                  onPressed: () {
                    // Logique pour se connecter avec Google
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Logging in with Google...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .red, // Utilisez backgroundColor au lieu de primary
                  ),
                  child: const Text('Login with Google'),
                ),

                const SizedBox(height: 16),

                // Bouton pour créer un compte
                TextButton(
                  onPressed: () {
                    // Naviguer vers la page d'inscription
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text('Create an account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}