import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:flutter/material.dart';

import '../widgets/below_app_bar.dart';
import '../widgets/orders.dart';
import '../widgets/top_bottom.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/images/amazon_in.png",
                    width: 120,
                    height: 45,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 15,
                        ),
                        child: Icon(Icons.notifications),
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                )
              ],
            ),
          )),
      body: Column(
        children: [
          BelowAppBar(),
          SizedBox(
            height: 10.0,
          ),
          TopBottom(),
          SizedBox(
            height: 20.0,
          ),
          Orders(),
        ],
      ),
    );
  }
}
