import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/models/vendedores.dart';
import 'package:projeto/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  List<Vendedor> items;
  var db = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot> vendedorInscricao;
  @override
  void initState() {
    super.initState();

    items = List();
    vendedorInscricao?.cancel();

    vendedorInscricao =
        db.collection("Vendedores").snapshots().listen((snapshot) {
      final List<Vendedor> vendedores = snapshot.docs
          .map(
            (documentSnapshot) =>
                Vendedor.fromMap(documentSnapshot.data(), documentSnapshot.id),
          )
          .toList();
      setState(() {
        this.items = vendedores;
      });
    });
  }

  @override
  void dispose() {
    vendedorInscricao?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Agropecuárias"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: getListaVendedores(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      //   List<DocumentSnapshot> documentos = snapshot.data.docs;
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: (items[index].avatarUrl == null)
                                  ? AssetImage('android/assets/semente2.jpg')
                                  : NetworkImage(items[index].avatarUrl),
                            ),
                            title: Text(items[index].name,
                                style: TextStyle(fontSize: 22)),
                            // subtitle: Text(items[index].email,
                            // style: TextStyle(fontSize: 22)),
                            trailing: Column(
                              children: <Widget>[
                                //  IconButton(
                                //  icon: const Icon(Icons.delete_forever),
                                //  onPressed: () {
                                //    _deletaVendedores(
                                //   context, documentos[index], index);
                                // },
                                // ),

                                FlatButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.PRODUTO_PAGE);
                                  },
                                  child: Text("Produtosfi"),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                  }
                }),
          ),
        ],
      ),
    );
  }

  Stream<QuerySnapshot> getListaVendedores() {
    return FirebaseFirestore.instance.collection('Vendedores').snapshots();
  }

  // void _deletaVendedores(
  // BuildContext context, DocumentSnapshot doc, int position) async {
  //  db.collection("Vendedores").doc(doc.id).delete();

  //  setState(() {
  //   items.removeAt(position);
  // });
  //}
}
