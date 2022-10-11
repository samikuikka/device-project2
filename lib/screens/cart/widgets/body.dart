import 'package:flutter/material.dart';
import '../../../providers/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/product.dart';
import './total.dart';

class Body extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<Product> products = ref.watch(shoppingProvider);
    double width = MediaQuery.of(context).size.width;
    double price = products.fold(0, (previousValue, element) => previousValue + element.price);

    if(width < 700) {
      return Container(
        color: Color(0xffc7c7c7),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          
        ),
      );
    }

    return Container(
      color: Color(0xffc7c7c7),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(color: Colors.red,),
            ),
            const SizedBox(
              width: 20,
            ),
            Total(price: price)
          ],
        )
      ),
    );
  }
}