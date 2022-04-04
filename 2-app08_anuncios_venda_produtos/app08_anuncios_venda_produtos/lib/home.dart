import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _title(),
        backgroundColor: Colors.white,
        body: _body(),
      ),
    );
  }

  _title() {
    return AppBar(
      title: Text("Anúncios"),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text('Os mais novos produtos da nossa loja!\n deslize para conferir -->'),
            _carousel(),
          ],
        ),
      ),
    );
  }

  _carousel() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      height: 350,
      child: PageView(
        children: <Widget>[
          _image('https://castorino.com.br/media/catalog/product/0/5/0581299_B_1.jpg', 'Caderno God of War'),
          _image('https://www.casasbahia-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=1245214942', 'Boneco Homem Aranha'),
          _image('https://http2.mlstatic.com/D_NQ_NP_916914-MLA46540739257_062021-O.jpg', 'Headphone JBL'),
        ],
      ),
    );
  }

  _image(String link, String imageTitle) {
    return Container(
        child: Column(
            children: [Image.network(
              "$link",
              height: 300,
              fit: BoxFit.cover,
            ),
              _textDescriptionAds(imageTitle)]
        )
    );
  }
  _text(String text) {
    return Text(
      "$text",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.red,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.black,
          decorationStyle: TextDecorationStyle.dashed),
    );
  }

  _textDescriptionAds(String text) {
    return Text(
      "$text",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}