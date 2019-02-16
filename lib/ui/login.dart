import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  LogInState createState() {
    return LogInState();
  }
}

class LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  List<bool> chk = [false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Image.asset(
                    "resources/pic.jpg",
                    height: 150,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "User Id",
                    hintText: "Please input your user",
                    icon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    //add conditions when user input here!!
                    if (value.isEmpty) {
                      return "กรุณาระบุ user";
                    } else if (value.compareTo("admin") == 0) {
                      chk[0] = true;
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Please input your password",
                    icon: Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "กรุณาระบุ password";
                    } else if (value.compareTo("admin") == 0) {
                      chk[1] = true;
                    }
                  },
                ),
                RaisedButton(
                  child: Text("LOGIN"),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("กรุณาระบุ user or password")));
                    } else if (chk[0] == true && chk[1] == false) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("user or password ไม่ถูกต้อง")));
                    } else if (chk[1] == true && chk[0] == false) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("user or password ไม่ถูกต้อง"),
                      ));
                    } else if (chk[1] == true && chk[0] == true) {
                      Navigator.pushNamed(context, "/home");
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("user or password ไม่ถูกต้อง"),
                      ));
                    }
                    chk[0] = false;
                    chk[1] = false;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text("Register New Account"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
