import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get mobile => text().nullable()();
  TextColumn get profilePicture => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

class Bookings extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get seatId => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  TextColumn get status => text()(); // pending, confirmed, cancelled
  RealColumn get amount => real()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Users, Bookings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
