import 'dart:math';

import 'package:flutter/material.dart';

class JurosPage extends StatefulWidget {
  JurosPage({super.key});

  

  @override
  State<JurosPage> createState() => _JurosPageState();
}

class _JurosPageState extends State<JurosPage> {
  
  TextEditingController calcControl = TextEditingController();
  TextEditingController aporteControl = TextEditingController();
  TextEditingController feeControl = TextEditingController();
  TextEditingController timeControl = TextEditingController();
  double resultText = 0;
  
  @override

  Widget build(BuildContext context) {

    const TextStyle txtstyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      //height: 1.5,
    );
    const TextStyle resultstyle = TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      height: 2,
    );

    double calculation(double value, double aporte, double fee, int time){
      double result = value;
      for (var i = 0; i < time; i++) {
        if (i == 0) {
          result = (result)*(1+(fee/100));
        }
        else{
          result = (result + aporte)*(1+(fee/100));
        }
        
      }
      return result;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Juros"),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                ListTile(title: TextField(decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Valor",
                      hintStyle: txtstyle,
                    ),
                    style: txtstyle,
                    controller: calcControl,), onTap: (){}, leading: Icon(Icons.monetization_on_outlined, color: Colors.green,),),
                    ListTile(title: TextField(decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Aporte",
                      hintStyle: txtstyle,
                    ),
                    style: txtstyle,
                    controller: aporteControl,), onTap: (){}, leading: Icon(Icons.add, color: Colors.green,),),
                ListTile(title: TextField(decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Juros %",
                      hintStyle: txtstyle,
                    ),
                    style: txtstyle,
                    controller: feeControl,), onTap: (){}, leading: Icon(Icons.show_chart_rounded, color: Colors.green,),),
                ListTile(title: TextField(decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Tempo (Mês)",
                      hintStyle: txtstyle,
                    ),
                    style: txtstyle,
                    controller: timeControl,), onTap: (){}, leading: Icon(Icons.timelapse, color: Colors.green,),),
                    Text("Resultado = R\$${resultText.toStringAsFixed(2)}", style: resultstyle,),
              ]
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            resultText = calculation(double.parse(calcControl.text.toString()), double.parse(aporteControl.text.toString()), double.parse(feeControl.text.toString()), int.parse(timeControl.text.toString()));
          });
        },
        tooltip: 'Calculate',
        child: const Icon(Icons.calculate_outlined),
      ),
    );
  }
}