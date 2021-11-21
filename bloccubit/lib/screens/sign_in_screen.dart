import 'package:bloccubit/constants/string_constants.dart';
import 'package:bloccubit/cubit/cubit/sqlitedatabse_cubit.dart';
import 'package:bloccubit/model/user_model.dart';
import 'package:bloccubit/services/data_base_handler.dart';
import 'package:bloccubit/listener/data_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SqlitedatabseCubit>(context).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.title),
        centerTitle: true,
      ),
      body: BlocConsumer<SqlitedatabseCubit, SqlitedatabseState>(
          listener: MyListener.listen,
          builder: (context, state) {
            if (state is SqlitedatabseInitial) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is SqlitedatabseLoaded) {
              return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(Icons.delete_forever),
                      ),
                      key: ValueKey<int>(state.users[index].id!),
                      onDismissed: (DismissDirection direction) async {
                        if (state.users.length > 0) {
                          BlocProvider.of<SqlitedatabseCubit>(context)
                              .deleteUser(state.users[index].id!);
                        }
                        setState(() {
                          state.users.remove(state.users[index]);
                        });
                      },
                      child: Card(
                          child: ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(state.users[index].name),
                        subtitle: Text(state.users[index].age.toString()),
                      )),
                    );
                  });
            } else {
              return Text('Someting went wrong');
            }
          }),
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            BlocProvider.of<SqlitedatabseCubit>(context).addmoreData();
          },
          child: Text('Add Data')),
    );
  }
}
