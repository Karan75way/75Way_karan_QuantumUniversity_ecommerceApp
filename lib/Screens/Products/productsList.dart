import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/productAPI.dart';
import 'package:flutter_application_1/Screens/Cart/cartProducts.dart';
import 'package:flutter_application_1/Screens/Orders/orderHistoryPage.dart';
import 'package:flutter_application_1/Styles/colors.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:provider/provider.dart';

import '../../Provider/cartProvider.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartProductsList()));
              },
              icon: Icon(
                Icons.shopping_bag,
                color: white,
              )),
          Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(5)),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderHistorypage()));
                },
                child: Text(
                  "orders",
                  style: TextStyle(color: primaryColor),
                ),
              ))
        ],
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: productData.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(product: productData[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product['image_url'],
            height: 120.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product['name'],
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '\$${product['price'].toString()}',
              style: const TextStyle(fontSize: 14.0, color: Colors.green),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(5)),
              child: MaterialButton(
                onPressed: () {
                  CartProvider cartProvider =
                      Provider.of<CartProvider>(context, listen: false);
                  cartProvider.addToCart(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product['name']} added to cart.'),
                    ),
                  );
                },
                child: Text(
                  "add to cart",
                  style: TextStyle(color: white),
                ),
              ))
        ],
      ),
    );
  }
}
