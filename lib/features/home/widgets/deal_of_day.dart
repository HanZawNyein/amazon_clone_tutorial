import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, top: 15),
            child: Text(
              "Deal of the Day",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Image.network(
            "https://plus.unsplash.com/premium_photo-1678401469746-0afcfed818c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw3MmFhaWZDSjBTa3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
            height: 235,
            fit: BoxFit.fitHeight,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, top: 5, right: 40),
            alignment: Alignment.topLeft,
            child: Text(
              "\$ 500.0",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 15, top: 5, right: 40),
            child: Text(
              "Rivaan",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https://plus.unsplash.com/premium_photo-1678401337531-87cede7f059a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3MmFhaWZDSjBTa3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://plus.unsplash.com/premium_photo-1678401337531-87cede7f059a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3MmFhaWZDSjBTa3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://plus.unsplash.com/premium_photo-1678401337531-87cede7f059a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3MmFhaWZDSjBTa3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://plus.unsplash.com/premium_photo-1678401337531-87cede7f059a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3MmFhaWZDSjBTa3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://plus.unsplash.com/premium_photo-1678401337531-87cede7f059a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3MmFhaWZDSjBTa3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text(
              "See All deals",
              style: TextStyle(color: Colors.cyan[800]),
            ),
          )
        ],
      ),
    );
  }
}
