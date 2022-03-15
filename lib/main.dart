import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Password App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  static String password = "12345";
  String input = "";

  void delete() {
    setState(() {
      if (input.length > 0)
        input = input.substring(0, input.length-1);
    });
  }

  void addNum(String num) {
    setState(() {
      input += num;
      if (input == password) {
        input = "";
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SuccessPage())
        );
      } else if (input.length == password.length) {
        input = "";
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => IncorrectPasswordPage())
        );
      }
    });
  }

  void clear() {
    setState(() {
      input = "";
    });
  }

  void set() {
    setState(() {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => SetPassword())
      );
    });
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
          children: [

            Text("Enter the password:", style: TextStyle(fontSize: 25.0,)),
            Text("\n" + input + "\n", style: TextStyle(fontSize: 25.0),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                FlatButton(
                  child: Text("1"),
                  onPressed: () {addNum("1");},
                ),
                FlatButton(
                  child: Text("2"),
                  onPressed: () {addNum("2");},
                ),
                FlatButton(
                  child: Text("3"),
                  onPressed: () {addNum("3");},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                FlatButton(
                  child: Text("4"),
                  onPressed: () {addNum("4");},
                ),
                FlatButton(
                  child: Text("5"),
                  onPressed: () {addNum("5");},
                ),
                FlatButton(
                  child: Text("6"),
                  onPressed: () {addNum("6");},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                FlatButton(
                  child: Text("7"),
                  onPressed: () {addNum("7");},
                ),
                FlatButton(
                  child: Text("8"),
                  onPressed: () {addNum("8");},
                ),
                FlatButton(
                  child: Text("9"),
                  onPressed: () {addNum("9");},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                FlatButton(
                  child: Text("Clear"),
                  onPressed: clear,
                  color: Colors.red,
                ),
                FlatButton(
                  child: Text("0"),
                  onPressed: () {addNum("0");},
                ),
                FlatButton(
                  child: Text("Delete"),
                  onPressed: delete,
                  color: Colors.blue,
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: FlatButton(
                    child: Text(" Set a new password "),
                    color: Colors.grey[350],
                    onPressed: set,
                  )
                )
              ],
            )
          ]

        )
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You entered the correct password!\n", style: TextStyle(
            color: Colors.black,
          ),),
          FlatButton(
            child: Text("\n  Enter password again  \n", style: TextStyle(
                fontSize: 20.0
            )),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Password App"))
              );
            },
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}

class IncorrectPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Incorrect password!\n", style: TextStyle(
            color: Colors.black
          )),
          FlatButton(
            child: Text("\n  Reenter password  \n", style: TextStyle(
              fontSize: 20.0
            )),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Password App"))
              );
            },
            color: Colors.blue
          )
        ]
      )
    );
  }
}

class SetPassword extends StatefulWidget {

  @override
  _SetPasswordState createState() => _SetPasswordState();

}

class _SetPasswordState extends State<SetPassword> {

  String input = "";

  void addNum(String num) {
    setState(() {
      input += num;
    });
  }

  void delete() {
    setState(() {
      input = input.substring(0, input.length-1);
    });
  }

  void clear() {
    setState(() {
      input = "";
    });
  }

  void set() {
    setState(() {
      _MyHomePageState.password = input;
      print("New password: " + input);
      input = "";
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Password App")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Set Password"),
      ),
      body: Center(

          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Set your password:", style: TextStyle(fontSize: 25.0,)),
                Text("\n" + input + "\n", style: TextStyle(fontSize: 25.0),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    FlatButton(
                      child: Text("1"),
                      onPressed: () {addNum("1");},
                    ),
                    FlatButton(
                      child: Text("2"),
                      onPressed: () {addNum("2");},
                    ),
                    FlatButton(
                      child: Text("3"),
                      onPressed: () {addNum("3");},
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    FlatButton(
                      child: Text("4"),
                      onPressed: () {addNum("4");},
                    ),
                    FlatButton(
                      child: Text("5"),
                      onPressed: () {addNum("5");},
                    ),
                    FlatButton(
                      child: Text("6"),
                      onPressed: () {addNum("6");},
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    FlatButton(
                      child: Text("7"),
                      onPressed: () {addNum("7");},
                    ),
                    FlatButton(
                      child: Text("8"),
                      onPressed: () {addNum("8");},
                    ),
                    FlatButton(
                      child: Text("9"),
                      onPressed: () {addNum("9");},
                    )
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      FlatButton(
                        child: Text("Clear"),
                        onPressed: clear,
                        color: Colors.red,
                      ),
                      FlatButton(
                        child: Text("0"),
                        onPressed: () {addNum("0");},
                      ),
                      FlatButton(
                        child: Text("Delete"),
                        onPressed: delete,
                        color: Colors.blue,
                      )
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        child: FlatButton(
                          child: Text(" Set password "),
                          color: Colors.grey[350],
                          onPressed: set,
                        )
                    )
                  ],
                )
              ]

          )
      ),
    );
  }

}