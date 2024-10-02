import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:invertetextoapi/service/invertertexto_service.dart';

class ValidaCNPJpage extends StatefulWidget {
  const ValidaCNPJpage({super.key});

  @override
  State<ValidaCNPJpage> createState() => _ValidaCNPJpageState();
}

class _ValidaCNPJpageState extends State<ValidaCNPJpage> {
  String? campo;
  String? resultado;

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
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Digite o CNPJ",
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
                future: validaCPF(campo),
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
    String message = snapshot.data["valid"] ? "CNPJ Válido" : "CNPJ Inválido";
    return Column(
      children: <Widget>[
        TextField(
          readOnly: true,
        decoration: InputDecoration(
          labelText: message,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}