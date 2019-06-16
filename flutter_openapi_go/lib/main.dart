import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _userAge = 0;
  String _userName = '';

  List<User> _displayUsers = new List();

  void _addUser() {
    var api = new AddUserApi();
    User user = new User();
    user.age = this._userAge;
    user.name = this._userName;
    api.userAddPost(user: user);
  }

  void _getUser() {
    var api = new UsersApi();
    Future<List<User>> users = api.usersGet();
    users.then((content) => setState(() {
          this._displayUsers = content;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration:
                  new InputDecoration(labelText: "Enter register user name "),
              onChanged: (v) => this._userName = v,
            ),
            new TextField(
              decoration:
                  new InputDecoration(labelText: "Enter register user age"),
              keyboardType: TextInputType.number,
              onChanged: (v) => this._userAge = int.parse(v),
            ),
            Text(
              '$_displayUsers',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _addUser,
            tooltip: 'User Register',
            child: Icon(Icons.add),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              onPressed: _getUser,
              tooltip: 'All User Get',
              child: Icon(Icons.autorenew),
            ),
          ),
        ],
      ),
    );
  }
}
