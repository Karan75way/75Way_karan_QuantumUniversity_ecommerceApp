import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/cartProvider.dart';
import 'package:flutter_application_1/Provider/orderHistoryProvider.dart';
import 'package:provider/provider.dart';

import '../../Styles/colors.dart';

class OrderHistorypage extends StatefulWidget {
  const OrderHistorypage({super.key});

  @override
  State<OrderHistorypage> createState() => _OrderHistorypageState();
}

class _OrderHistorypageState extends State<OrderHistorypage> {
  @override
  Widget build(BuildContext context) {
    final orderHistoryProvider = Provider.of<OrderHistoryProvider>(context);
    List<Map<String, dynamic>> orderItems = orderHistoryProvider.orderItems;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: orderItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(product: orderItems[index]);
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
        ],
      ),
    );
  }
}
