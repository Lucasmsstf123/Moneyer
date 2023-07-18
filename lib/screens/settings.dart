import 'package:flutter/material.dart';
import 'package:moneyer/models/gastos_model.dart';
import 'package:moneyer/screens/info.dart';
import 'package:moneyer/screens/juros.dart';
import 'package:moneyer/screens/investimentos.dart';
import 'package:moneyer/screens/resultados.dart';

final TextStyle txtstyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      //height: 1.5,
    );

class SettingsPage extends StatefulWidget {
  List<Gastos> pgastos;
  List<Gastos> bgastos;
  SettingsPage({super.key, required this.pgastos, required this.bgastos});

  

  @override
  State<SettingsPage> createState() => _SettingsPageState(pgastos, bgastos);
}

class _SettingsPageState extends State<SettingsPage> {
  List<Gastos> pgastos;
  List<Gastos> bgastos;
  _SettingsPageState(this.pgastos, this.bgastos);

  @override

  int teste = 0;

  void addteste(){
    setState(() {
      teste++;
    });
  }

  Widget build(BuildContext context) {

    const TextStyle txtstyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      //height: 1.5,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Opções"),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                ListTile(title: Text("Calculadora de Juros", style: txtstyle,), onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => JurosPage()));}, leading: Icon(Icons.calculate, color: Colors.green,),),
                ListTile(title: Text("Informações", style: txtstyle,), onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage()));}, leading: Icon(Icons.info_outline, color: Colors.green,),),
                ListTile(title: Text("Investimentos", style: txtstyle,), onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => InvestPage()));}, leading: Icon(Icons.monetization_on, color: Colors.green,),),
                ListTile(title: Text("Resultados", style: txtstyle,), onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(pgastos: pgastos, bgastos: bgastos,)));}, leading: Icon(Icons.request_quote_outlined, color: Colors.green,),),
              ]
            ),
          ],
        ),
      ),
    );
  }
}