import 'package:flutter/material.dart';
import 'package:moneyer/models/gastos_model.dart';

final TextStyle txtstyle = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.bold,
  //height: 1.5,
);

class EmpresaPage extends StatefulWidget {
   Gastos gasto;
  EmpresaPage({super.key, required this.gasto});

  

  @override
  State<EmpresaPage> createState() => _EmpresaPageState(gasto);
}

class _EmpresaPageState extends State<EmpresaPage> {
  Gastos gasto;
  _EmpresaPageState(this.gasto);

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
                    onPressed: () {},
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
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                ),
              );
            }
          }),
    );
  }
}
