import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vanilla/model/user.dart';
import 'package:vanilla/typedef.dart';

class PageAddEdit extends StatefulWidget {
  final UserAdder userAdd;
  final UserUpdate userUpdate;
  final User user;

  PageAddEdit({Key key, this.userAdd, this.user, this.userUpdate})
      : super(key: key);

  @override
  _PageAddEditState createState() => _PageAddEditState();
}

class _PageAddEditState extends State<PageAddEdit> {
  bool get isAdding => widget.user == null;
  String id;
  String firstName;
  String lastName;
  String avatar;
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isAdding ? 'Add User' : 'Edit User'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              autovalidate: false,
              onWillPop: () {
                return Future(() => true);
              },
              key: formKey,
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
                    onSaved: (value) => avatar = value,
                    initialValue: widget.user != null
                        ? widget.user.avatar
                        : 'https://randomuser.me/api/portraits/thumb/men/0.jpg',
                    validator: (val) =>
                        val.trim().isEmpty ? 'Please enter the Avatar' : null,
                  ),
                  Text('First Name'),
                  TextFormField(
                    key: Key("firstName"),
                    onSaved: (value) => firstName = value,
                    initialValue:
                        widget.user != null ? widget.user.firstName : '',
                    validator: (val) => val.trim().isEmpty
                        ? 'Please enter the first name'
                        : null,
                  ),
                  Text('Last Name'),
                  TextFormField(
                    key: Key("lastName"),
                    onSaved: (value) => lastName = value,
                    initialValue:
                        widget.user != null ? widget.user.lastName : '',
                    validator: (val) => val.trim().isEmpty
                        ? 'Please enter the last name'
                        : null,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Align(
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        final form = formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          if (isAdding) {
                            widget.userAdd(User(
                                id: id,
                                avatar: avatar,
                                firstName: firstName,
                                lastName: lastName));
                          } else {
                            widget.userUpdate(widget.user,
                                id: id,
                                avatar: avatar,
                                firstName: firstName,
                                lastName: lastName);
                          }
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        isAdding ? 'Add' : 'Edit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
