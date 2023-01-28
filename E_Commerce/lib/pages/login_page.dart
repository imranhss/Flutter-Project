import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome to Hotel Rents",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Colors.orangeAccent,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter User Name"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Enter Password"),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                    onPressed: (){

                    },
                    child: Text("Login"),

                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
