import 'package:flutter/material.dart';
import 'package:projeto/components/produto_tile.dart';
import 'package:projeto/data/dummy_produtos.dart';
//import 'package:projeto/routes/app_routes.dart';

class ProdutoRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final produtos = {...DUMMY_PRODUTOS};
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de produtos"),
        //actions: <Widget>[
        //IconButton(
        //icon: Icon(Icons.add),
        //onPressed: () {
        //Navigator.of(context).pushNamed(AppRoutes.PRODUTO_FORM);
        //},
        //),
        //],
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) =>
            ProdutoTile(produtos.values.elementAt(index)),
      ),
    );
  }
}
