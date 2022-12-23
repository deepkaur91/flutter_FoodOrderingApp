import 'package:flutter/material.dart';
import 'package:foodie_app/model/food.dart';
import 'package:foodie_app/model/brand.dart';
import 'package:foodie_app/model/food_category.dart';
import 'package:get/get.dart';
import '../../other/app_data.dart';
import '../../other/app_theme.dart';
import '../../other/app_extension.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../controller/firebase_cls.dart';


class FoodController extends GetxController {
  RxInt currentBottomNavItemIndex = 0.obs;
  RxList<Food> cartFood = <Food>[].obs;
  RxList<Food> favoriteFood = <Food>[].obs;
  RxList<FoodCategory> categories = AppData.categories.obs;
  RxList<Food> filteredFoods = AppData.foodItems.obs;
  RxList<Brand> filteredBrands = AppData.brandItems.obs;
  RxDouble totalPrice = 0.0.obs;
  RxDouble subtotalPrice = 0.0.obs;
  Rx<ThemeData> theme = AppTheme.lightTheme.obs;
  bool isLightTheme = true;

  late DatabaseReference dbRef;

    void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  void increaseItem(Food food) {
    food.quantity++;
    update();
    calculateTotalPrice();
  }

  void decreaseItem(Food food) {
    food.quantity = food.quantity-- < 1 ? 0 : food.quantity--;
    calculateTotalPrice();
    update();
    if (food.quantity < 1) {
      cartFood.removeWhere((element) => element == food);
    }
  }

  String calculatePricePerEachItem(Food food) {
    double price = 0;
    price = food.quantity * food.price;
    return price.toString();
  }

  calculateTotalPrice() {
    totalPrice.value = 5;
    for (var element in cartFood) {
      totalPrice.value += element.quantity * element.price;
    }

    subtotalPrice.value = 0;
    if (totalPrice.value > 0) {
      subtotalPrice.value = totalPrice.value - 5;
    }
  }

  addToCart(Food food, BuildContext context) {
    if (food.quantity > 0) {

      // dbRef = FirebaseDatabase.instance.ref().child('CartFoodItems');
      double total = food.price * food.quantity;
      Map<String, String> addCart = {
        'name' : food.name,
        'price': food.price.toString(),
        'quantity': food.quantity.toString(),
        'total':total.toString()
      };
      FirebaseCls.insert_cart_data_(food, addCart);
      // dbRef.child('testingemail').child(food.name).push().set(addCart);


      cartFood.add(food);
      cartFood.assignAll(cartFood.distinctBy((item) => item));
      calculateTotalPrice();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Added to Cart"),
      ));
    }
  }


  filterItemByCategory(FoodCategory category) {
    for (var element in AppData.categories) {
      element.isSelected = false;
    }
    category.isSelected = true;

    if (category.type == FoodType.Chinese) {
      filteredFoods.assignAll(AppData.foodItems.obs);
    } else {
      filteredFoods.assignAll(AppData.foodItems.where((item) {
        return item.type == category.type;
      }).toList());
    }
    update();

    filteredFoods.refresh();
  }

  isFavoriteFood(Food food) {
    food.isFavorite = !food.isFavorite;
    update();
    if (food.isFavorite) {
      favoriteFood.add(food);
    }
    if (!food.isFavorite) {
      favoriteFood.removeWhere((element) => element == food);
    }
  }

  removeCartItemAtSpecificIndex(int index) {
    cartFood.removeAt(index);
    calculateTotalPrice();
    update();
  }

  void changeTheme() {
    if (theme.value == AppTheme.darkTheme) {
      theme.value = AppTheme.lightTheme;
      isLightTheme = true;
    } else {
      theme.value = AppTheme.darkTheme;
      isLightTheme = false;
    }
  }
}
