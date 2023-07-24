part of 'cart_cubit.dart';

abstract class CartState {}

// ignore: must_be_immutable
class CartInitial extends CartState {
  List<String> items = List.empty();
  List<String> price = List.empty();

  CartInitial();
}
