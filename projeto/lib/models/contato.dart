import 'package:flutter/material.dart';

class Contato {
  final String id;
  final String telefone;
  final String email;
  final String avatarUrl;

  const Contato(
      {this.id,
      @required this.telefone,
      @required this.email,
      @required this.avatarUrl});
}
