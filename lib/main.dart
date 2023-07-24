// ignore_for_file: must_be_immutable

import 'package:bloc_shopping/Utils/items_list.dart';
import 'package:bloc_shopping/screens/cart.dart';
import 'package:bloc_shopping/screens/home.dart';
import 'package:bloc_shopping/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CartItemList newcartList = CartItemList();
    return BlocProvider(
      create: (_) => CartCubit(cartLis: newcartList),
      child: MaterialApp(
        routes: {
          '/': (context) => MyHomePage(),
          '/cart': (context) => CartActivity(
              ModalRoute.of(context)?.settings.arguments as CartItemList)
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            splashFactory: InkRipple.splashFactory),
      ),
    );
  }
}
