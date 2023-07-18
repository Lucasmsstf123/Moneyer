import 'package:flutter/material.dart';
import 'package:moneyer/screens/empresa.dart';
import 'package:moneyer/screens/pessoal.dart';
import 'package:moneyer/screens/settings.dart';
import 'package:moneyer/models/gastos_model.dart';

List<String> titles = <String>[
  'Pessoal',
  'Empresa',
];

void main() {
  runApp(const Moneyer());
}

class Moneyer extends StatelessWidget {
  const Moneyer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moneyer',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Moneyer'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _personalcosts = 1;
  int _businesscosts = 1;
  TextEditingController nameControl = TextEditingController();
  TextEditingController valueControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();
  TextEditingController expenseControl = TextEditingController();
  TextEditingController editControl = TextEditingController();

  List<Gastos> pgastosList = [];
  List<Gastos> bgastosList = [];
  List<DescExpenses> listaGastos = [];

  @override
  Widget build(BuildContext context) {
    //final ColorScheme colorScheme = Theme.of(context).colorScheme;
    //final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    //final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 2;

    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    const TextStyle txtstyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      //height: 1.5,
    );

    void editGasto(Gastos gasto) {
      setState(() {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Editar Categoria:"),
                content: TextField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Novo nome",
                  ),
                  controller: editControl,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        gasto.name = editControl.text.toString();
                        editControl.text = '';
                      });
                    },
                    child: const Text("Editar"),
                  ),
                ],
              );
            });
      });
    }

    void addpcost() {
      //##############################################################
      setState(() {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Nova Categoria de Gasto:"),
                content: TextField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Nome da Categoria",
                  ),
                  controller: nameControl,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        final gasto =
                            Gastos(nameControl.text.toString(), 0, 1, []);
                        pgastosList.add(gasto);
                        _personalcosts++;
                        nameControl.text = '';
                      });
                    },
                    child: const Text("Criar"),
                  ),
                ],
              );
            });
      });
    } //##############################################################

    void expensesResults(Gastos gasto) {
      gasto.value = 0;
      for (var i = 0; i < gasto.quantExpenses-1; i++) {
        gasto.value = gasto.value + gasto.expenses[i].expense;
      }
    }

    void refreshExpense() {
      for (var i = 0; i < pgastosList.length; i++) {
        expensesResults(pgastosList[i]);
      }
      for (var i = 0; i < bgastosList.length; i++) {
        expensesResults(bgastosList[i]);
      }
    }

    void addPexpense(Gastos mod) {
      //##############################################################
      setState(() {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Novo Gasto na Categoria:"),
                content: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Onde e Data",
                      ),
                      controller: descriptionControl,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Valor",
                      ),
                      controller: expenseControl,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        final expense = DescExpenses(
                            descriptionControl.text.toString(),
                            double.parse(expenseControl.text.toString()));
                        mod.expenses.add(expense);
                        mod.quantExpenses += 1;
                        descriptionControl.text = '';
                        expenseControl.text = '';
                        expensesResults(mod);
                      });
                    },
                    child: const Text("Criar"),
                  ),
                ],
              );
            });
      });
    } //##############################################################

    void addBexpense(Gastos mod) {
      //##############################################################
      setState(() {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Novo Gasto na Categoria:"),
                content: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Onde e Data",
                      ),
                      controller: descriptionControl,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Valor",
                      ),
                      controller: expenseControl,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        final expense = DescExpenses(
                            descriptionControl.text.toString(),
                            double.parse(expenseControl.text.toString()));
                        mod.expenses.add(expense);
                        mod.quantExpenses += 1;
                        descriptionControl.text = '';
                        expenseControl.text = '';
                        expensesResults(mod);
                      });
                    },
                    child: const Text("Criar"),
                  ),
                ],
              );
            });
      });
    } //##############################################################

    void addbcost() {
      //##############################################################
      setState(() {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Nova Categoria de Gasto:"),
                content: TextField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Nome da Categoria",
                  ),
                  controller: nameControl,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        final gasto =
                            Gastos(nameControl.text.toString(), 0, 1, []);
                        bgastosList.add(gasto);
                        _businesscosts++;
                        nameControl.text = '';
                      });
                    },
                    child: const Text("Criar"),
                  ),
                ],
              );
            });
      });
    } //##############################################################

    DefaultTabController pageSelect = DefaultTabController(
      //888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
      initialIndex: 0,
      length: tabsCount,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            title: const Text('Moneyer'),
            actions: <Widget>[
              IconButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsPage(
                                pgastos: pgastosList,
                                bgastos: bgastosList,
                              )));
                },
                icon: const Icon(Icons.list),
              ),
            ],
            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 1;
            },
            scrolledUnderElevation: 4.0,
            shadowColor: Theme.of(context).shadowColor,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: const Icon(Icons.groups),
                  text: titles[0],
                ),
                Tab(
                  icon: const Icon(Icons.business),
                  text: titles[1],
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              //INÍCIO AQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
              Container(
                child: ListView.builder(
                  itemCount: _personalcosts,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      //EXEMPLOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
                      return ListTile(
                        title: const Text(
                          "Categorias Pessoais",
                          style: txtstyle,
                        ),
                        subtitle: const Text(
                          "R\$ Valor dos gastos",
                          style: txtstyle,
                        ),
                        trailing: IconButton(
                          onPressed:  () {
                            refreshExpense();
                            setState(() {
                            });
                          },
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.green,
                          ),
                        ),
                        onTap: () {},
                      );
                    } else {
                      //REAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALLLLLLLLLLLL FUNCIONAAAAAAAAAAAAAAAAAAAALLLLLLLLLLLLLLL
                      return ListTile(
                        leading: IconButton(
                            onPressed: () {
                              editGasto(pgastosList[index - 1]);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            )),
                        title: Text(
                          pgastosList[index - 1].name,
                          style: txtstyle,
                        ),
                        subtitle: Text(
                          "R\$ ${pgastosList[index - 1].value}",
                          style: txtstyle,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            addPexpense(pgastosList[index - 1]);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PessoalPage(
                                        gasto: pgastosList[index - 1],
                                      )));
                        },
                      ); //FIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIMMMMMMMMMMMMMMMMMMMM
                    }
                  },
                ),
              ),
              Container(
                child: ListView.builder(
                  itemCount: _businesscosts,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      //EXEMPLOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
                      return ListTile(
                        title: const Text(
                          "Categorias Empresa",
                          style: txtstyle,
                        ),
                        subtitle: const Text(
                          "R\$ Valor dos gastos",
                          style: txtstyle,
                        ),
                        trailing: IconButton(
                          onPressed:  () {
                            refreshExpense();
                            setState(() {
                            });
                          },
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.green,
                          ),
                        ),
                        onTap: () {},
                      );
                    } else {
                      //REAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALLLLLLLLLLLL FUNCIONAAAAAAAAAAAAAAAAAAAALLLLLLLLLLLLLLL
                      return ListTile(
                        leading: IconButton(
                            onPressed: () {
                              editGasto(bgastosList[index - 1]);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            )),
                        title: Text(
                          bgastosList[index - 1].name,
                          style: txtstyle,
                        ),
                        subtitle: Text(
                          "R\$ ${bgastosList[index - 1].value}",
                          style: txtstyle,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            addBexpense(bgastosList[index - 1]);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmpresaPage(
                                        gasto: bgastosList[index - 1],
                                      )));
                        },
                      ); //FIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIMMMMMMMMMMMMMMMMMMMM
                    }
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (DefaultTabController.of(context).index == 0) {
                addpcost();
              } else {
                addbcost();
              }
            },
            tooltip: 'Create Category',
            child: const Icon(Icons.create_new_folder),
          ),
        );
      }),
    );

    return pageSelect;
  }
}
