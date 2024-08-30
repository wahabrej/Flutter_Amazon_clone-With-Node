import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelwAppBar extends StatelessWidget {
  const BelwAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: 'Hello, ',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 22),
                children: [
                  TextSpan(
                      text: user.name,
                      style: TextStyle(fontSize: 23, color: Colors.black))
                ]),
          ),
        ],
      ),
    );
  }
}
