import 'package:flutter/material.dart';
import 'package:vanilla/layout/loading.dart';
import 'package:vanilla/repository/user_repository.dart';

import 'model/user.dart';

void main() {
  UserRepository _userRepository = UserRepository();
  runApp(MyApp(userRepository: _userRepository,));
}

class MyApp extends StatefulWidget {
  final UserRepository userRepository;

  const MyApp({Key key, this.userRepository}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Vanilla', userRepository: widget.userRepository,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final UserRepository userRepository;

  MyHomePage({Key key, this.title, this.userRepository}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  List<User> _listUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _isLoading ? BuildLoading() : BuildLoading()
    );
  }
}
