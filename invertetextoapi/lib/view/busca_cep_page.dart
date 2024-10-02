import 'package:flutter/material.dart';
import 'package:invertetextoapi/service/invertertexto_service.dart';

class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({super.key});

  @override
  State<BuscaCepPage> createState() => _BuscaCepState();
}

class _BuscaCepState extends State<BuscaCepPage> {
  String? campo;
  String? resultado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/invertexto.png',
              fit: BoxFit.contain,
              height: 40,
            )
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Digite o CEP",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value){
                setState(() {
                  campo = value;
                });
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: buscaCep(campo),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if(snapshot.hasError){
                        return Container();
                      }
                      else
                         return exibeResultado(context, snapshot);
                  }
                },
              ),
              ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot){
    return Column(
      children: <Widget>[
        TextField(
          readOnly: true,
        decoration: InputDecoration(
          labelText: snapshot.data["state"],
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        TextField(
          readOnly: true,
        decoration: InputDecoration(
          labelText: snapshot.data["city"],
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        TextField(
          readOnly: true,
        decoration: InputDecoration(
          labelText: snapshot.data["neighborhood"],
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        TextField(
          readOnly: true,
        decoration: InputDecoration(
          labelText: snapshot.data["street"],
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}