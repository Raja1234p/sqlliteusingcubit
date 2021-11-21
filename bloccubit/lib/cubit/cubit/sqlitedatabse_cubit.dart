import 'package:bloc/bloc.dart';
import 'package:bloccubit/model/user_model.dart';
import 'package:bloccubit/services/data_base_handler.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'sqlitedatabse_state.dart';

class SqlitedatabseCubit extends Cubit<SqlitedatabseState> {
  SqlitedatabseCubit() : super(SqlitedatabseInitial()) {
    handler = DatabaseHandler();
  }

  late DatabaseHandler handler;

  Future init() async {
    this.handler.initializeDB().whenComplete(() async {
      await addUsers();
      final users = await handler.retrieveUsers();
      emit(SqlitedatabseLoaded(users));
    });
  }

  Future<int> addUsers() async {
    User firstUser = User(name: "peter", age: 24, country: "Lebanon");
    User secondUser = User(name: "john", age: 31, country: "United Kingdom");
    List<User> listOfUsers = [firstUser, secondUser];
    return await this.handler.insertUser(listOfUsers);
  }

  Future<List<User>> retrieveUsers() async {
    final Database db = await init();
    final List<Map<String, dynamic>> queryResult = await db.query('users');
    // return queryResult.map((e) => User.fromMap(queryResult)).toList();
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

  Future<void> addmoreData() async {
    await addUsers();
    final users = await handler.retrieveUsers();

    emit(SqlitedatabseLoaded(users));
  }

  Future<void> deleteUser(int id) async {
    final Database db = await handler.initializeDB();
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
