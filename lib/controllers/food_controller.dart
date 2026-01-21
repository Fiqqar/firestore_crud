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

  void fetchFoods() {
    dbRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        foodList.value = data.entries
            .map((e) => FoodModel.fromMap(e.value, e.key))
            .toList();
      } else {
        foodList.clear();
      }
    });
  }

  void setEditFood(FoodModel food){
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
    await dbRef.child(food.id).update({
      'name' : nameController.text,
      'description' : descriptionController,
      'price' : double.parse(priceController.text)
    });
  }

  Future<void> deleteFood(String id) async {
    await dbRef.child(id).remove();
  }
}
