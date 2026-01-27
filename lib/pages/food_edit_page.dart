import 'package:firestore_crud/colors/color.dart';
import 'package:firestore_crud/component/custom_textfield.dart';
import 'package:firestore_crud/controllers/food_controller.dart';
import 'package:firestore_crud/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FoodEditPage extends StatelessWidget {
  const FoodEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FoodController>();
    final foodArg = Get.arguments;

    if (foodArg == null || foodArg is! FoodModel) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.back();
        Get.snackbar(
          'Error',
          'Data makanan tidak ditemukan',
          snackPosition: SnackPosition.BOTTOM,
        );
      });
      return const Scaffold();
    }

    final FoodModel food = foodArg;
    controller.setEditFood(food);

    final isWideScreen = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Edit Makanan",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: isWideScreen ? 420 : double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  controller: controller.nameController,
                  label: "Nama Makanan",
                  hint: "Nama makanan",
                  keyboardType: TextInputType.text,
                  icon: Icons.restaurant,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  controller: controller.descriptionController,
                  label: "Deskripsi",
                  hint: "Deskripsi makanan",
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  icon: Icons.notes,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  controller: controller.priceController,
                  label: "Harga",
                  hint: "Harga makanan",
                  keyboardType: TextInputType.number,
                  icon: Icons.payments,
                ),

                const SizedBox(height: 28),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () async {
                    await controller.updateFood(
                      FoodModel(
                        id: food.id,
                        name: controller.nameController.text,
                        description: controller.descriptionController.text,
                        price: double.parse(controller.priceController.text),
                      ),
                    );

                    Get.back();
                    Get.snackbar(
                      'Sukses',
                      'Makanan berhasil diupdate',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
