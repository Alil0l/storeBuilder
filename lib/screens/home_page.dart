import 'package:flutter/material.dart';
import 'package:store/models/products_model.dart';
import 'package:store/services/products_service.dart';

import '../widgets/shop_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_basket),
              color: Colors.black,
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'New on Trend',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.school),
              icon: Icon(Icons.school_outlined),
              label: 'School',
            ),
          ],
        ),
        body: FutureBuilder<List<ProductsModel>>(
          future: ProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductsModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return ShopCard(product: products[index]);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
