import 'package:flutter/material.dart';
import 'LoginPage.dart';
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // Simuler un délai (par exemple, récupération de données ou initialisation de l'app)
    Future.delayed(const Duration(seconds: 3), () {
      // Naviguer vers la page de login après le délai
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo ou icône avec fond bleu
            const Icon(
              Icons
                  .calendar_month, // Vous pouvez remplacer par un logo personnalisé
              size: 100,
              color: Colors.blue, // Couleur bleue pou r l'icône
            ),
            const SizedBox(
                height: 20), // Espacement avant l'indicateur de chargement

            // Indicateur de chargement avec couleur bleue
            const LinearProgressIndicator(
              color: Colors.blue, // Indicateur de chargement en bleu
            ),
            const SizedBox(
                height: 20), // Espacement entre l'indicateur et le texte

            // Texte "Loading..." en bleu
            Text(
              'Student Planner',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600, // Texte en gras
                color: Colors.blue[600], // Texte bleu foncé
              ),
            ),
          ],
        ),
      ),
    );
  }
}