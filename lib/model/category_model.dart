class CategoryModel {
  final String categoryImage;
  final String categoryName;

  CategoryModel({required this.categoryImage, required this.categoryName});
}

final List<CategoryModel> categoryModel = [
  CategoryModel(
    categoryImage: "assets/icons/sandwich.svg",
    categoryName: "Sandwich",
  ),
  CategoryModel(
    categoryImage: "assets/icons/pizaa.svg",
    categoryName: "Pizza",
  ),
  CategoryModel(
    categoryImage: "assets/icons/burgers.svg",
    categoryName: "Burgers",
  ),
];
