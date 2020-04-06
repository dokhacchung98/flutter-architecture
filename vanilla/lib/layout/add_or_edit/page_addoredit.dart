import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vanilla/model/user.dart';
import 'package:vanilla/typedef.dart';

class PageAddEdit extends StatefulWidget {
  final UserAdder userAdd;
  final UserUpdate userUpdate;
  final User user;

  PageAddEdit({Key key, this.userAdd, this.user, this.userUpdate}) : super(key: key);

  @override
  _PageAddEditState createState() => _PageAddEditState();
}

class _PageAddEditState extends State<PageAddEdit> {
  bool get isAdding => widget.user == null;
  String id;
  String firstName;
  String lastName;
  String avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isAdding ? 'Add User' : 'Edit User'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            autovalidate: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Id'),
                TextFormField(
                  key: Key("id"),
                  onSaved: (value) => id = value,
                  initialValue: widget.user != null ? widget.user.id : '',
                  enabled: widget.user == null,
                  validator: (val) =>
                      val.trim().isEmpty ? 'Please enter the id' : null,
                ),
                Text('Avatar'),
                TextFormField(
                  key: Key("avatar"),
                  onSaved: (value) => id = value,
                  initialValue: widget.user != null
                      ? widget.user.avatar
                      : 'https://randomuser.me/api/portraits/thumb/men/0.jpg',
                  enabled: widget.user == null,
                  validator: (val) =>
                      val.trim().isEmpty ? 'Please enter the Avatar' : null,
                ),
                Text('First Name'),
                TextFormField(
                  key: Key("firstName"),
                  onSaved: (value) => id = value,
                  initialValue:
                      widget.user != null ? widget.user.firstName : '',
                  enabled: widget.user == null,
                  validator: (val) =>
                      val.trim().isEmpty ? 'Please enter the first name' : null,
                ),
                Text('Last Name'),
                TextFormField(
                  key: Key("lastName"),
                  onSaved: (value) => id = value,
                  initialValue: widget.user != null ? widget.user.lastName : '',
                  enabled: widget.user == null,
                  validator: (val) =>
                      val.trim().isEmpty ? 'Please enter the last name' : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
