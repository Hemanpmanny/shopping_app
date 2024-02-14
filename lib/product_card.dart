import "package:flutter/material.dart";

class Product_cart extends StatelessWidget {
  final String text;
  final double price;
  final String image;
  final Color backgroundcolor;
  const Product_cart(
      {super.key,
      required this.text,
      required this.price,
      required this.image,
      required this.backgroundcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(17),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: backgroundcolor, borderRadius: BorderRadius.circular(20)),
      //color: const Color.fromRGBO(216, 240, 253, 1), we can not pass both color and decoration in the container
      // if we need both color and decotation in container then we have to push the color inside the decoration
      //otherwise error will ouur
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          '\$$price',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Center(
          child: Image(
            image: AssetImage(image),
            height: 175,
          ),
        )
      ]),
    );
  }
}
