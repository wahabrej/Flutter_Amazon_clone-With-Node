import 'package:flutter/material.dart';

class AccountBUtton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AccountBUtton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 40,
      width: 140, // Adjust the width as needed
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: OutlinedButton(
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
