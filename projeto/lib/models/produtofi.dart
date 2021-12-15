class Produtofi {
  String _id;
  String _name;
  String _avatarUrl;
  String _preco;

  Produtofi(this._id, this._name, this._avatarUrl, this._preco);

  Produtofi.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._avatarUrl = obj['avatarUrl'];
    this._preco = obj['preco'];
  }

  String get id => _id;
  String get name => _name;
  String get avatarUrl => _avatarUrl;
  String get preco => _preco;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['avatarUrl'] = _avatarUrl;
    map['preco'] = _preco;

    return map;
  }

  Produtofi.fromMap(Map<String, dynamic> map, String id) {
    this._id = id ?? '';
    this._name = map['name'];
    this._avatarUrl = map['avatarUrl'];
    this._preco = map['preco'];
  }
}
