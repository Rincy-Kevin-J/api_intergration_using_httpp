import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductTiles extends StatelessWidget {
  final Products product;
  ProductTiles(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
                imageUrl: product.image!),
          ),
          const SizedBox(height: 10,),
          Text(product.title!,
            maxLines: 2,
          ),
          Text('\$${product.price}',)
        ],
      ),
    );
  }
}
