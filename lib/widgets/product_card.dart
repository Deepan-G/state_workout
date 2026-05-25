import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String value;
  const ProductCard({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    debugPrint('b');
    return Container(
      color: Colors.yellow,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value),
          // ElevatedButton(
          //   onPressed: () {
          //     context.read<ListManager>().removeItem(value);
          //   },
          //   child: Text('Remove'),
          // ),
        ],
      ),
    );
  }
}
