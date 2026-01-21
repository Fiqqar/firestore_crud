import 'package:firestore_crud/component/custom_card.dart';
import 'package:firestore_crud/controllers/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodListPage extends StatelessWidget {
  FoodListPage({super.key});
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Makanan")),
      body: ListView(
        children: [
          CustomCard(
            name: "iziz",
            description: "aziz",
            price: 1000,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ],
          ),
        ],
      ),

         floatingActionButton: FloatingActionButton(
        onPressed: () {
          // nanti ke halaman add / dialog
          print("Tambah makanan");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
