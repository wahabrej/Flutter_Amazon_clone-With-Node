import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              'Delivery to ${user.name} -${user.address}',
              style: TextStyle(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: const Icon(Icons.arrow_drop_down),
          )
        ],
      ),
    );
  }
}
