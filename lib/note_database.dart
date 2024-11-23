import "package:sqflite/sqflite.dart";
import "package:warehouse_helper/entities/note.dart";

class NoteDatabase {
  static final NoteDatabase instance = NoteDatabase._internal();

  static Database? _database;

  NoteDatabase._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        part TEXT NOT NULL,
        warehouse TEXT NOT NULL
        img TEXT NOT NULL
      )
    ''');
  }

  Future<Database> _initDatabase() async {

    final databasePath = await getDatabasesPath();
    final path = '$databasePath/warehouseNotes.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> insertNote(Note note) async =>
      await (await database).insert('notes', note.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);

  Future<List<Note>> findNotes() async {
    final db = await database;

    final List<Map<String, Object?>> notesMap = await db.query('notes');

    return [
      for (final {
            'id': id as int,
            'title': title as String,
            'part': part as String,
            'warehouse': warehouse as String,
            'img': img as String
          } in notesMap)
        Note(id: id, title: title, part: part, warehouse: warehouse, img: img)
    ];
  }
}
