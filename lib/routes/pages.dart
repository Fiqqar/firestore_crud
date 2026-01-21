import 'package:firestore_crud/pages/food_list_page.dart';
import 'package:firestore_crud/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
   GetPage(name: AppRoutes.listPage, page: () => FoodListPage())
  ];
}