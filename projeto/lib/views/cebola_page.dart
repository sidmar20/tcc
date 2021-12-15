import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/models/cebola.dart';

import 'package:projeto/routes/app_routes.dart';

class CebolaPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CebolaPage> {
  List<Cebola> items;
  var db = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot> cebolaInscricao;
  @override
  void initState() {
    super.initState();

    items = List();
    cebolaInscricao?.cancel();

    cebolaInscricao = db.collection("Cebolas").snapshots().listen((snapshot) {
      final List<Cebola> cebolas = snapshot.docs
          .map(
            (documentSnapshot) =>
                Cebola.fromMap(documentSnapshot.data(), documentSnapshot.id),
          )
          .toList();
      setState(() {
        this.items = cebolas;
      });
    });
  }

  @override
  void dispose() {
    cebolaInscricao?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comparativo de preços do Cebola"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: getListaCebolas(),
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
                            subtitle: Text(items[index].preco,
                                style: TextStyle(fontSize: 32)),
                            trailing: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.add_call),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.CONTATO_LIST);
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

  Stream<QuerySnapshot> getListaCebolas() {
    return FirebaseFirestore.instance.collection('Cebolas').snapshots();
  }
}
