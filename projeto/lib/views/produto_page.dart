import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/models/produtofi.dart';
import 'package:projeto/routes/app_routes.dart';

class ProdutoPage extends StatefulWidget {
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  List<Produtofi> items;
  var db = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot> produtoInscricao;
  @override
  void initState() {
    super.initState();

    items = List();
    produtoInscricao?.cancel();

    produtoInscricao = db.collection("Produtos").snapshots().listen((snapshot) {
      final List<Produtofi> produtosfi = snapshot.docs
          .map(
            (documentSnapshot) =>
                Produtofi.fromMap(documentSnapshot.data(), documentSnapshot.id),
          )
          .toList();
      setState(() {
        this.items = produtosfi;
      });
    });
  }

  @override
  void dispose() {
    produtoInscricao?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de produtos firebase"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: getListaProdutos(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      //  List<DocumentSnapshot> documentos = snapshot.data.docs;
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
                            subtitle: Text(items[index].preco,
                                style: TextStyle(fontSize: 22)),
                            trailing: Column(
                              children: <Widget>[
                                // IconButton(
                                //  icon: const Icon(Icons.delete_forever),
                                // onPressed: () {
                                //  _deletaProdutos(
                                //      context, documentos[index], index);
                                // },
                                // ),
                                IconButton(
                                  icon: const Icon(Icons.add_call),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.CONTATO_FORM);
                                  },
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

  Stream<QuerySnapshot> getListaProdutos() {
    return FirebaseFirestore.instance.collection('Produtos').snapshots();
  }

  //void _deletaProdutos(
  //   BuildContext context, DocumentSnapshot doc, int position) async {
  // db.collection("Produtos").doc(doc.id).delete();

  // setState(() {
  //   items.removeAt(position);
  // });
  //}
}
