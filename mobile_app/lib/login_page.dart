import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hack_tues__gg/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  login(String username, String password, BuildContext context, bool _isLoading) async{
      Map data= {
        'username': username,
        'password': password
      };
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var jsonData = null;
      var response = await http.post("/", body: data);///link
      if(response.statusCode == 200){
        jsonData = json.decode(response.body);
        setState((){
          _isLoading = false;
          sharedPreferences.setString("token", jsonData['token']);
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyApp()),
          (Route<dynamic> route) => false);
        });
      }
      else{
        print(response.body);
      }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.teal
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
        children: <Widget>[
          headingSection(context),
          //usernameEmailSection(context),
          // username and email section
            Container(
            //padding
            child: Column(
              children: <Widget>[
                //username
                TextFormField(
                  controller: usernameController,
                  style: TextStyle(color: Colors.white60),
                  decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.white60),
                    icon: Icon(Icons.account_box_rounded),
                  ),
                ),
                SizedBox(),
                //pass      
                TextFormField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.white60),
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white60),
                    icon: Icon(Icons.lock),
                  ),
                ),
              ],)
            ),
            // buttonSection(context, _isLoading)
            Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            //margin: EdgeInsets.only
            //padding
            child: RaisedButton(
              onPressed: (){
                setState(() {
                  _isLoading = true;
                });
                
                login(usernameController.text, passwordController.text, context, _isLoading);
                
              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),

              ),
              child: Text("Sign in", style: TextStyle(color: Colors.white70),)
            )
          )
        ],
      ),
    );
  }
}
TextEditingController usernameController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

Container headingSection(BuildContext context){
  return Container(
    //padding
    child: Text(
      "Login",
      style: TextStyle(color: Colors.black),)
  );
}


