import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Orders/orderHistoryPage.dart';
import 'package:provider/provider.dart';
import '../../Provider/orderHistoryProvider.dart';
import '../../Styles/colors.dart';

class OrderPlacingPage extends StatefulWidget {
  final product;

  const OrderPlacingPage({Key? key, required this.product}) : super(key: key);

  @override
  State<OrderPlacingPage> createState() => _OrderPlacingPageState();
}

class _OrderPlacingPageState extends State<OrderPlacingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Place Order',
          style: TextStyle(color: white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: UserCard(product: widget.product),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final Map<String, dynamic> product;

  UserCard({required this.product});

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
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '\$${product['price'].toString()}',
              style: TextStyle(fontSize: 14.0, color: Colors.green),
            ),
          ),
          Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(5)),
              child: MaterialButton(
                onPressed: () {
                  _showPlaceOrderDialog(context, product);
                },
                child: Text(
                  "Place Order",
                  style: TextStyle(color: white),
                ),
              ))
        ],
      ),
    );
  }

  Future<void> _showPlaceOrderDialog(
      BuildContext context, Map<String, dynamic> product) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Place Order'),
          content:
              Text('Do you want to place an order for ${product['name']}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final orderHistoryProvider =
                    Provider.of<OrderHistoryProvider>(context, listen: false);
                orderHistoryProvider.addToOrderHistory(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product['name']} added to order history.'),
                  ),
                );

                Navigator.of(context).pop();
              },
              child: Text('Place Order'),
            ),
          ],
        );
      },
    );
  }
}
