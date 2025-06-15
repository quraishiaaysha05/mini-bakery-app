import 'package:flutter/material.dart';
import 'package:mini_shopping_app/model/cart_model.dart';
import 'package:mini_shopping_app/pages/welcome_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        title: 'Mini Shopping App',
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      ),
    );
  }
}
