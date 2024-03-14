import 'package:vsdk_example/ai_detection/ai_detect_setting/area_draw/area_draw_conf.dart';
import 'package:vsdk_example/play/play_conf.dart';
import 'package:vsdk_example/settings_alarm/custom_detect_time/custom_detect_time_conf.dart';
import 'package:vsdk_example/settings_alarm/detect_area_draw/detect_area_draw_conf.dart';
import 'package:vsdk_example/settings_alarm/settings_conf.dart';
import 'package:vsdk_example/settings_normal/settings_normal_conf.dart';
import 'package:vsdk_example/tf_play/tf_play_conf.dart';
import 'package:vsdk_example/tf_settings/tf_settings_conf.dart';
import 'package:vsdk_example/wifi_connect/device_connect_conf.dart';
import 'ai_detection/ai_detection_conf.dart';
import 'ai_detection/ai_detect_setting/ai_detect_setting_conf.dart';
import 'bluetooth_connect/bluetooth_connect_conf.dart';
import 'cloudplay/cloud_play_conf.dart';
import 'device_bind/device_bind_conf.dart';
import 'home/home_conf.dart';
import 'linkable_revise/linkable_revise_conf.dart';
import 'main/main_conf.dart';

class AppRoutes {
  static const settings = '/settings';
  static const main = '/main';
  static const play = '/play';
  static const cloudplay = '/cloudplay';
  static const tfPlay = '/tf_play';
  static const tfSettings = '/tf_settings';
  static const normalSetting = '/normal_setting';
  static const areaDraw = '/area_draw';
  static const linkable = '/linkable';
  static const customDetectTime = '/custom_detect_time';
  static const deviceConnect = '/device_connect';
  static const bluetoothConnect = '/bluetooth_connect';
  static const deviceBind = '/device_bind';
  static const aiDetection = '/ai_detection';
  static const aiDetectSetting = '/ai_detect_setting';
  static const aiAreaDraw = '/ai_area_draw';
  static const home = '/home';
}

class AppPages {
  static void disposePages() {
    HomeConf.dispose();
    MainConf.dispose();
    PlayConf.dispose();
    SettingsConf.dispose();
    CloudPlayConf.dispose();
    TFPlayConf.dispose();
    SettingsNormalConf.dispose();
    DetectAreaDrawConf.dispose();
    LinkableReviseConf.dispose();
    CustomDetectTimeConf.dispose();
    TFSettingsConf.dispose();
    DeviceConnectConf.dispose();
    BlueToothConnectConf.dispose();
    DeviceBindConf.dispose();
    AIDetectionConf.dispose();
    AIDetectSettingConf.dispose();
    AIAreaDrawConf.dispose();
  }

  static final pages = [
    HomeConf.getPage,
    MainConf.getPage,
    PlayConf.getPage,
    SettingsConf.getPage,
    CloudPlayConf.getPage,
    TFPlayConf.getPage,
    SettingsNormalConf.getPage,
    DetectAreaDrawConf.getPage,
    LinkableReviseConf.getPage,
    CustomDetectTimeConf.getPage,
    TFSettingsConf.getPage,
    DeviceConnectConf.getPage,
    BlueToothConnectConf.getPage,
    DeviceBindConf.getPage,
    AIDetectionConf.getPage,
    AIDetectSettingConf.getPage,
    AIAreaDrawConf.getPage,
  ];
}
