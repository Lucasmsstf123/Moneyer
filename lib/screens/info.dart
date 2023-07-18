import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  InfoPage({super.key});

  

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  
  TextEditingController calcControl = TextEditingController();
  TextEditingController feeControl = TextEditingController();
  TextEditingController timeControl = TextEditingController();
  
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
        title: Text("Informações"),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                    Text("Porque Poupar?", style: txtstyle,),
                    Text("Porque Investir?", style: txtstyle,),
                    Text("Como Começar?", style: txtstyle,),
                    Text("O Que É Baixo Risco?", style: txtstyle,),
                    Text("O Que É Médio Risco?", style: txtstyle,),
                    Text("O Que É Alto Risco?", style: txtstyle,),
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