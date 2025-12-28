import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/datasources/local/app_database.dart' as db;
import '../data/datasources/remote/studynest_api.dart';
import '../data/repositories/studynest_repository_impl.dart';
import '../domain/repositories/studynest_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: 'https://api.studynest.com/v1'));
});

final appDatabaseProvider = Provider<db.AppDatabase>((ref) {
  return db.AppDatabase();
});

final studyNestApiProvider = Provider<StudyNestApi>((ref) {
  final dio = ref.watch(dioProvider);
  return StudyNestApi(dio);
});

final studyNestRepositoryProvider = Provider<StudyNestRepository>((ref) {
  final api = ref.watch(studyNestApiProvider);
  final db = ref.watch(appDatabaseProvider);
  return StudyNestRepositoryImpl(api, db);
});
