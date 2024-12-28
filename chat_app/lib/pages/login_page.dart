import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {

  // email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;



  LoginPage({super.key, required this.onTap});

  // login method
  void login(BuildContext context) async{
    // auth service
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text,);

    }

    // catch any errors
    catch (e){
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (context) => AlertDialog(title: Text(e.toString()),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.local_hospital_sharp,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // welcome back message
            Text(
              "Welcome dear patient",
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
                labelStyle: GoogleFonts.inter(),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10,)
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
              labelStyle: GoogleFonts.inter(),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              )
            ),
            ),

            const SizedBox(height: 25),

            //login button
            GlowingButton(
              text: "Login",
              onPressed: () => login(context),
              style: GoogleFonts.inter(),
            ),

            const SizedBox(height: 25),


            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
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