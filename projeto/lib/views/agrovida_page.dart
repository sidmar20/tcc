import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

void main() {
  runApp(MaterialApp(
    home: AgrovidaPage(),
  ));
}

void ligar() async {
  String phone = "tel: 996004568";

  if (await canLaunch(phone)) {
    launch(phone);
  } else {
    throw "não é possivel ligar";
  }
}

launchWhatsApp() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+5586994324465',
    text: "Olá",
  );

  await launch('$link');
}

void enviarMsg() async {
  String message = "sms: 996004568?body=";

  if (await canLaunch(message)) {
    launch(message);
  } else {
    throw "não é possivel enviar mensagem";
  }
}

abrirGmail() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'Agrovida@hotmail.com',
    query: 'subject=Reportar&body=Detalhe aqui qual bug você encontrou: ',
  );
  String url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('não foi possivel conectar $url');
  }
}

//void email() async {
// String email =
//  "Agrovida@hotmail.com?subject=Dúvidas entar em contato?body=Bem vindo";

// if (await canLaunch(email)) {
//   launch(email);
// } else {
//  throw "não é possivel enviar";
// }
//}

void acessarSite() async {
  String url = "https://google.com";

  if (await canLaunch(url)) {
    launch(url);
  } else {
    throw "não é possivel acessar";
  }
}

class AgrovidaPage extends StatefulWidget {
  @override
  _AgrovidaPageState createState() => _AgrovidaPageState();
}

class _AgrovidaPageState extends State<AgrovidaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos Agrovida"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            RaisedButton(
              onPressed: ligar,
              child: Text("Ligar", style: TextStyle(fontSize: 20)),
              textColor: Colors.black,
              padding: const EdgeInsets.all(0.0),
            ),
            const SizedBox(height: 10),
            RaisedButton(
              onPressed: launchWhatsApp,
              child: Text("Enviar mensagem whatsApp",
                  style: TextStyle(fontSize: 20)),
              textColor: Colors.black,
              padding: const EdgeInsets.all(0.0),
            ),
            const SizedBox(height: 10),
            RaisedButton(
              onPressed: enviarMsg,
              child: Text("Enviar mensagem", style: TextStyle(fontSize: 20)),
              textColor: Colors.black,
            ),
            RaisedButton(
              onPressed: abrirGmail,
              child: Text("Enviar Email", style: TextStyle(fontSize: 20)),
              textColor: Colors.black,
              padding: const EdgeInsets.all(0.0),
            ),
            const SizedBox(height: 10),
            RaisedButton(
              onPressed: acessarSite,
              child: Text("Acessar o site", style: TextStyle(fontSize: 20)),
              textColor: Colors.black,
              padding: const EdgeInsets.all(0.0),
            ),
          ],
        ),
      ),
    );
  }
}
