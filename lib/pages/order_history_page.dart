import 'package:flutter/material.dart';
import 'package:logistics_customer_app/pages/new_item_page.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  List<Order> _orders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('قائمة الطلبات')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_orders[index].itemName),
                    subtitle: Text(_orders[index].itemDescription),
                    trailing: Text(_orders[index].itemSize),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewItemPage()),
                );
              },
              child: Text('إضافة طلب جديد'),
            ),
          ],
        ),
      ),
    );
  }
}

class Order {
  String itemName;
  String itemDescription;
  String itemSize;

  Order(
      {required this.itemName,
      required this.itemDescription,
      required this.itemSize});
}
