import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/features/account/widgets/signle_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    {
      "image":
          "https://images.unsplash.com/flagged/photo-1573603867003-89f5fd7a7576?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3w2NDg5Njg4OHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
    },
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1675035675328-137d88c6c62c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3xrWU5BMmVXM3pBb3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
    },
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1675034805285-ede81a5d3f0f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NHxrWU5BMmVXM3pBb3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Your Orders",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                "See all",
                style: TextStyle(
                    color: GlobalVariables.selectedNavBarColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(
                  image: list[index]["image"],
                );
              }),
        )
      ],
    );
  }
}
