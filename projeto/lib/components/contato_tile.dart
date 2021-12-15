import 'package:flutter/material.dart';
import 'package:projeto/models/contato.dart';
import 'package:projeto/routes/app_routes.dart';

class ContatoTile extends StatelessWidget {
  final Contato contato;
  const ContatoTile(this.contato);

  @override
  Widget build(BuildContext context) {
    final avatar = contato.avatarUrl == null || contato.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(contato.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(contato.telefone),
      subtitle: Text(contato.email),
      trailing: Container(
        width: 150,
        child: Row(
          children: <Widget>[
            FlatButton(
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CONTATO_FORM);
              },
              child: Text("Entar em Contato"),
            ),
          ],
        ),
      ),
    );
  }
}
