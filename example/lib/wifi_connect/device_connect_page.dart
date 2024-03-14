import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'device_connect_logic.dart';

class DeviceConnectPage extends GetView<DeviceConnectLogic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('QR code connection'),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ObxValue<RxBool>((data) {
          return data.value
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      QrImageView(
                        data: controller.state!.qrContent,
                        size: 300.0,
                      ),
                      SizedBox(height: 20),
                      Text(
                          "Please scan the QR code. After the device query is successful, it will automatically jump to the next step.",
                          style: TextStyle(color: Colors.red)),
                      SizedBox(height: 20),
                      ObxValue<RxInt>((data) {
                        return Text(
                            "Device query is in progress,${data.value} Second-rate",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500));
                      }, controller.state!.times)
                    ],
                  ),
                )
              : ObxValue<Rx<String>>((data) {
                  return data.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 50),
                              Text("Wifi name:${data.value}"),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Wifi password:"),
                                  SizedBox(
                                    width: 250,
                                    height: 38,
                                    child: TextField(
                                      controller: controller.textController,
                                      decoration: InputDecoration(
                                        labelText: 'Please enter password',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              TextButton(
                                  onPressed: () {
                                    controller.generateQrCode();
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color: Colors.blue),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Generate QR code",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      : Container(
                          height: 200,
                          alignment: Alignment.center,
                          child: Text(
                              "No wifi detected, please make sure your phone is connected to WI-FI \n (the app needs to enable location permission)"));
                }, controller.state!.wifiName);
        }, controller.state!.isShowQR),
      ),
    );
  }
}
