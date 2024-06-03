import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/product.dart';

class ProductTiles extends StatelessWidget {
  final Products product;
  ProductTiles(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,  // Set the desired width
      height: 400, // Set the desired height
      child: Card(
        child: ListView(
          shrinkWrap: true,
          children: [
            CachedNetworkImage(imageUrl: product.image!),
            SizedBox(height: 10),
            Text(product.title!),
            SizedBox(height: 10),
            Text("\$${product.price}"),
          ],
        ),
      ),
    );
  }
}



