import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../utils/routes/routes_name.dart';

class LoginViewModel with ChangeNotifier {
  bool isError = false; // Flag to track sign-in errors

  // Method to sign in with email and password
  Future<void> signInWithEmailAndPassword(String email, String password, context) async {
    // Show loading indicator while fetching data
    EasyLoading.show(
      status: "Fetching Data",
      maskType: EasyLoadingMaskType.black,
    );

    // Print email and password for debugging
    print(email);
    print(password);

    try {
      // Sign in with email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Dismiss loading indicator after successful sign-in
      EasyLoading.dismiss();

      // Navigate to the courses page after successful sign-in
      Navigator.pushReplacementNamed(context, RoutesName.courses);

      // Print sign-in success message
      print('User signed in successfully');
    } catch (e) {
      // Set error flag to true and notify listeners
      isError = true;
      notifyListeners();

      // Dismiss loading indicator in case of errors
      EasyLoading.dismiss();

      // Print error message
      print('Error signing in: $e');
    }
  }
}
