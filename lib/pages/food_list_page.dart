import 'package:firestore_crud/component/custom_card.dart';
import 'package:flutter/material.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Makanan")),
      body: ListView(
        children: const [
          CustomCard(name: "iziz", description: "aziz", price: 1000),
        ],
      ),
    );
  }
}
