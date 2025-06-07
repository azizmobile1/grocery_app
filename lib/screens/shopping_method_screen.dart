import 'package:flutter/material.dart';

class ShoppingMethodScreen extends StatefulWidget {
  const ShoppingMethodScreen({super.key});

  @override
  State<ShoppingMethodScreen> createState() => _ShoppingMethodScreenState();
}

class _ShoppingMethodScreenState extends State<ShoppingMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Shopping Method Screen")));
  }
}
