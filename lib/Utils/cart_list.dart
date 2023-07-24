// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'item.dart';

// ignore: must_be_immutable
class cartList extends StatelessWidget {
  // String item, price = "No Data";
  CartItem i;
  // double rating;
  cartList({super.key, required this.i});

  Color border = Color.fromARGB(255, 6, 48, 174);

  @override
  Widget build(BuildContext context) {
    //BuildContext ct = context;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
                  color: border,
                  width: 0,
                  strokeAlign: BorderSide.strokeAlignOutside),
              bottom: BorderSide(
                  color: border,
                  width: 0,
                  strokeAlign: BorderSide.strokeAlignOutside),
              right: BorderSide(
                  color: border,
                  width: 0,
                  strokeAlign: BorderSide.strokeAlignOutside),
              left: BorderSide(
                  color: border,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside)),
          borderRadius: const BorderRadius.all(Radius.circular(2))),
      height: 85,
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: const Color.fromARGB(255, 219, 216, 216),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Icon(Icons.broken_image),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(i.itemName,
                            style:
                                const TextStyle(fontWeight: FontWeight.w700)),
                        // ignore: prefer_interpolation_to_compose_strings
                        Text("Rating " + i.itemRating.toString() + "/10",
                            style: const TextStyle(
                                fontSize: 9, fontWeight: FontWeight.w500)),
                        // ignore: prefer_interpolation_to_compose_strings
                        Text("Price - \$" + i.itemPrice.toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Text(
                    "\$" + i.itemPrice,
                    style: const TextStyle(fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
