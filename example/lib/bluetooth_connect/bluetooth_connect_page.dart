import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bluetooth_connect_logic.dart';

class BlueToothConnectPage extends GetView<BlueToothConnectLogic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BlueTooth connect'),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ObxValue<RxBool>((data) {
          return data.value
              ? Center(
                  child: Text("(请先打开位置权限)正在搜索，请稍等。。。"),
                )
              : controller.state!.blueDevices.length == 0
                  ? Center(child: Text("未搜索到结果，请确保手机开启蓝牙，且监控设备已重启"))
                  : Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          Text(
                              "设备名称： ${controller.state!.blueDevices[0].device.name}"),
                          //demo只取搜索到的第一个设备
                          SizedBox(height: 20),
                          ObxValue<RxString>((data) {
                            return data.value.length == 0
                                ? Container(
                                    child: Text(
                                        "未找到wifi, 请确保手机已连接wifi. \n (app需打开位置权限)"))
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Wifi名称：${data.value}"),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Wifi密码："),
                                          SizedBox(
                                            width: 250,
                                            height: 38,
                                            child: TextField(
                                              controller:
                                                  controller.textController,
                                              decoration: InputDecoration(
                                                labelText: '请输入密码',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                      InkWell(
                                          onTap: () {
                                            controller.clickToConnect();
                                            // controller.getBlueWifiList();
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                48,
                                            height: 48,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                color: Colors.blue),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "点击连接",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  );
                          }, controller.state!.wifiName)
                        ],
                      ),
                    );
        }, controller.state!.isBlueSearching),
      ),
    );
  }
}
