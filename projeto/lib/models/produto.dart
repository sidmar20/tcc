import 'package:flutter/material.dart';

class Produto {
  final String id;
  final String name;
  final String avatarUrl;
  final String precoUni;

  const Produto({
    this.id,
    @required this.name,
    @required this.avatarUrl,
    @required this.precoUni,
  });
}
