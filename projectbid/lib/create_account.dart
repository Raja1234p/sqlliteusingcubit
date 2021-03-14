import 'package:flutter/material.dart';
import 'package:projectbid/customColor.dart';

class CreateAccount extends StatefulWidget {
  final void Function(String fullName, String userName, String phoneNumber,
      String password, bool isLogin, BuildContext ctx) submitFn;
  final bool isLoading;

  const CreateAccount(this.submitFn, this.isLoading);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _isLogin = true;
  var _fullName = '';

  var _userName = '';
  var _phoneNumber = '';
  var _password = '';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_fullName.trim(), _userName.trim(), _phoneNumber.trim(),
          _password.trim(), _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin?'Welcome':
          'Create Account',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(color: Color(CustomColors.color('1D2D50'))),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.13,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: TextFormField(
                    onSaved: (value) {
                      _fullName = value;
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
                        hintText: 'Full Name',
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
                if (!_isLogin)
                SizedBox(
                  height: size.height * 0.03,
                ),
                if (!_isLogin)
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: TextFormField(
                    onSaved: (value) {
                      _userName = value;
                    },
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'User name is Missing';
                      }
                      return null;
                    },
                    key: ValueKey('user name'),
                    decoration: InputDecoration(
                        hintText: 'User Name',
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
                  height: size.height * 0.03,
                ),
                if(!_isLogin)
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'phone number is missing';
                      }
                      return null;
                    },
                    key: ValueKey('phone number'),
                    onSaved: (value) {
                      _phoneNumber = value;
                    },
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
                if (!_isLogin)
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty && value.length > 4) {
                        return 'please enter at least five character';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                    obscureText: true,
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
                        hintText: 'Password',
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Color(CustomColors.color('C7C9D0')),
                        ),
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
                  height: size.height * 0.1,
                ),
                if (widget.isLoading) CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),

                if (!widget.isLoading)
                SizedBox(
                  width: size.width * 0.4,
                  height: size.width * 0.15,
                  child: SizedBox(height: 10,),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                if (!widget.isLoading)
                TextButton(
                  onPressed: (){
                    setState(() {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    });
                  },
                  child: Text( _isLogin?'Create an Account': 'Have an Account?',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(CustomColors.color('FFFFFF')),
                        letterSpacing: 1,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
