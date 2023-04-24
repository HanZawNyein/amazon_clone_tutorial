import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatefulWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  State<TopCategories> createState() => _TopCategoriesState();
}

class _TopCategoriesState extends State<TopCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
          itemCount: GlobalVariables.categoryImages.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 80,
          itemBuilder: (context, index) {
            // print("*");
            // print(GlobalVariables.categoryImages[index]['image']!);
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            );
          }),
    );
  }
}
