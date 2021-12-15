import 'package:flutter/material.dart';
import 'package:projeto/models/produto.dart';

class ProdutoTile extends StatelessWidget {
  final Produto produto;
  const ProdutoTile(this.produto);

  @override
  Widget build(BuildContext context) {
    final avatar = produto.avatarUrl == null || produto.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(produto.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(produto.name),
      subtitle: Text(produto.precoUni),
      trailing: Container(
        width: 150,
        child: Row(
          children: <Widget>[],
        ),
      ),
    );
  }
}
