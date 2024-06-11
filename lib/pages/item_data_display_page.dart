import 'package:flutter/material.dart';
import 'package:logistics_customer_app/pages/order_history_page.dart';

class ItemDataDisplayPage extends StatefulWidget {
  final String itemName;
  final String itemDescription;
  final String itemSize;
  final String operationType;

  ItemDataDisplayPage({
    required this.itemName,
    required this.itemDescription,
    required this.itemSize,
    required this.operationType,
  });

  @override
  _ItemDataDisplayPageState createState() => _ItemDataDisplayPageState();
}

class _ItemDataDisplayPageState extends State<ItemDataDisplayPage> {
  double _price = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('عرض بيانات العنصر')),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اسم العنصر:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(widget.itemName),
                    SizedBox(height: 16),
                    Text(
                      'وصف العنصر:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(widget.itemDescription),
                    SizedBox(height: 16),
                    Text(
                      'حجم العنصر:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(widget.itemSize),
                    SizedBox(height: 16),
                    Text(
                      'نوع العملية:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(widget.operationType),
                    SizedBox(height: 16),
                    Text(
                      'السعر:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('\$${_price.toStringAsFixed(2)}'),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Submit the data
                      },
                      child: Text('إرسال'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrderHistoryPage()),
                        );
                      },
                      child: Text('عرض تاريخ الطلبات'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}