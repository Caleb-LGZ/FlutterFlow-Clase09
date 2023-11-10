import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCNBMqk4-Q6KTnJq2recq5XJ1DqEns8ewE",
            authDomain: "semana08-19b39.firebaseapp.com",
            projectId: "semana08-19b39",
            storageBucket: "semana08-19b39.appspot.com",
            messagingSenderId: "929312885737",
            appId: "1:929312885737:web:29542b05d8c8d92cbb5978"));
  } else {
    await Firebase.initializeApp();
  }
}
