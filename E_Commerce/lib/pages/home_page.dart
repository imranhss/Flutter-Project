import 'package:e_commerce/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel Rents"),
      ),
      body: Center(
        child: Container(
            child: Text("Hello")
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
