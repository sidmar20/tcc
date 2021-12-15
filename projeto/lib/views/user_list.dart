import 'package:flutter/material.dart';
//import 'package:projeto/components/user_tile.dart';
//import 'package:projeto/models/user.dart';
//import 'package:projeto/provider/users.dart';
import 'package:projeto/routes/app_routes.dart';
//import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
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
             const SizedBox(height: 30),
            RaisedButton(
              child: Image.asset(
                  "android/assets/tomate.jpg",
                  height: 100,
                ),
              // Text("Tomate", style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.TOMATE_PAGE);
              },
              textColor: Colors.red,
              padding: const EdgeInsets.all(0.0),
            ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CEBOLA_PAGE);
              },
              child: Image.asset(
                  "android/assets/cebola.jpg",
                  height: 100,
                ),
              //const Text("Cebola", style: TextStyle(fontSize: 20)),
              textColor: Colors.yellow[900],
               padding: const EdgeInsets.all(0.0),
            ),
            const SizedBox(height: 30),
            RaisedButton(
                child: Image.asset(
                  "android/assets/repolho.jpg",
                  height: 100,
                ),
               // childrem: Text("Repolho", style: TextStyle(fontSize: 20)),
                textColor: Colors.green,
                 padding: const EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.REPOLHO_PAGE);
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
