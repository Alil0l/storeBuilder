import 'package:store/helper/api.dart';
import 'package:store/models/products_model.dart';

class AddProducut {
  Future<ProductsModel> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'url',
      body: {
        'title': title,
        'price': price,
        'desc': desc,
        'image': image,
        'category': category,
      },
    );
    return ProductsModel.fromJson(data);
  }
}
