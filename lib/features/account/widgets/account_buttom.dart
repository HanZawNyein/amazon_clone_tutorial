import 'package:flutter/material.dart';

class AccountButtom extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AccountButtom({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black.withOpacity(0.03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              )),
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
