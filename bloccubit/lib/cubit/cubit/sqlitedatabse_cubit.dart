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
  int? id;
  late DatabaseHandler handler;

  Future init() async {
    this.handler.initializeDB().whenComplete(() async {
      // await addUsers();
      final users = await handler.retrieveUsers();
      emit(SqlitedatabseLoaded(users));
      // emit(Empty());
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

  doLike(int index) async {
    id = index;
    emit(Like());
  }

  disLike(int index, int id) {
    id = index;
    emit(DisLike(false));
  }

  Future<void> addmoreData({String? name, String? description}) async {
    // User firstUser = User(name: "peter", age: 24, country: "Lebanon");
    // User secondUser = User(name: "john", age: 31, country: "United Kingdom");
    List<User> listOfUsers = [];
    DateTime now = DateTime.now();
    DateTime currentTime = new DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);
    listOfUsers.add(
      User(
          name: name!,
          age: 12,
          country: 'pakistan',
          describtion: description!,
          dateTime: currentTime.toString(),
          like: 0),
    );
    if (listOfUsers.isNotEmpty) {
      await this.handler.insertUser(listOfUsers);

      final users = await handler.retrieveUsers();

      emit(SqlitedatabseLoaded(users));
    } else {
      print('asdfsdf');
    }
  }

  Future<void> deleteUser(int id) async {
    final Database db = await handler.initializeDB();
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(User user) async {
    final Database db = await handler.initializeDB();
    int result = await db
        .update("users", user.toMap(), where: "id = ?", whereArgs: [user.id]);
    final users = await handler.retrieveUsers();

    emit(SqlitedatabseLoaded(users));
    return result;
  }
}
