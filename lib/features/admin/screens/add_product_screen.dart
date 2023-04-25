import 'dart:io';

import 'package:amazon_clone_tutorial/common/widgets/custom_button.dart';
import 'package:amazon_clone_tutorial/common/widgets/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';

  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  String categories = 'Mobiles';
  List<File> images = [];
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  void selectImages() async {
    var res = await pickImages();
    // print("Hello");
    setState(() {
      images = res;
    });
  }

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
              centerTitle: true,
              title: Text(
                "Add Product",
                style: TextStyle(color: Colors.black),
              ))),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10.0),
                    dashPattern: [10, 4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.folder_open,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Select Product Images",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade400),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomTextField(
                    controller: productNameController,
                    hintText: "Product Name"),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(
                    controller: descriptionController,
                    hintText: "Description Name",
                    maxLines: 7),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(
                    controller: priceController, hintText: "Price Name"),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(
                    controller: quantityController, hintText: "Quantity Name"),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: categories,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        categories = newVal!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomButton(
                  text: 'Sell',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
