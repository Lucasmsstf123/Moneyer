import 'package:flutter/material.dart';
import 'package:moneyer/models/gastos_model.dart';

final TextStyle txtstyle = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.bold,
  //height: 1.5,
);

class PessoalPage extends StatefulWidget {
   Gastos gasto;
  PessoalPage({super.key, required this.gasto});

  

  @override
  State<PessoalPage> createState() => _PessoalPageState(gasto);
}

class _PessoalPageState extends State<PessoalPage> {
  Gastos gasto;
  _PessoalPageState(this.gasto);

  TextEditingController editNameControl = TextEditingController();
  TextEditingController editValueControl = TextEditingController();

  void editExpense(DescExpenses desc){
      setState(() {
        showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: const Text("Editar Gasto:"),
              content: Column(children: [TextField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Novo nome",
                    ),
                    controller: editNameControl,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Novo valor",
                    ),
                    controller: editValueControl,
                  ),
                  ],),
                  
                  
              actions: [
                ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("Cancelar"),),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                  setState(() {
                    desc.desc = editNameControl.text.toString();
                    desc.expense = double.parse(editValueControl.text.toString());
                  });
                  
                  }, 
                  child: const Text("Editar"),),
              ],
            );
          });
      });
    }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gasto.name),
      ),
      backgroundColor: Colors.grey.shade900,
      body: ListView.builder(
          itemCount: gasto.quantExpenses,
          itemBuilder: (BuildContext context, index) {
            if (index == 0) {
              return ListTile(
                title: Text(
                  "Descrição",
                  style: txtstyle,
                ),
                subtitle: Text(
                  "R\$ Valor",
                  style: txtstyle,
                ),
                trailing: IconButton(
                  onPressed: () {setState(() {
                    
                  });},
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.green,
                  ),
                ),
              );
            } else {
              return ListTile(
                leading: IconButton(
                    onPressed: () {editExpense(gasto.expenses[index-1]);},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.grey,
                    )),
                title: Text(
                  "${gasto.expenses[index-1].desc}",
                  style: txtstyle,
                ),
                subtitle: Text(
                  "R\$${gasto.expenses[index-1].expense}",
                  style: txtstyle,
                ),
              );
            }
          }),
    );
  }
}
