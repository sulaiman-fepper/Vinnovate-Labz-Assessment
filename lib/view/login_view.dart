import 'package:assessment/utils/custom_style.dart';
import 'package:assessment/utils/strings.dart';
import 'package:assessment/widgets/textlabels/right_aligned_label.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../view_model/login_view_model.dart';
import '../widgets/buttons/primary_button_widget.dart';
import '../widgets/custom_size.dart';
import '../widgets/textlabels/error_label.dart';
import '../widgets/textlabels/text_lable_widget.dart';
import '../widgets/textfields/input_password_widget.dart';
import '../widgets/textfields/input_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}); // Constructor

  final _formKey = GlobalKey<FormBuilderState>(); // Form key
  final _formData = FormData(); // Form data model

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false); // Access login view model
    var width = MediaQuery.of(context).size.width; // Get screen width

    return Scaffold(
      backgroundColor: Color(0XFFf6f9fa), // Background color
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0, // No elevation
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              CustomSize.heightBetween(), // Custom height spacer
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.06), // Container margin
                width: width, // Set container width to screen width
                decoration: BoxDecoration(
                  color: Colors.white, // Container background color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Column(
                  children: [
                    CustomSize.heightBetween(), // Custom height spacer
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000.0), // Circular image border radius
                      child: Image.asset(
                        "assets/images/login2.png", // Image asset
                        height: 100.0,
                        width: 100.0,
                      ),
                    ),
                    Text(
                      Strings.loginHeader, // Login header text
                      style: CustomStyle.loginHeaderStyle, // Custom text style
                    ),
                    CustomSize.heightBetween(), // Custom height spacer
                    FormBuilder(
                      key: _formKey, // Form key
                      child: Column(
                        children: [
                          TextLabelWidget(
                            text: Strings.emailLabel, // Email label text
                          ),
                          Consumer<LoginViewModel>(builder: (context, value, child) {
                            return InputTextFieldWidget(
                              name: Strings.emailLabel, // Input field name
                              controller: _formData.email, // Controller for email input
                              hintText: Strings.emailLabel, // Hint text
                              icon: Icons.email_outlined, // Icon
                              onChanged: (val) {
                                value.isError = false; // Reset error status
                                value.notifyListeners(); // Notify listeners
                              },
                            );
                          }),
                          TextLabelWidget(
                            text: Strings.passwordLabel, // Password label text
                          ),
                          Consumer<LoginViewModel>(builder: (context, value, child) {
                            return InputPasswordWidget(
                              name: Strings.passwordLabel, // Input field name
                              controller: _formData.password, // Controller for password input
                              hintText: Strings.passwordLabel, // Hint text
                              icon: Icons.lock_outline, // Icon
                              onChanged: (val) {
                                value.isError = false; // Reset error status
                                value.notifyListeners(); // Notify listeners
                              },
                            );
                          }),
                          RightAlignedLabelWidget(
                            text: Strings.forgetPassword, // Forget password label text
                          ),
                          PrimaryButtonWidget(
                            title: Strings.loginHeader, // Login button text
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _formKey.currentState!.save(); // Save form data
                                loginViewModel.signInWithEmailAndPassword(_formData.email.text, _formData.password.text, context); // Perform login action
                              }
                            },
                          ),
                          Consumer<LoginViewModel>(builder: (context, value, child) {
                            return Column(
                              children: [
                                if (value.isError)
                                  ErrorLabelWidget(
                                    text: Strings.forgetPassword, // Error label text
                                  ),
                                if (value.isError) CustomSize.heightBetween(), // Spacer if error
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomSize.heightBetween(), // Custom height spacer
              Text.rich(
                TextSpan(
                  text: Strings.newAccount, // New account text
                  style: TextStyle(color: Colors.grey), // Text color
                  children: [
                    TextSpan(
                      text: Strings.signUpLabel, // Sign up text
                      style: TextStyle(
                        color: Colors.black, // Text color
                        fontWeight: FontWeight.w500, // Font weight
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle sign up action
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FormData {
  TextEditingController email = TextEditingController(); // Email controller
  TextEditingController password = TextEditingController(); // Password controller
}