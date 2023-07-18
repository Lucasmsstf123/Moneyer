import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DescExpenses {
  String desc;
  double expense;

  DescExpenses(this.desc, this.expense);

  Map<String, dynamic> toMapDesc() {
    return {
      'desc': desc,
      'expense': expense,
    };
  }

  @override
  String toStringDesc() {
    return 'DescExpenses{desc: $desc, expense: $expense}';
  }
}

class Gastos {
  String name;
  double value;
  int quantExpenses;
  List<DescExpenses> expenses;
  
  Gastos(this.name, this.value, this.quantExpenses, this.expenses);
  

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'quantexpenses': quantExpenses,
    };
  }

  @override
  String toString() {
    return 'Gastos{name: $name, value: $value, quantexpenses: $quantExpenses}';
  }
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(), 'expenses_database.db'),
  onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE gastos(quantexpenses INTEGER PRIMARY KEY, name TEXT, value REAL)',
    );
  },
  version: 1,
);

Future<void> insertGastos(Gastos teste) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'gastos',
    teste.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

/*Future<List<Gastos>> gastos() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('gastos');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Gastos(
      quantExpenses: maps[i]['quantexpenses'],
      name: maps[i]['name'],
      value: maps[i]['value'],
    );
  });
}

Future<void> updateGastos(Gastos gasto) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Dog.
  await db.update(
    'gastos',
    gasto.toMap(),
    // Ensure that the Dog has a matching id.
    where: 'name = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [gasto.name],
  );
}

Future<void> deleteGasto(String name) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'gastos',
    // Use a `where` clause to delete a specific dog.
    where: 'name = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [name],
  );
}*/
}