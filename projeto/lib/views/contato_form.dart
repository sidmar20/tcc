import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/models/contatos.dart';
import 'package:projeto/routes/app_routes.dart';

//import 'package:projeto/routes/app_routes.dart';
//import 'package:projeto/components/contato_tile.dart';
//import 'package:projeto/data/dummy_contato.dart';
//import 'package:projeto/routes/app_routes.dart';

class ContatoForm extends StatefulWidget {
  @override
  _ContatoFormState createState() => _ContatoFormState();
}

class _ContatoFormState extends State<ContatoForm> {
  List<Contatos> items;
  var db = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot> contatoInscricao;
  @override
  void initState() {
    super.initState();

    items = List();
    contatoInscricao?.cancel();

    contatoInscricao = db.collection("Contatos").snapshots().listen((snapshot) {
      final List<Contatos> contatos = snapshot.docs
          .map(
            (documentSnapshot) =>
                Contatos.fromMap(documentSnapshot.data(), documentSnapshot.id),
          )
          .toList();
      setState(() {
        this.items = contatos;
      });
    });
  }

  @override
  void dispose() {
    contatoInscricao?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // final contatos = {...DUMMY_CONTATO};
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        actions: <Widget>[
          //  IconButton(
          //   icon: Icon(Icons.add_call),
          //  onPressed: () {
          //    Navigator.of(context).pushNamed(AppRoutes.CONTATO_FORM);
          //  },
          //),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: getListaContatos(),
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
                                  ? AssetImage('android/assets/agrovida.png')
                                  : NetworkImage(items[index].avatarUrl),
                            ),
                            title: Text(items[index].email,
                                style: TextStyle(fontSize: 22)),
                            subtitle: Text(items[index].telefone,
                                style: TextStyle(fontSize: 22)),
                            trailing: Column(
                              children: <Widget>[
                                // FlatButton(
                                //color: Colors.green,
                                //onPressed: () {},
                                //child: Text("Entrar em contato"),
                                // ),
                                RaisedButton(
                                    child: Text("Agrovida",
                                        style: TextStyle(fontSize: 20)),
                                    textColor: Colors.green,
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(AppRoutes.AGROVIDA_PAGE);
                                    }),
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

  Stream<QuerySnapshot> getListaContatos() {
    return FirebaseFirestore.instance.collection('Contatos').snapshots();
  }
}
