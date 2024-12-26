import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:warikan/ads/ad_manager.dart';

/// バナー広告用の管理用クラス
class AdBanner {
  // バナー広告を作成
  static BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.fullBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => debugPrint('バナー広告がロードされました'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          debugPrint('バナー広告の読み込みが次の理由で失敗しました: $error');
        },
        onAdOpened: (Ad ad) => debugPrint('バナー広告が開かれました'),
        onAdClosed: (Ad ad) => debugPrint('バナー広告が閉じられました'),
        onAdImpression: (Ad ad) => debugPrint('次のバナー広告が表示されました: $ad'),
      ),
    );
  }
}
