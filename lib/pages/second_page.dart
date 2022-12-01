import 'package:flutter/material.dart';
import 'package:gamezone/ViewModels/DrawerMenu.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.menu}) : super(key: key);

  final DrawerMenu menu;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.menu.title), centerTitle: true,),
      body: widget.menu.destination,
    );
  }
}
