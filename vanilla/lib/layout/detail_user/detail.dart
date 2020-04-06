import 'package:flutter/material.dart';
import 'package:vanilla/layout/add_or_edit/page_addoredit.dart';
import 'package:vanilla/model/user.dart';
import 'package:vanilla/typedef.dart';

class DetailUser extends StatelessWidget {
  final User user;
  final UserRemover userRemove;
  final UserUpdate userUpdate;

  const DetailUser({Key key, this.user, this.userRemove, this.userUpdate})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              userRemove(user);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(user.avatar), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                      color: Colors.grey[500],
                      width: 4,
                      style: BorderStyle.solid),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Id',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Text(user.id, style: TextStyle(fontSize: 24)),
              SizedBox(
                height: 24,
              ),
              Text(
                'Full Name',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                user.getFullName(),
                style: TextStyle(fontSize: 32, color: Colors.blue),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PageAddEdit(
              user: user,
              userUpdate: userUpdate,
            ),
          ));
        },
        tooltip: 'Edit User',
        child: new Icon(Icons.edit),
      ),
    );
  }
}
