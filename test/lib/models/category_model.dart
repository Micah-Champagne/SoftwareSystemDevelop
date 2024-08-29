import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCats() {
    List<CategoryModel> cats = [];

    cats.add(CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icons/salad-svgrepo-com.svg',
        boxColor: Color(0xff92A3FD)));

    cats.add(CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icons/cake-tall-svgrepo-com.svg',
        boxColor: Color(0xffC58BF2)));

    cats.add(CategoryModel(
        name: 'Pie',
        iconPath: 'assets/icons/pie-dessert-food-svgrepo-com.svg',
        boxColor: Color(0xff9DCEFF)));

    cats.add(CategoryModel(
        name: 'Smoothies',
        iconPath: 'assets/icons/strawberry-smoothie-svgrepo-com.svg',
        boxColor: Color(0xffEEA4CE)));

    return cats;
  }
}
