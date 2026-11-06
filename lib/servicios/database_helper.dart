import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async{
    if(_database != null) return _database!;

    _database = await _initDB('basedetadosgds.db');
    return _database!;
  }

Future _createDB(Database db, int version)async{
  await db.execute('''
CREATE TABLE IF NOT EXISTS mantenimiento(
agenda_id INTEGER PRIMARY  KEY AUTOINCREMENT,
fecha TEXT NULL,
nombre TEXT NULL,
detalle TEXT NULL
);
''');
}

Future <Database> _initDB(String filePath) async{
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, filePath);

  return await openDatabase(
    path,
    version: 1,
    onCreate: _createDB,
  );
}
Future<int> insertarMantenimiento (Map<String, dynamic> row)async{
  final db= await instance.database;
  return await db.insert('mantenimiento', row);
}


Future<List     <Map<String, dynamic>>> obtenerMantenimiento() async {
  final db = await instance.database;
  
  return await db.query('mantenimiento', orderBy: 'mantenimiento_id DESC');
}


Future<void> close()async{
  final db = await instance.database;
  db.close();
}}