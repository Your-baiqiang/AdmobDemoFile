//
//  OpenAd.swift
//  Admob Exercises
//
//  Created by Yiu on 2024/8/23.
//

import SwiftUI
import GoogleMobileAds

class AppOpen: NSObject, GADFullScreenContentDelegate, ObservableObject {

  @Published var appOpenAdLoaded: Bool = false
  @Published var isShowAd: Bool = false

  var appOpenAd: GADAppOpenAd?

  override init() {
    super.init()
    loadAppOpenAd()
  }

  // 加载应用打开广告
  func loadAppOpenAd() {
    let request = GADRequest()
    GADAppOpenAd.load(
      withAdUnitID: "ca-app-pub-3940256099942544/5575463023",
      request: request,
      orientation: UIInterfaceOrientation.portrait
    ) { appOpenAdIn, _ in
      self.appOpenAd = appOpenAdIn
      self.appOpenAd?.fullScreenContentDelegate = self
      self.appOpenAdLoaded = true
      print("🍊: 準備完了しました")
    }
  }

  // 展示应用打开广告
  func presentAppOpenAd() {
    DispatchQueue.main.async {
      guard let root = self.appOpenAd else { return }
      if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        let rootViewController = windowScene.windows.first?.rootViewController
        root.present(fromRootViewController: rootViewController!)
      }
    }
  }

  // 广告未能展示的回调
  func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
    self.loadAppOpenAd()
    print("😭: エラー -> \(error)")
  }

  // 广告被关闭后的回调
  func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
    self.loadAppOpenAd()
    print("🍅: 閉じました")
  }
}
