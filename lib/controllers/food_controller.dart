import 'package:firebase_database/firebase_database.dart';
import 'package:firestore_crud/models/food_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FoodController extends GetxController {
  var foodList = <FoodModel>[].obs;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  final dbRef = FirebaseDatabase.instance.ref().child('food');

  @override
  void onInit() {
    super.onInit();
    fetchFoods();
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.onClose();
  }

  void fetchFoods() {
    dbRef.onValue.listen((event) {
      final data = event.snapshot.value;

      foodList.clear();

      if (data != null) {
        if (data is Map) {
          data.forEach((key, value) {
            try {
              if (value is Map) {
                final mapValue = Map<String, dynamic>.from(value);
                foodList.add(FoodModel.fromMap(mapValue, key));
              }
            } catch (e) {
              print("Error converting value: $e");
            }
          });
        } else {
          print("Data snapshot is not a Map: $data");
        }
      }
    });
  }

  void setEditFood(FoodModel food) {
    nameController.text = food.name;
    descriptionController.text = food.description;
    priceController.text = food.price.toString();
  }

  Future<void> addFood(String name, String description, double price) async {
    final newRef = dbRef.push();
    await newRef.set({
      'name': name,
      'description': description,
      'price': price,
    });
  }

  Future<void> updateFood(FoodModel food) async {
    final price = double.tryParse(priceController.text.trim());

    if (price == null) {
      Get.snackbar(
        "Error",
        "Harga harus berupa angka",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    await dbRef.child(food.id).update({
      'name': nameController.text,
      'description': descriptionController.text,
      'price': price,
    });
  }

  Future<void> deleteFood(String id) async {
    await dbRef.child(id).remove();
  }
}
