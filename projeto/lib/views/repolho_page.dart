import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/models/repolho.dart';
import 'package:projeto/routes/app_routes.dart';

class RepolhoPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RepolhoPage> {
  List<Repolho> items;
  var db = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot> repolhoInscricao;
  @override
  void initState() {
    super.initState();

    items = List();
    repolhoInscricao?.cancel();

    repolhoInscricao = db.collection("Repolho").snapshots().listen((snapshot) {
      final List<Repolho> repolhos = snapshot.docs
          .map(
            (documentSnapshot) =>
                Repolho.fromMap(documentSnapshot.data(), documentSnapshot.id),
          )
          .toList();
      setState(() {
        this.items = repolhos;
      });
    });
  }

  @override
  void dispose() {
    repolhoInscricao?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comparativo de preços do Repolho"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: getListaRepolhos(),
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
                                style: TextStyle(fontSize: 25)),
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

  Stream<QuerySnapshot> getListaRepolhos() {
    return FirebaseFirestore.instance.collection('Repolho').snapshots();
  }
}
