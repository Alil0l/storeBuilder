import 'package:store/helper/api.dart';
import 'package:store/models/products_model.dart';

class CategoriesService {
  Future<List<ProductsModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductsModel> categoriesList = [];
    for (int i = 0; i < data.length; i++) {
      categoriesList.add(ProductsModel.fromJson(data[i]));
    }
    return categoriesList;
  }
}
