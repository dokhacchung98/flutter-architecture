import 'package:flutter/material.dart';
import 'package:vanilla/layout/detail_user/detail.dart';
import 'package:vanilla/model/user.dart';
import 'package:vanilla/typedef.dart';

class ItemUser extends StatelessWidget {
  final User user;
  final UserRemover userRemove;
  final UserUpdate userUpdate;

  const ItemUser({Key key, this.user, this.userRemove, this.userUpdate})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailUser(
                user: user,
                userRemove: userRemove,
                userUpdate: userUpdate,
              ),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.grey[500],
                  width: 2,
                  style: BorderStyle.solid,
                ),
                image: DecorationImage(
                    image: NetworkImage(user.avatar), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(user.getFullName()),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Id ${user.id}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
