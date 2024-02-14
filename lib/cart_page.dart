import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shopping_app/cart_provider.dart";

class Cart_page extends StatelessWidget {
  const Cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    //print(Provider.of<Cartprovider>(context).cart);
    final cart = Provider.of<Cartprovider>(context).cart;
    // final cart = context.watch<Cartprovider>().cart; short for above
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final carts = cart[index];
              // also final Map<String,dynamic>carts = cart[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(carts['imageurl'] as String),
                  radius: 30,
                ),
                title: Text(
                  carts['title'] as String,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text('size :${carts['size']}'),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          // barrierDismissible: false,
                          context: context,
                          builder: (builder) {
                            return AlertDialog(
                              title: Text(
                                'Delete item',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: const Text(
                                  'Are yo sure you want to delete item?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'NO',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Provider.of<Cartprovider>(context,
                                              listen: false)
                                          .removeproduct(carts);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('YES',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)))
                              ],
                            );
                          });
                      // print("deleted");
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            }));
  }
}

class Provide {}
