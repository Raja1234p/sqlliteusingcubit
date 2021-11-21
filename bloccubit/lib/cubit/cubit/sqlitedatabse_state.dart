part of 'sqlitedatabse_cubit.dart';

@immutable
abstract class SqlitedatabseState {}

class SqlitedatabseInitial extends SqlitedatabseState {}

class SqlitedatabseAddes extends SqlitedatabseState {}

class SqlitedatabseDelete extends SqlitedatabseState {
  final String deleted;

  SqlitedatabseDelete(this.deleted);
}

class SqlitedatabseFailed extends SqlitedatabseState {}

class SqlitedatabseLoading extends SqlitedatabseState {}

class RemoveLoading extends SqlitedatabseState {}

class SqlitedatabseLoaded extends SqlitedatabseState {
  final List<User> users;
  SqlitedatabseLoaded(this.users);
}
