import 'package:store/helper/api.dart';
import 'package:store/models/products_model.dart';

class ProductsService {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductsModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductsModel.fromJson(data[i]));
    }
    return productsList;
  }
}
