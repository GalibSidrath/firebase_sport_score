import 'package:firebase_1st_project/firebase_options.dart';
import 'package:firebase_1st_project/screen/football_score_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FirebaseFootball());
}

class FirebaseFootball extends StatelessWidget {
  const FirebaseFootball({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FootballScore(),
    );
  }
}
