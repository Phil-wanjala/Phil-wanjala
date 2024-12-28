import 'package:flutter/material.dart';

class GlowingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GlowingButton({
    super.key,
    required this.text,
    required this.onPressed, required TextStyle style,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,),
      decoration: BoxDecoration (
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurpleAccent.withOpacity(0.7),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20,),
        
        child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),))
      )
    );
  }
}
