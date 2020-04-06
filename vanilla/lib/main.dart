import 'package:flutter/material.dart';
import 'package:vanilla/layout/add_or_edit/page_addoredit.dart';
import 'package:vanilla/layout/main/item_list.dart';
import 'package:vanilla/layout/main/loading.dart';
import 'package:vanilla/repository/user_repository.dart';

import 'model/user.dart';

void main() {
  UserRepository _userRepository = UserRepository();
  runApp(MyApp(
    userRepository: _userRepository,
  ));
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
      home: MyHomePage(
        title: 'List User Vanilla',
        userRepository: widget.userRepository,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final UserRepository userRepository;

  const MyHomePage({Key key, this.title, this.userRepository})
      : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;
  List<User> _listUser;

  void addNewUser(User user) {
    if (!_listUser.any((t) => t.id == user.id)) {
      setState(() {
        _listUser.add(user);
      });
    }
  }

  void removeUser(User user) {
    setState(() {
      _listUser.remove(user);
    });
  }

  void updateUser(User user,
      {String id, String firstName, String lastName, String avatar}) {
    setState(() {
      user.avatar = avatar ?? user.avatar;
      user.firstName = firstName ?? user.firstName;
      user.lastName = lastName ?? user.lastName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        child: !_isLoading
            ? viewMain()
            : FutureBuilder(
                future: widget.userRepository.fetchUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _isLoading = false;
                    _listUser = snapshot.data;

                    return viewMain();
                  } else if (snapshot.hasError) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Error get list user',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ));
                    return viewMain();
                  }
                  return BuildLoading();
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_isLoading) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PageAddEdit(
                userAdd: addNewUser,
              ),
            ));
          }
        },
        tooltip: 'Add User',
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget viewMain() {
    return (Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final item = _listUser[index];
          return Dismissible(
            onDismissed: (_) {
              removeUser(item);
            },
            key: Key(item.id),
            child: ItemUser(
              user: item,
              userRemove: removeUser,
              userUpdate: updateUser,
            ),
          );
        },
        itemCount: _listUser.length,
      ),
    ));
  }
}
