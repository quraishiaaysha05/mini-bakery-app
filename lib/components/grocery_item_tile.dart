import 'package:flutter/material.dart';
import 'package:mini_shopping_app/constants.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imgPath;
  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imgPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
          // margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.brown[100],
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // img
              Image.asset(
                imgPath,
                height: 70,
              ),

              // name
              Text(
                itemName,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              MaterialButton(
                onPressed: onPressed,
                color: Colors.brown[800],
                child: Text(
                  '\$$itemPrice',
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
