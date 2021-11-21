import 'package:bloccubit/cubit/cubit/sqlitedatabse_cubit.dart';
import 'package:flutter/material.dart';

class MyListener {
  static Future listen(BuildContext context, SqlitedatabseState state) async {
    if (state is SqlitedatabseLoading) {
      return Dialog(child: CircularProgressIndicator());
    }

    if (state is RemoveLoading) {
      Navigator.pop(context);
    }
  }
}
