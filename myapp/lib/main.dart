import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("App Name"),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: ('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: ('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawer();
}

class _MyDrawer extends State<MyDrawer> {
  int _counter = 0;
  var level = 0;
  int num = 0;
  int counter = 0;
  var _themeColor = Colors.teal; //当前路由主题色
  void _incrementCounter() {
    setState(() {
      _counter++;
      counter++;
      level = (_counter / 10).toInt();
      if (level - num >= 1) {
        num++;
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: _themeColor,
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Column(children: [
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ClipOval(
                          child: Image.asset(
                            "image/flappy.png",
                            width: 80,
                          ),
                        ),
                      ),
                      Text(
                        "等级：",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '($level)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(
                        Color.fromARGB(255, 205, 215, 64)),
                    value: counter / 10,
                  )
                ])),
            Expanded(
              child: ListView(children: <Widget>[
                ListTile(
                  leading: IconButton(
                      icon: Icon(Icons.palette, color: Colors.black),
                      onPressed: () {
                        //切换主题
                        setState(() => _themeColor = _themeColor == Colors.teal
                            ? Colors.blue
                            : Colors.teal);
                      }),
                  title: const Text('切换界面颜色'),
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: _incrementCounter,
                    icon: Icon(Icons.add, color: Colors.black),
                  ),
                  title: const Text('点击增加经验'),
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      _counter = 0;
                      level = 0;
                      counter = 0;
                      num = 0;
                      setState(() {});
                    },
                    icon: Icon(Icons.settings, color: Colors.black),
                  ),
                  title: const Text('点击经验等级清零'),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
