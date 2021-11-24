import 'package:flutter/material.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricoes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _paginaAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget>  telas = [
      Inicio(),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("compartilhar tela");
            },
            icon: Icon(Icons.screen_share),
          ),
          IconButton(
            onPressed: () {
              print("pesquisar");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("video");
            },
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {
              print("conta");
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_paginaAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaAtual,
        onTap: (indice) {
          setState(() {
            _paginaAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            label: 'Inicio',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            label: 'Em alta',
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            label: 'Inscrições',
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.green,
            label: 'Biblioteca ',
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
