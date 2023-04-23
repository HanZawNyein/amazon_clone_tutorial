import 'package:flutter/material.dart';

import 'account_buttom.dart';

class TopBottom extends StatefulWidget {
  const TopBottom({Key? key}) : super(key: key);

  @override
  State<TopBottom> createState() => _TopBottomState();
}

class _TopBottomState extends State<TopBottom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButtom(text: "Your Orders", onTap: () {},),
            AccountButtom(text: "Turn Sellers", onTap: () {},),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            AccountButtom(text: "Logout", onTap: () {},),
            AccountButtom(text: "Your Wish List", onTap: () {},),
          ],
        ),
      ],
    );
  }
}
