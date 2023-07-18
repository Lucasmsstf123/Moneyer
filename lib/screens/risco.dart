import 'package:flutter/material.dart';
import 'package:moneyer/http/client.dart';
import 'package:moneyer/models/crypto_model.dart';

class RiscoPage extends StatefulWidget {
  const RiscoPage({Key? key}) : super(key: key);

  

  @override
  State<RiscoPage> createState() => _RiscoPageState();
}

class _RiscoPageState extends State<RiscoPage> with SingleTickerProviderStateMixin {
  
  TextEditingController calcControl = TextEditingController();
  TextEditingController feeControl = TextEditingController();
  TextEditingController timeControl = TextEditingController();

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  final coin = fetchCoin("BTC");
  
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
            Text("$coin.coinName")
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