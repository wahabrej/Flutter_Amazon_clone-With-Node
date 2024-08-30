import 'package:amazon_clone/features/auth/widget/Topberbtutton.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AccountBUtton(text: "Your Orders", onTap: () {}),
            AccountBUtton(text: "Turn Seller", onTap: () {})
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AccountBUtton(text: "Log Out", onTap: () {}),
            AccountBUtton(text: "List Seller", onTap: () {})
          ],
        ),
      ],
    );
  }
}
