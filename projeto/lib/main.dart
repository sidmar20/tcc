import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:projeto/pages/home.dart';
//import 'package:projeto/pages/login.page.dart';
import 'package:projeto/provider/users.dart';
import 'package:projeto/provider/users2.dart';
import 'package:projeto/routes/app_routes.dart';
import 'package:projeto/views/agroanimal_page.dart';
import 'package:projeto/views/agrovida_page.dart';
import 'package:projeto/views/cebola_page.dart';
import 'package:projeto/views/contato_form.dart';
import 'package:projeto/views/contato_list.dart';
import 'package:projeto/views/home_page.dart';
import 'package:projeto/views/login.page.dart';
import 'package:projeto/views/produto_page.dart';
import 'package:projeto/views/produto_routes.dart';
import 'package:projeto/views/repolho_page.dart';
import 'package:projeto/views/ssementes_page.dart';
import 'package:projeto/views/tomate_page.dart';
import 'package:projeto/views/user_form.dart';
import 'package:projeto/views/user_list.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
        ),
        ChangeNotifierProvider(
          create: (context) => Album(),
        ),
      ],
      child: MaterialApp(
        title: 'login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
          AppRoutes.PRODUTO_FORM: (_) => ProdutoRoutes(),
          AppRoutes.CONTATO_FORM: (_) => ContatoForm(),
          AppRoutes.PRODUTO_PAGE: (_) => ProdutoPage(),
          AppRoutes.LOGIN_PAGE: (_) => LoginPage(),
          AppRoutes.HOME_PAGE: (_) => HomePage(),
          AppRoutes.TOMATE_PAGE: (_) => TomatePage(),
          AppRoutes.CEBOLA_PAGE: (_) => CebolaPage(),
          AppRoutes.REPOLHO_PAGE: (_) => RepolhoPage(),
          AppRoutes.AGROVIDA_PAGE: (_) => AgrovidaPage(),
          AppRoutes.AGROANIMAL_PAGE: (_) => AgroanimalPage(),
          AppRoutes.SSEMENTES_PAGE: (_) => SsementesPage(),
          AppRoutes.CONTATO_LIST: (_) => ContatoList()
        },
        //home: LoginPage(),
      ),
    );
  }
}
