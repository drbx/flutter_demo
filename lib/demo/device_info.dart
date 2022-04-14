import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_information/device_information.dart';
import 'package:permission_handler/permission_handler.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({Key? key}) : super(key: key);

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  String model = "";
  String brand = "";
  String androidId = "";
  String imei = "";

  @override
  void initState() {
    setDeviceInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Info Demo"),
      ),
      body: Center(
        child: ListView(children: [
          infoItem("model：" + model),
          infoItem("brand：" + brand),
          infoItem("androidId：" + androidId),
          infoItem("imei：" + imei),
        ]),
      ),
    );
  }

  ListTile infoItem(String text) {
    return ListTile(
      title: Text(text),
    );
  }

  Future<void> setDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    //当前权限
    Permission permission = Permission.phone;
    //权限的状态
    PermissionStatus status = await permission.status;
    if (status != PermissionStatus.granted) {
      permission.request();
      status = await permission.status;
    }
    String imeiNo = "";
    if (status == PermissionStatus.granted) {
      imeiNo = await DeviceInformation.deviceIMEINumber;
    }

    setState(() {
      model = androidInfo.model.toString();
      brand = androidInfo.brand.toString();
      androidId = androidInfo.androidId.toString();
      imei = imeiNo;
    });
  }
}
