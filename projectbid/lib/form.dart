import 'package:flutter/material.dart';
import 'package:projectbid/buyairtime.dart';

import 'customColor.dart';
import 'model_of_buyairtime.dart';

class AddNew extends StatefulWidget {


  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  List<BuyAirTimes> buyAirTimes = List<BuyAirTimes>();

  String _userName = '';

  String _phoneNumber = '';

  String pooran;
  String poorans;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyAirTime(terminalNodes: L

      )));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Member'),
          centerTitle: true,
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: TextFormField(
                    onSaved: (value) {
                      _userName = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Full Name is Missing';
                      }
                      return null;
                    },
                    key: ValueKey('full namer'),
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      height: 2,
                    ),
                    toolbarOptions: ToolbarOptions(
                      cut: true,
                      copy: true,
                      selectAll: true,
                      paste: true,
                    ),
                    decoration: InputDecoration(
                        hintText: 'UserName',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        contentPadding: EdgeInsets.all(15),
                        isDense: false,
                        helperStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(CustomColors.color('C7C9D0')),
                          letterSpacing: 1,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: TextFormField(
                    onSaved: (value) {
                      _phoneNumber = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Number is Missing';
                      }
                      return null;
                    },
                    key: ValueKey('full namer'),
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      height: 2,
                    ),
                    toolbarOptions: ToolbarOptions(
                      cut: true,
                      copy: true,
                      selectAll: true,
                      paste: true,
                    ),
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        contentPadding: EdgeInsets.all(15),
                        isDense: false,
                        helperStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(CustomColors.color('C7C9D0')),
                          letterSpacing: 1,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 20),
                        child: DropdownButtonFormField(
                            decoration: InputDecoration.collapsed(hintText: ''),
                            hint: Text('Service Provider'),
                            isExpanded: true,
                            value: pooran,
                            onChanged: (val) {
                              pooran = val;
                            },
                            items: raja.map((rp) {
                              return DropdownMenuItem(
                                  value: rp, child: Text(rp));
                            }).toList()),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 20),
                        child: DropdownButtonFormField(
                            decoration: InputDecoration.collapsed(hintText: ''),
                            hint: Text('Service Provider'),
                            isExpanded: true,
                            value: poorans,
                            onChanged: (val) {
                              poorans = val;
                            },
                            items: raja.map((rp) {
                              return DropdownMenuItem(
                                  value: rp, child: Text(rp));
                            }).toList()),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 184,
                    height: 48,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(CustomColors.color('D6A019'))),
                        onPressed: _trySubmit,
                        child: Text('Add & Pay'))),
              ],
            )));
  }

  List raja = ['a', 'b', 'c'];
}
