import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/products_model.dart';

import '../helper/constants.dart';

class ShopCard extends StatelessWidget {
  ShopCard({super.key, required this.product});
  ProductsModel product;
  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width / 2.5;
    final double cardHeight = MediaQuery.of(context).size.height / 4.5;
    return Card(
      color: Colors.transparent,
      elevation: 10,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: List.filled(
                  6,
                  BoxShadow(
                    color: kShadowColor,
                    blurRadius: 2,
                    offset: Offset(-6, 4),
                    spreadRadius: 0.1,
                  )),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: cardWidth,
          height: cardHeight,
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: NetworkImage(product.image)),
              ),
              width: cardWidth,
              height: cardHeight / 1.5,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 4, 8, 0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      product.title.substring(0, 16),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Icon(FontAwesomeIcons.heart)
                ],
              ),
            )
          ])),
    );
  }
}
