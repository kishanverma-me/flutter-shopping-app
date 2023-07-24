// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class total extends StatelessWidget {
  // String item, price = "No Data";
  int totalPrice = 0;
  // double rating;
  total({super.key, required this.totalPrice});

  Color border = Color.fromARGB(255, 2, 2, 2);

  @override
  Widget build(BuildContext context) {
    //BuildContext ct = context;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
                  color: border,
                  width: 2,
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
                  width: 0,
                  strokeAlign: BorderSide.strokeAlignOutside)),
          borderRadius: const BorderRadius.all(Radius.circular(2))),
      height: 45,
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
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Icon(Icons.shopping_bag_outlined),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Amount",
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        // ignore: prefer_interpolation_to_compose_strings
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Text(
                    "\$" + totalPrice.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
