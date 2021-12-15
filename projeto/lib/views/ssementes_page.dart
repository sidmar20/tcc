import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

void main() {
  runApp(MaterialApp(
    home: SsementesPage(),
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
    path: 'Ssementes@gmail.com',
    query: 'subject=Reportar&body=Detalhe aqui qual bug você encontrou: ',
  );
  String url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('não foi possivel conectar $url');
  }
}

void acessarSite() async {
  String url = "https://google.com";

  if (await canLaunch(url)) {
    launch(url);
  } else {
    throw "não é possivel acessar";
  }
}

class SsementesPage extends StatefulWidget {
  @override
  _SsementesPageState createState() => _SsementesPageState();
}

class _SsementesPageState extends State<SsementesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos Ssementes"),
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
