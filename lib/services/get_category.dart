import 'package:newsapp/models/category_model.dart';

List<CategoryModel> getcategory() {
  List<CategoryModel> categories = [];

  CategoryModel categoryModel = new CategoryModel();
  categoryModel.name = 'Business';
  categoryModel.image = 'assets/bus.jpg';

  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.name = 'EnterAnimate';
  categoryModel.image = 'assets/enter.jpg';

  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.name = 'General';
  categoryModel.image = 'assets/general.jpg';

  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = 'Health';
  categoryModel.image = 'assets/health.jpg';

  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.name = 'Sports';
  categoryModel.image = 'assets/sports.jpg';

  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  return categories;
}
