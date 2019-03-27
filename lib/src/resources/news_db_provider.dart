import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';

class NewsDbProvider {
  Database db;

  init() async {
    // get directory reference on the device
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // get reference for the db file
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        // initial table creation
        newDb.execute("""
          CREATE TABLE Items
            (
              id INTEGER PRIMARY KEY,
              deleted INTEGER,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              dead INTEGER,
              parent INTEGER,
              kids BLOB,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER 
            )
        """);
      },
    );
  }

  fetchItem(int id) async {
    final maps = await db.query(
      'Items',
      columns: null, // like select : ['title', 'other field']
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return maps;
    } 

    return null;
  }
}
