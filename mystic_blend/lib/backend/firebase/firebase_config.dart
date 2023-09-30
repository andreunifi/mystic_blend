import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA9xX6eWys8QJBTx6jbjV3NiO8IYA4NAZM",
            authDomain: "essentialoils-fc5cd.firebaseapp.com",
            projectId: "essentialoils-fc5cd",
            storageBucket: "essentialoils-fc5cd.appspot.com",
            messagingSenderId: "663942252909",
            appId: "1:663942252909:web:7eddada747d3ba6858b264",
            measurementId: "G-KT69F3D0NL"));
  } else {
    await Firebase.initializeApp();
  }
}
