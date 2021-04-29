import 'package:flutter/cupertino.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/services/database.dart';

class SearchBloc {
  final Database database;

  SearchBloc({@required this.database});

  ///get searched items
  Stream<List<Product>> getSearchedProducts(String data) {
    return database.getSearchedDataFromCollection('products', data).map(
        (snapshots) => snapshots.docs
            .map((snapshot) => Product.fromMap(snapshot.data(), snapshot.id))
            .toList());
  }
}
