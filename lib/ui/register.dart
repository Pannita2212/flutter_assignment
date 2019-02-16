import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool chk =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTER"),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Please input your email",
                    icon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    //add conditions when user input here!!
                    if (value.isEmpty) {
                      return "กรุณาระบุ email";
                    } else if (value.compareTo("admin") == 0) {
                      chk = true;
                    }else{chk = false;}
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
                    }
                    
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Please confirm your password",
                    icon: Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "กรุณายืนยัน password";
                    }
                    
                  },
                ),
                RaisedButton(
                  child: Text("CONTINUE"),
                  onPressed: () {
                    if(!_formKey.currentState.validate()){
                      Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('กรุณาระบุข้อมูลให้ครบถ้วน')));
                    }else if(chk ==true){
                      Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('user นี้มีอยู่ในระบบแล้ว')));
                    }
                    else{
                      Navigator.pushNamed(context, '/login');
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
