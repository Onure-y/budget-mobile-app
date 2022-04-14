import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String containerColor;
  @HiveField(1)
  String imagePath;
  @HiveField(2)
  String categoryName;
  @HiveField(3)
  String topCategoryName;

  CategoryModel({
    required this.containerColor,
    required this.imagePath,
    required this.categoryName,
    required this.topCategoryName,
  });
}
