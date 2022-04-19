import 'package:flutter/material.dart';

///左侧导航列表项
class DrawListItem {
  ///列表标题
  late String title;

  ///跳转的路由名称
  late String routeName;

  ///图标
  late Widget icon;
  DrawListItem(this.title, this.routeName, this.icon);
}
