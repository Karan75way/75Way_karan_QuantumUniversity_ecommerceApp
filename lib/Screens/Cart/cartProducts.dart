import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Orders/orderPlacingPage.dart';
import 'package:provider/provider.dart';

import '../../Provider/cartProvider.dart';
import '../../Styles/colors.dart';

class CartProductsList extends StatefulWidget {
  const CartProductsList({super.key});

  @override
  State<CartProductsList> createState() => _CartProductsListState();
}

class _CartProductsListState extends State<CartProductsList> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    List<Map<String, dynamic>> cartItems = cartProvider.cartItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(product: cartItems[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product['name'],
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '\$${product['price'].toString()}',
                  style: const TextStyle(fontSize: 14.0, color: Colors.green),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OrderPlacingPage(product: product)));
                    },
                    child: Text(
                      "Buy",
                      style: TextStyle(color: white),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: MaterialButton(
                    onPressed: () {
                      cartProvider.removeFromCart(product['id']);
                    },
                    child: Row(
                      children: [
                        Text(
                          "remove",
                          style: TextStyle(color: white),
                        ),
                        Icon(
                          Icons.delete,
                          color: white,
                        )
                      ],
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
