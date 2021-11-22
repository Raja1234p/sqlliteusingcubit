import 'package:bloccubit/common_component/facebook_like_widget.dart';
import 'package:bloccubit/common_component/textfiled_component.dart';
import 'package:bloccubit/constants/string_constants.dart';
import 'package:bloccubit/cubit/cubit/sqlitedatabse_cubit.dart';
import 'package:bloccubit/listener/data_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameText = TextEditingController();
  final descriptionText = TextEditingController();
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
      body: SingleChildScrollView(
        child: BlocConsumer<SqlitedatabseCubit, SqlitedatabseState>(
            listener: MyListener.listen,
            builder: (context, state) {
              if (state is SqlitedatabseInitial) {}
              if (state is SqlitedatabseLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFileComponent(
                        textEditingController: nameText,
                        hint: 'Name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFileComponent(
                        textEditingController: descriptionText,
                        hint: 'Description',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
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
                                  child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.all(8.0),
                                    title: Text(
                                        'UserName: ${state.users[index].name}'),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            'Des: ${state.users[index].describtion!}'),
                                        Text(state.users[index].dateTime
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          child: FacebookWidget(
                                            text: 'Coment',
                                            iconData: Icons
                                                .messenger_outline_outlined,
                                          ),
                                        ),
                                        GestureDetector(
                                          child: FacebookWidget(
                                            text: 'Like',
                                            iconData:
                                                Icons.favorite_border_outlined,
                                          ),
                                        ),
                                        FacebookWidget(
                                          text: 'Share',
                                          iconData: Icons.arrow_forward,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            );
                          }),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFileComponent(
                        textEditingController: nameText,
                        hint: 'Name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFileComponent(
                        textEditingController: descriptionText,
                        hint: 'Description',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
      bottomNavigationBar: ElevatedButton(
          onPressed: () async {
            print(nameText.text);
            await BlocProvider.of<SqlitedatabseCubit>(context).addmoreData(
                name: nameText.text, description: descriptionText.text);
            nameText.clear();
            descriptionText.clear();
          },
          child: Text('Add Data')),
    );
  }
}
