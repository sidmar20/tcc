import 'package:flutter/material.dart';

//import 'package:projeto/models/produto.dart';
//import 'package:projeto/models/produto.dart';
import 'package:projeto/models/user.dart';
import 'package:projeto/routes/app_routes.dart';

//import 'package:projeto/routes/produto_routes.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    // final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
    //   ? CircleAvatar(child: Icon(Icons.person))
    //   : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    // return Scaffold(
    // leading: avatar,
    // title: Text(user.name),
    // subtitle: Text(user.email),
    return Container(
      child: Row(
        children: <Widget>[
          // IconButton(
          //  icon: Icon(Icons.edit),
          //  onPressed: () {
          //  Navigator.of(context).pushNamed(
          //   AppRoutes.USER_FORM,
          //   arguments: user,
          //  );
          // },
          // ),
          // IconButton(
          // icon: Icon(Icons.delete),
          //onPressed: () {},
          // ),
          // FlatButton(
          //color: Colors.red,
          //onPressed: () {
          //  Navigator.of(context).pushNamed(AppRoutes.LOGIN_PAGE);
          //   },
          // child: Text("Crie sua conta"),
          // ),
          FlatButton(
            color: Colors.white10,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
            },
            child: Text("Vendedores"),
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUTO_PAGE);
              // Navigator.of(context).pushNamed(AppRoutes.CONTATO_FORM);
            },
            child: Text("Produtosfi"),
          ),
        ],
      ),
    );
    //);
  }
}
