import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final ValueChanged<int> onCounterUpdated;

  const CounterButton({super.key, required this.onCounterUpdated});
  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
      widget.onCounterUpdated(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Counter: $counter'),
        const SizedBox(width: 10),
        ElevatedButton(
          child: const Text('Buy Now'),
          onPressed: incrementCounter,
        ),
       ],
      )
    );
  }
}

class Product {
  final String name;
  final double price;
  int count;

  Product({required this.name, required this.price, this.count = 0});
}

class CartPage extends StatelessWidget {
  final List<Product> products;

  const CartPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    int totalCount = products.fold(0, (sum, product) => sum + product.count);

    return Scaffold(
      appBar: AppBar(
        title:const Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: $totalCount'),
      ),
    );
  }
}

