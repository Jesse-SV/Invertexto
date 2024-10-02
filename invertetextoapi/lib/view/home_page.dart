import 'package:flutter/material.dart';
import 'package:invertetextoapi/view/busca_cep_page.dart';
import 'package:invertetextoapi/view/por_extenso_page.dart';
import 'package:invertetextoapi/view/validar_cnpj_page.dart';
import 'package:invertetextoapi/view/validar_cpf_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/invertexto.png',
              fit: BoxFit.contain,
              height: 40,
            ),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 32, 159, 233),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit, color: Colors.white, size: 70.0),
                  Text(
                    "Por Extenso",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PorExtensoPage(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.home, color: Colors.white, size: 70.0),
                  Text(
                    "Busca Cep",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuscaCepPage(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.account_box, color: Colors.white, size: 70.0),
                  Text(
                    "Validar CPF",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ValidaCPFpage(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.account_box_outlined, color: Colors.white, size: 70.0),
                  Text(
                    "Validar CNPJ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ValidaCNPJpage()
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
