import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_cubit.dart';

class Favor extends Cubit<Icon> {
  BuildContext con;
  Icon dis = const Icon(
    Icons.favorite_outline,
  );
  Icon lik = const Icon(
    Icons.favorite,
    color: Colors.red,
  );

  Favor({required this.dis, required this.con}) : super(dis);
  void swap() {
    state == dis ? like() : disl();
  }

  void like() {
    emit(lik);
    BlocProvider.of<CartCubit>(con).set();
  }

  void disl() {
    emit(dis);
    BlocProvider.of<CartCubit>(con).unset();
  }
}
