import 'package:fitness/pages/home/models/category_model.dart';
import 'package:fitness/pages/home/models/diet_model.dart';
import 'package:fitness/pages/home/models/popular_model.dart';
import 'package:fitness/pages/home/widgets/categories.dart';
import 'package:fitness/pages/home/widgets/diet.dart';
import 'package:fitness/pages/home/widgets/header.dart';
import 'package:fitness/pages/home/widgets/popular_diets.dart';
import 'package:fitness/pages/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  List<DietModel> diets = [];

  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();

    return Scaffold(
      appBar: const Header(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SearchField(),
          const SizedBox(
            height: 40,
          ),
          CategoriesWidget(categories: categories),
          const SizedBox(
            height: 40,
          ),
          DietWidget(diets: diets),
          const SizedBox(
            height: 40,
          ),
          PopularDietsWidget(popularDiets: popularDiets)
        ],
      ),
    );
  }
}
