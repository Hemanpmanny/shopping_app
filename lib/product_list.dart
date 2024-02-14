import "package:flutter/material.dart";
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_detailes_page.dart';

class product_list extends StatefulWidget {
  const product_list({super.key});

  @override
  State<product_list> createState() => _product_listState();
}

class _product_listState extends State<product_list> {
  final List<String> filter = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selector;

  @override
  void initState() {
    super.initState();
    selector = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    const border1 = OutlineInputBorder(
        //without this when we click we get no border even there is enabled boreder
        borderSide: BorderSide(width: 3),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(22)));
    return SafeArea(
      //helps to make items below the notch and above the bottom-safe area
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Shoe \ncollections',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'search',
                      prefixIcon: Icon(Icons.search),
                      border: border1,
                      //we also pass border as variable by defining out side by giving all properties
                      enabledBorder: OutlineInputBorder(
                          //which is show before click
                          borderSide: BorderSide(
                              width: 3,
                              color: Color.fromRGBO(225, 225, 225, 1)),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(22)))),
                ),
              )
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filter.length,
              itemBuilder: (context, index) {
                final filters = filter[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selector = filters;
                      });
                    },
                    child: Chip(
                      backgroundColor: selector == filters
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromARGB(255, 222, 225, 225),
                      side: const BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 222, 225, 225),
                      ),
                      elevation: 2,
                      label: Text(filters),
                      labelStyle: const TextStyle(fontSize: 17),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  final products = product[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Product_detailes_page(product: products);
                      }));
                    },
                    child: Product_cart(
                        text: products['title'] as String,
                        price: products['price'] as double,
                        image: products['imageurl'] as String,
                        backgroundcolor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : Color.fromARGB(255, 243, 244, 244)),
                  );
                }),
          )
        ],
      ),
    );
  }
}
