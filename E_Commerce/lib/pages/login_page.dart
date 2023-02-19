import 'package:e_commerce/util/route.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
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
<<<<<<< Updated upstream
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
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoute.homeRoute);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
=======
              Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name to Hotel Rents",
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
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 32.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(hintText: "Enter User Name"),
                      //for Validation as like Bootstrape
                    validator: (value) {
                        if (value!.isEmpty) {
                          return "User Name can not be empty";
                        }
                        return null;
                      },
                      // on change effect
                      onChanged: (value) {
                        this.name = value;
                        // Reload the UI
                        setState(() {});
                      },

                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Enter Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can not be empty";
                        }
                        else if (value.length<6) {
                          return "Password length should be minimum 6";
                        }

                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    InkWell(
                      onTap: () => moveToHome(context),


                      
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 40,
                        width: changeButton ? 50 : 150,
                        // placed to decoration
                        // color: Colors.deepPurple,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                            : Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 10),
                        ),
>>>>>>> Stashed changes
                      ),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size(150, 40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
