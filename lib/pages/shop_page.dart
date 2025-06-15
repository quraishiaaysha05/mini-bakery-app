import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_shopping_app/constants.dart';
import 'package:mini_shopping_app/model/cart_model.dart';
import 'package:mini_shopping_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 12, top: 20),
            child: Text(
              'Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 12, top: 15),
                child:
                    //  Icon(Icons.shopping_cart_outlined, size: 30)
                    Image.asset('assets/shopping-cart.png', height: 70),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Row(
            //     children: [
            //       Text('Hello'),
            //       GestureDetector(
            //         onTap: () => Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => CartPage(),
            //           ),
            //         ),
            //         child: Image.asset('assets/shopping-cart.png', height: 45),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Craving something sweet?',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Pick Your Treats',
                style: GoogleFonts.notoSerif(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                  // thickness: 3.5,
                  ),
            ),
            SizedBox(height: 22),
            Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
              return GridView.builder(
                padding: EdgeInsets.all(12),
                itemCount: value.shopItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  return GroceryItemTile(
                    itemName: value.shopItems[index][0],
                    itemPrice: value.shopItems[index][1],
                    imgPath: value.shopItems[index][2],
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false)
                          .addItemToCart(index);
                    },
                  );
                },
              );
            }))
          ],
        ),
      ),
    );
  }
}
