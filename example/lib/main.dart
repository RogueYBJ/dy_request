//import 'package:example/model/accountService_selectOwnerDeliverList_list_model.dart';
//import 'package:example/model/accountService_selectOwnerDeliverList_model.dart';
import 'package:file_model/file_model.dart';
import 'package:flutter/material.dart';

import 'package:dy_request/dy_request.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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

class _MyHomePageState<T> extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DioUtil.result = ConnectivityResult.wifi;

    OverlayCreate.context = context;

    login();
  }

  void login() {
    Map data = {
      "mobile": "15988444941",
      "verifyCode": "888888",
      "userType": 2,
      "deviceToken": "",
      "deviceType": 1 //设备 1:iOS  2:Android
    };
    apiASLogin(data);
  }

  void getList() {
    apiDSSelectOwnerDeliverList().then((list) {
      for (var model in list) {
        print(model.deliverId);
      }
    });
  }

  List<Widget> viewList = [];

  void _incrementCounter() async {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new NotificationListener<StateNotification>(
      onNotification: (n){
        if (n.mainState == MainState.login) {
          print(MainState.login.toString());
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getView('发送验证码',
                  action: () => apiASSendVevifyCode(
                      {'mobile': '15988444941', 'userType': 2})),
              getView('登录', action: () => login()),
              getView('货主根据条件查看订单',
                  action: () => apiDSSelectOwnerDeliverList()),
              getView('获取常用发货位置', action: () => apiOASSelectList()),
              getView('发货', action: () => apiASInsert()),
              getView('双乾收货', action: () => apiDSTakeDelivery2()),
              getView('清空token', action: () {
                DioUtil.token = '';
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget getView(String text, {Function action}) {
    
    return new GestureDetector(
      onTap: action,
      child: new Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        color: Colors.green,
        child: new Center(
          child: new Text(text),
        ),
      ),
    );
  }
}
