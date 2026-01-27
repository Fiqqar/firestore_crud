import 'package:firestore_crud/component/custom_card.dart';
import 'package:firestore_crud/controllers/food_controller.dart';
import 'package:firestore_crud/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodListPage extends StatelessWidget {
  FoodListPage({super.key});

  final controller = Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 600;
    final int crossAxisCount = width >= 900
        ? 3
        : width >= 600
        ? 2
        : 1;

    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Makanan")),
      body: Obx(() {
        if (controller.foodList.isEmpty) {
          return const Center(child: Text("Belum ada data"));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.foodList.length, 
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: isMobile ? 3.2 : 3,
          ),
          itemBuilder: (context, index) {
            final food = controller.foodList[index];

            return CustomCard(
              name: food.name,
              description: food.description,
              price: food.price,
              actions: [
                IconButton(
                  onPressed: () {
                    controller.deleteFood(food.id);
                  },
                  icon: const Icon(Icons.delete),
                ),
               IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.editPage, arguments: food);
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
