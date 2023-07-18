import 'package:flutter/material.dart';
import 'package:moneyer/models/crypto_model.dart';
import 'package:moneyer/http/client.dart';
import 'package:moneyer/screens/risco.dart';

class InvestPage extends StatefulWidget {
  InvestPage({super.key});

  

  @override
  State<InvestPage> createState() => _InvestPageState();
}

class _InvestPageState extends State<InvestPage> with SingleTickerProviderStateMixin {
  
  TextEditingController calcControl = TextEditingController();
  TextEditingController feeControl = TextEditingController();
  TextEditingController timeControl = TextEditingController();
  
  String coin = "BTC";

  /*void teste (String coin) {
    fetch(coin).then(
                  (crypto) => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => InvestPage(),
                      ),
                  ),
                );
  }*/

  @override

  Widget build(BuildContext context) {

    const TextStyle txtstyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      //height: 1.5,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Investimentos"),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                ListTile(title: Text("Investimentos Baixo Risco", style: txtstyle,), onTap: (){}, leading: Icon(Icons.looks_one_outlined, color: Colors.green,),),
                ListTile(title: Text("Investimentos Médio Risco", style: txtstyle,), onTap: (){}, leading: Icon(Icons.looks_two_outlined, color: Colors.green,),),
                ListTile(title: Text("Investimentos Alto Risco", style: txtstyle,), onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RiscoPage()));}, leading: Icon(Icons.looks_3_outlined, color: Colors.green,),),
              ]
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}