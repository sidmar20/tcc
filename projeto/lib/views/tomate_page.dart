import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/models/tomate.dart';
import 'package:projeto/routes/app_routes.dart';

class TomatePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TomatePage> {
  List<Tomate> items;
  var db = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot> tomateInscricao;
  @override
  void initState() {
    super.initState();

    items = List();
    tomateInscricao?.cancel();

    tomateInscricao = db.collection("Tomates").snapshots().listen((snapshot) {
      final List<Tomate> tomates = snapshot.docs
          .map(
            (documentSnapshot) =>
                Tomate.fromMap(documentSnapshot.data(), documentSnapshot.id),
          )
          .toList();
      setState(() {
        this.items = tomates;
      });
    });
  }

  @override
  void dispose() {
    tomateInscricao?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comparativo de preços do Tomate"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: getListaTomates(),
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

  Stream<QuerySnapshot> getListaTomates() {
    return FirebaseFirestore.instance.collection('Tomates').snapshots();
  }
}
