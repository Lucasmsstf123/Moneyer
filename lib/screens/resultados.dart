import 'package:flutter/material.dart';
import 'package:moneyer/models/gastos_model.dart';

class ResultsPage extends StatefulWidget {
  List<Gastos> pgastos;
  List<Gastos> bgastos;
  ResultsPage({super.key, required this.pgastos, required this.bgastos});

  

  @override
  State<ResultsPage> createState() => _ResultsPageState(pgastos, bgastos);
}

class _ResultsPageState extends State<ResultsPage> {
  List<Gastos> pgastos;
  List<Gastos> bgastos;
  _ResultsPageState(this.pgastos, this.bgastos);
  int day = 30;
  
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

    double med(List<Gastos> g){
      double media = 0;
      for (var i = 0; i < g.length; i++) {
        media = media + g[i].value;
      }
      return media/day;
    }
    double semana(List<Gastos> g)
    {
      double media = 0;
      for (var i = 0; i < g.length; i++) {
        media = media + g[i].value;
      }
      return media/(day/7);
    }

    double total(List<Gastos> g){
      double tot = 0;
      for (var i = 0; i < g.length; i++) {
        tot = tot + g[i].value;
      }
      return tot;
    }

    void days(int day, int change){
      setState(() {
        day = change;
      });  
    }

    DefaultTabController pageSelect = DefaultTabController(//888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
      initialIndex: 0,
      length: 2,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            title: const Text('Resultados'),
            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 1;
            },
            scrolledUnderElevation: 4.0,
            shadowColor: Theme.of(context).shadowColor,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: const Icon(Icons.groups),
                  text: "Pessoal",
                ),
                Tab(
                  icon: const Icon(Icons.business),
                  text: "Empresa",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[//INÍCIO AQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
              Container(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Dias Neste Mês:", style: txtstyle,),
                      subtitle: DropdownButton<int>(value: day ,items: [DropdownMenuItem(value: 28, child: Text("28")), DropdownMenuItem(value: 29, child: Text("29")), DropdownMenuItem(value: 30, child: Text("30")), DropdownMenuItem(value: 31, child: Text("31"))], onChanged: (int? value) {setState(() {day = value!;});},
                      style: txtstyle,
                      dropdownColor: Color.fromARGB(255, 66, 66, 66),
                      )  
                    ),
                    ListTile(
                      title: Text("Total de Gastos: R\$${total(pgastos).toStringAsFixed(2)}", style: txtstyle,),
                    ),
                    ListTile(
                      title: Text("Média por Semana: R\$${semana(pgastos).toStringAsFixed(2)}", style: txtstyle,),
                    ),
                    ListTile(
                      title: Text("Média por Dia: R\$${med(pgastos).toStringAsFixed(2)}", style: txtstyle,),
                    ),
                    ListTile(
                      title: Row(children:[ElevatedButton(onPressed: (){}, child: Text("Limpar Dados")),Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),), ElevatedButton(onPressed: (){}, child: Text("Salvar Dados"))],
                      mainAxisAlignment: MainAxisAlignment.center,),
                    )
                  ],
                )
              ),
             Container(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Dias Neste Mês:", style: txtstyle,),
                      subtitle: DropdownButton<int>(value: day ,items: [DropdownMenuItem(value: 28, child: Text("28")), DropdownMenuItem(value: 29, child: Text("29")), DropdownMenuItem(value: 30, child: Text("30")), DropdownMenuItem(value: 31, child: Text("31"))], onChanged: (int? value) {setState(() {day = value!;});},
                      style: txtstyle,
                      dropdownColor: Color.fromARGB(255, 66, 66, 66),
                      )  
                    ),
                    ListTile(
                      title: Text("Total de Gastos: R\$${total(bgastos).toStringAsFixed(2)}", style: txtstyle,),
                    ),
                    ListTile(
                      title: Text("Média por Semana: R\$${semana(bgastos).toStringAsFixed(2)}", style: txtstyle,),
                    ),
                     ListTile(
                      title: Text("Média por Dia: R\$${med(bgastos).toStringAsFixed(2)}", style: txtstyle,),
                    ),
                    ListTile(
                      title: Row(children:[ElevatedButton(onPressed: (){}, child: Text("Limpar Dados")),Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),), ElevatedButton(onPressed: (){}, child: Text("Salvar Dados"))],
                      mainAxisAlignment: MainAxisAlignment.center,),
                    )
                  ],
                )
                ),
            ],
          ),
        );
      }),
    );

    return pageSelect;
  }
}