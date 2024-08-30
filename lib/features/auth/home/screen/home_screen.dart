import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/home/screen/widget/AddressBox.dart';
import 'package:amazon_clone/features/auth/home/screen/widget/carosal_image.dart';
import 'package:amazon_clone/features/auth/home/screen/widget/deal_of_day.dart';
import 'package:amazon_clone/features/auth/home/screen/widget/top_category.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: GlobalVariables.appBarGradient,
          ),
        ),
        title: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child:
                                const Icon(Icons.search, color: Colors.black),
                          ),
                          hintText: 'Search...',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 10),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a search term';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: const Icon(Icons.mic, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(
              height: 10,
            ),
            TopCategory(),
            SizedBox(
              height: 10,
            ),
            CarosalImage(),
            SizedBox(height: 10,),
            DealsOfTheDay(),
          ],
        ),
      ),
    );
  }
}
