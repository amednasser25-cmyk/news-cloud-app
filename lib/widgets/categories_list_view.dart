import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  final List<CategoryModel>categories = const[
  CategoryModel(categoryName: "business", image: "assets/business.avif"),
  CategoryModel(categoryName: "entertainment", image: "assets/entertaiment.avif"),
  CategoryModel(categoryName: "health", image: "assets/health.avif"),
  CategoryModel(categoryName: "science", image: "assets/science.avif"),
  CategoryModel(categoryName: "sports", image: "assets/sports.avif"),
  CategoryModel(categoryName: "technology", image: "assets/technology.jpeg"),
  CategoryModel(categoryName: "general", image: "assets/general.avif"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:categories.length ,
        itemBuilder: (context,index){
          return CategoryCard(category:categories[index] );
        }
        ),
    );
  }
}