import 'dart:io';

class AdManager {
  // アプリIDを返す関数
  static String get appId {
    if (Platform.isAndroid) {
      return "AndroidのアプリID";
    } else if (Platform.isIOS) {
      return "ca-app-pub-7585032538907137~8911487231";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  // バナー広告ユニットIDを返す関数
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/9214589741"; // テストID
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2435281174"; // テストID
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  // インターステシャル広告ユニットIDを返す関数
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712"; // テストID
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910"; // テストID
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}