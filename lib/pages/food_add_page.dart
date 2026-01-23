import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/food_controller.dart';

class FoodAddPage extends StatefulWidget {
  const FoodAddPage({super.key});

  @override
  State<FoodAddPage> createState() => _FoodAddPageState();
}

class _FoodAddPageState extends State<FoodAddPage> {
  final FoodController controller = Get.find<FoodController>();

  final TextEditingController nameC = TextEditingController();
  final TextEditingController descC = TextEditingController();
  final TextEditingController priceC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isWideScreen = size.width >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Food'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: isWideScreen ? 500 : double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isWideScreen ? 32 : 20,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: nameC,
                  decoration: const InputDecoration(
                    labelText: 'Food Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: descC,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: priceC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),

                ElevatedButton(
                  onPressed: () async {
                    await controller.addFood(
                      nameC.text,
                      descC.text,
                      double.parse(priceC.text),
                    );
                    Get.back();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
