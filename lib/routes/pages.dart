import 'package:firestore_crud/bindings/food_binding.dart';
import 'package:firestore_crud/pages/food_add_page.dart';
import 'package:firestore_crud/pages/food_edit_page.dart';
import 'package:firestore_crud/pages/food_list_page.dart';
import 'package:firestore_crud/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.listPage,
      page: () => FoodListPage(),
      binding: FoodBinding(),
    ),
    GetPage(
      name: AppRoutes.editPage,
      page: () => FoodEditPage(),
      binding: FoodBinding(),
    ),
    GetPage(
      name: AppRoutes.addPage,
      page: () => FoodAddPage(),
      binding: FoodBinding(),
    ),
  ];
}
