import 'package:projeto/models/produto.dart';

const DUMMY_PRODUTOS = {
  '1': const Produto(
    id: '1',
    name: 'Tomate',
    avatarUrl:
        'https://cdn.pixabay.com/photo/2013/07/12/18/19/tomato-153272_960_720.png',
    precoUni: '0,10 cent',
  ),
  '2': const Produto(
    id: '2',
    name: 'Cebola',
    avatarUrl:
        'https://cdn.pixabay.com/photo/2014/12/21/23/59/onion-576534_960_720.png',
    precoUni: '0,50 cent',
  ),
  '3': const Produto(
    name: 'repolho',
    avatarUrl:
        'https://cdn.pixabay.com/photo/2018/10/03/21/57/cabbage-3722498_960_720.jpg',
    precoUni: '0,45 cent',
  ),
  '4': const Produto(
    name: 'melancia',
    avatarUrl:
        'https://cdn.pixabay.com/photo/2010/12/13/10/18/watermelon-2636_960_720.jpg',
    precoUni: '0,05 muda',
  ),
};
