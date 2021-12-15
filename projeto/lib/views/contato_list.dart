import 'package:flutter/material.dart';
//import 'package:projeto/components/user_tile.dart';
//import 'package:projeto/models/user.dart';
//import 'package:projeto/provider/users.dart';
import 'package:projeto/routes/app_routes.dart';
//import 'package:provider/provider.dart';

class ContatoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de contatos das agropecuárias'),
        actions: <Widget>[
          //  IconButton(
          //    icon: Icon(Icons.add),
          //   onPressed: () {
          //    Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
          //  },
          // ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              child: Text("Agrovida", style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.AGROVIDA_PAGE);
              },
              textColor: Colors.black,
              padding: const EdgeInsets.all(0.0),
            ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.SSEMENTES_PAGE);
              },
              child: const Text("SSementes", style: TextStyle(fontSize: 20)),
              textColor: Colors.black,
            ),
            const SizedBox(height: 30),
            RaisedButton(
                child: Text("Agroanimal", style: TextStyle(fontSize: 20)),
                textColor: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.AGROANIMAL_PAGE);
                }),
          ],
        ),

        //  body: ListView.builder(
        //  itemCount: users.count,
        // itemBuilder: (context, index) => UserTile(users.byIndex(index)),
        // ),
      ),
    );
  }
}
