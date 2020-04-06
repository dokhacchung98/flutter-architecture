import 'model/user.dart';

typedef UserAdder = void Function(User user);

typedef UserRemover = void Function(User user);

typedef UserUpdate = void Function(User user,
    {String id, String firstName, String lastName, String avatar});
