import 'package:flutter/material.dart';
import 'package:moneyer/http/client.dart';
import 'package:moneyer/models/crypto_model.dart';

class RiscoPage extends StatefulWidget {
  RiscoPage({Key? key}) : super(key: key);

  @override
  State<RiscoPage> createState() => _RiscoPageState();
}

class _RiscoPageState extends State<RiscoPage>
    with SingleTickerProviderStateMixin {
  TextEditingController siglaControl = TextEditingController();

  Crypto coin = Crypto(
      coinName: "--------",
      acronym: "---",
      marketPrice: 0.0,
      daylow: 0.0,
      dayhigh: 0.0,
      img: "https://www.iconpacks.net/icons/1/free-coin-icon-794-thumb.png");

  void setCoin(String sigla) async {
    coin = await fetchCoin(sigla);
    setState(() {
    });
    
  }

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
        title: Text("Alto Risco"),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: TextField(decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                prefixIcon: Icon(Icons.search, color: Colors.white,),
                      hintText: "Sigla da moeda a perquisar:",
                      hintStyle: txtstyle,
                    ),
                    style: txtstyle,
                    controller: siglaControl,),
            ),
            ListTile(title: Text(
              'Nome:   ${coin.coinName} (${coin.acronym})',
              style: txtstyle,
            ),
            leading: Icon(Icons.currency_bitcoin, color: Colors.green,),),
            ListTile(title: Text(
              'Valor:   R\$${(coin.marketPrice).toStringAsFixed(2)}',
              style: txtstyle,
            ),
            leading: Icon(Icons.attach_money, color: Colors.green,),
            ),
            ListTile(title: Text(
              'Baixa:   R\$${(coin.daylow).toStringAsFixed(2)}',
              style: txtstyle,
            ),
            leading: Icon(Icons.keyboard_double_arrow_down_rounded, color: Colors.green,),),
            ListTile(title: Text(
              'Alta:   R\$${(coin.dayhigh).toStringAsFixed(2)}',
              style: txtstyle,
            ),
            leading: Icon(Icons.keyboard_double_arrow_up_rounded, color: Colors.green,),),
            Expanded(child: Center(
                child: Image.network(
                  '${coin.img}',
                  height: 100,
                  width: 100,
                ),
              ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setCoin(siglaControl.text.toUpperCase());
        },
        tooltip: 'Search',
        child: const Icon(Icons.search_rounded),
      ),
    );
  }
}
