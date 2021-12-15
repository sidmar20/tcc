class Contatos {
  String _id;
  String _name;
  String _avatarUrl;
  String _email;
  String _telefone;

  Contatos(this._id, this._name, this._avatarUrl, this._email, this._telefone);

  Contatos.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._avatarUrl = obj['avatarUrl'];
    this._email = obj['email'];
    this._telefone = obj['telefone'];
  }

  String get id => _id;
  String get name => _name;
  String get avatarUrl => _avatarUrl;
  String get email => _email;
  String get telefone => _telefone;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['avatarUrl'] = _avatarUrl;
    map['email'] = _email;
    map['telefone'] = _telefone;

    return map;
  }

  Contatos.fromMap(Map<String, dynamic> map, String id) {
    this._id = id ?? '';
    this._name = map['name'];
    this._avatarUrl = map['avatarUrl'];
    this._email = map['email'];
    this._telefone = map['telefone'];
  }
}
