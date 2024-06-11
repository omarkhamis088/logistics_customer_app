import 'package:flutter/material.dart';
import 'package:logistics_customer_app/pages/item_data_display_page.dart';

class NewItemPage extends StatefulWidget {
  const NewItemPage({super.key});

  @override
  _NewItemPageState createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  final _formKey = GlobalKey<FormState>();

  String _itemName = '';
  String _itemDescription = '';
  String _itemSize = '';
  String _operationType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('طلب جديد')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'اسم العنصر',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى ادخال اسم العنصر';
                    }
                    return null;
                  },
                  onSaved: (value) => _itemName = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'وصف العنصر',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى ادخال الوصف';
                    }
                    return null;
                  },
                  onSaved: (value) => _itemDescription = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'حجم العنصر',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى ادخال حجم العنصر';
                    }
                    return null;
                  },
                  onSaved: (value) => _itemSize = value!,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'نوع العنصر',
                    border: OutlineInputBorder(),
                  ),
                  value: _operationType != '' ? _operationType : null,
                  onChanged: (value) => setState(() => _operationType = value!),
                  items: const [

                    DropdownMenuItem(
                      value: 'شحن',
                      child: Text('شحن'),
                    ),
                    DropdownMenuItem(
                      value: 'شراء',
                      child: Text('شراء'),
                    ),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى تحديد نوع الطلب';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Navigate to item data display page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ItemDataDisplayPage(
                          itemName: _itemName,
                          itemDescription: _itemDescription,
                          itemSize: _itemSize,
                          operationType: _operationType,
                        )),
                      );
                    }
                  },
                  child: const Text('التالي'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}