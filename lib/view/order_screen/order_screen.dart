import 'package:flutter/material.dart';

import '../../core/widgets/custom_button.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late String name;
  late String subtitle;
  late String orderImage;
  late double price;
  String selectedSize = 'M';
  int quantity = 1;

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    name = args['name'];
    subtitle = args['subtitle'];
    orderImage = args['orderImage'];
    price = args['price'];
    super.didChangeDependencies();
  }

  void _selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
            ),
            SizedBox(height: 16),
            Image.asset(orderImage),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['S', 'M', 'L'].map((size) {
                return GestureDetector(
                  onTap: () => _selectSize(size),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: selectedSize == size
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(size),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _decrementQuantity,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF0B3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                        Text('-', style: TextStyle(color: Color(0xFFFF8B00))),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  '$quantity',
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: _incrementQuantity,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF0B3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                        Text('+', style: TextStyle(color: Color(0xFFFF8B00))),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                    ),
                  ],
                ),
                CustomButton(
                  onTap: () {
                    // Add to Order functionality
                  },
                  buttonText: 'Add to Order',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
