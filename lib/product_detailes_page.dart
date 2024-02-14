import "dart:ui";

import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shopping_app/cart_provider.dart";

class Product_detailes_page extends StatefulWidget {
  final Map<String, Object> product;

  const Product_detailes_page({super.key, required this.product});

  @override
  State<Product_detailes_page> createState() => _Product_detailes_pageState();
}

class _Product_detailes_pageState extends State<Product_detailes_page> {
// INITIAL DATA / STATE
// CHANGE/ UPDATE DATA/STATE

// INITSTAte()

// build() => UI

  /// initState();
  /// build(); => {setState()}  => UI
  /// dispose()

  /// Stateless
  ///
  /// build() =>

  int sizefinal = 0;
  void onTap() {
    if (sizefinal != 0) {
      Provider.of<Cartprovider>(context, listen: false).addproduct(
        {
          'id': widget.product['id'],
          'company': widget.product['company'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'size': sizefinal,
          'imageurl': 'assets/images/shoes.png',
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added succesfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select the size')));
    }
    // Cartprovider is got to know by hovering the changenotifier in main.dart
  }
  //we have to make listner as false when outside the build function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Detailes',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  widget.product['imageurl'] as String,
                  height: 250,
                )),
            const Spacer(
              flex: 2,
            ),
            Container(
              height: 240,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
                // boxShadow: const [BoxShadow(blurRadius: 8)]
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              (widget.product['size'] as List<int>).length,
                          itemBuilder: (context, index) {
                            final size =
                                (widget.product['size'] as List<int>)[index];
                            return Padding(
                                padding: const EdgeInsets.all(8),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        sizefinal = size;
                                      });
                                    },
                                    child: Chip(
                                      label: Text(size.toString()),
                                      backgroundColor: sizefinal.toString() ==
                                              size.toString()
                                          ? const Color.fromARGB(
                                              255, 220, 228, 1)
                                          : null,
                                    )));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton.icon(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            fixedSize: const Size(350, 50)),
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    )
                  ]),
            )
          ],
        ));
  }
}
