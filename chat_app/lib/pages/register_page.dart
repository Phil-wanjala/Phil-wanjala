import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  // email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;


  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) {
    // get auth service
    final auth = AuthService();

    // check if password and confirm password match
    if (_pwController.text == _confirmPwController.text) {
      try {
        auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
      // if password and confirm password do not match

    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords do not match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // welcome back message
            Text(
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // email verified
            TextField(
              
              obscureText: false,
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                )
              )
            ),

            const SizedBox(height: 10),

            //password verified
            TextField(
            obscureText: true,
            controller: _pwController,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              )
            )
            
            
            
            ),

            const SizedBox(height: 25),

            
            // confirm password
            TextField(
              
              obscureText: true,
              controller: _confirmPwController,
              decoration: InputDecoration(
                labelText: "Confirm password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),

            ),

            const SizedBox(height: 25),

            //register button
            GlowingButton(
              text: "Register",
              
              onPressed: () => register(context),
              style: GoogleFonts.inter()
            ),

            const SizedBox(height: 25),


            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
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