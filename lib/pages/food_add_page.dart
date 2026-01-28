import 'package:firestore_crud/colors/color.dart';
import 'package:firestore_crud/component/custom_textfield.dart';
import 'package:firestore_crud/controllers/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodAddPage extends StatelessWidget {
  FoodAddPage({super.key});

  final controller = Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Tambah Makanan",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width:controller.screenWidth,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  controller: controller.nameController,
                  label: "Nama Makanan",
                  hint: "Contoh: Ayam Geprek",
                  keyboardType: TextInputType.text,
                  icon: Icons.restaurant,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  controller: controller.descriptionController,
                  label: "Deskripsi",
                  hint: "Deskripsi singkat makanan",
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  icon: Icons.notes,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  controller: controller.priceController,
                  label: "Harga",
                  hint: "Contoh: 15000",
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
                    await controller.addFood(
                      controller.nameController.text,
                      controller.descriptionController.text,
                      double.parse(controller.priceController.text),
                    );
                    controller.nameController.clear();
                    controller.descriptionController.clear();
                    controller.priceController.clear();
                    Get.back();
                  },
                  child: const Text(
                    "Simpan",
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
