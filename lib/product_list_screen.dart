import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_sample/provider_types/provider_sample.dart';
import 'package:state_sample/widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {

   // print('producs');
    return Scaffold(
      body:
      // FutureProvider<List<String>>(
      //   key: UniqueKey(),
      //   lazy: false,
      //   create: (context) => context.read<UserService>().getProductList(),
      //   initialData: [],
      //   child:
        Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Back'),
                    ),
                    Expanded(
                      child: ProductListGenerator()
                    ),
                  ],
                ),
              ),
      // ),
    );
  }
}

class ProductListGenerator extends StatelessWidget {
  const ProductListGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> products = context.watch<List<String>>();
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(value: products[index]);
      },
    );
  }
}

