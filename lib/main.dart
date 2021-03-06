import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/device_info.dart';
import 'package:flutter_demo/demo/snow_man.dart';
import 'package:flutter_demo/model/widget_models.dart';

import 'demo/introduction_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo'),
      //注册路由表
      routes: {
        "/": (context) => const MyHomePage(title: 'Flutter Demo'),
        "introduction_page": (context) => const IntroductionPage(),
        "device_info": (context) => const DeviceInfo(),
        "snow_man": (context) => const SnowMan(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _demoList = <DrawListItem>[
    DrawListItem("DeviceInfo", "device_info", const Icon(Icons.info)),
    DrawListItem("SnowMan", "snow_man", const Icon(Icons.games)),
    DrawListItem(
        "Introduction", "introduction_page", const Icon(Icons.description)),
  ];

  @override
  Widget build(BuildContext context) {
    //左侧抽屉导航头部
    const leftDrawerHeader = SizedBox(
      height: 100,
      width: 200,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text(
          'Demo List',
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    var listView = ListView.separated(
      shrinkWrap: true,
      itemCount: _demoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          minLeadingWidth: 10.0,
          leading: _demoList[index].icon,
          title: Text(_demoList[index].title),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, _demoList[index].routeName);
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(height: .0),
    );

    //左侧抽屉导航
    var leftDrawer = SizedBox(
      width: 200,
      child: Drawer(
        child: Column(
          children: [leftDrawerHeader, listView],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: leftDrawer,
      body: const Center(child: Text("Scaffold body")),
    );
  }
}
