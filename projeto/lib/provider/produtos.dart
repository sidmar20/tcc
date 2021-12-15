import 'package:flutter/material.dart';
import 'package:projeto/data/dummy_produtos.dart';
import 'package:projeto/models/produto.dart';

class Produtos with ChangeNotifier {
  final Map<String, Produto> _items = {...DUMMY_PRODUTOS};

  List<Produto> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Produto byIndex(int index) {
    return _items.values.elementAt(index);
  }

  Future<void> put(Produto produto) async {
    if (produto == null) {
      return;
    }
  }
}
