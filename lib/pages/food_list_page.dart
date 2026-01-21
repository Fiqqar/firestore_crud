import 'package:firestore_crud/component/custom_card.dart';
import 'package:flutter/material.dart';

class FoodListPage extends StatelessWidget {
  FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    // breakpoints
    final bool isMobile = width < 600;
    final int crossAxisCount = width >= 900
        ? 3
        : width >= 600
        ? 2
        : 1;

    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Makanan")),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: isMobile ? 3.2 : 3,
        ),
        itemBuilder: (context, index) {
          return CustomCard(
            name: "Makanan $index",
            description: "Deskripsi makanan",
            price: 1000,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Tambah makanan");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
