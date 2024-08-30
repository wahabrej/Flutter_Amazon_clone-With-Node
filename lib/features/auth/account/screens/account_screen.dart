import 'package:amazon_clone/features/auth/widget/Topberbtutton.dart';
import 'package:amazon_clone/features/auth/widget/bellow_app_ber.dart';
import 'package:amazon_clone/features/auth/widget/order.dart';
import 'package:amazon_clone/features/auth/widget/top_button.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/global_variables.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Column(
            // Align text to the start
            children: [
              Container(
                //margin: EdgeInsets.only(top: 10),
                //  padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "images/amazon_in.png",
                      height: 50, // Adjust height as needed
                      width: 100, // Adjust width as needed
                    ),
                    Row(
                      children: const [
                        Icon(Icons.notifications),
                        SizedBox(width: 30),
                        Icon(Icons.search),
                      ],
                    ),
                  ],
                ),
              ),
              // Add spacing between the rows
            ],
          ),
        ),
        body: Column(
          children: [
            BelwAppBar(),
            TopButtons(),
            SizedBox(
              height: 20,
            ),
            Orders(),
          ],
        ));
  }
}
