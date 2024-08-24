//
//  AdmobView.swift
//  Admob Exercises
//
//  Created by Yiu on 2024/8/23.
//

import SwiftUI
import GoogleMobileAds

struct AdmobView: View {
  @StateObject var interstitial = Interstitial()
  var body: some View {
    VStack{
      BannerView()
        .frame(height: 60)
      
      NativeView()
        .frame(height: 160)
      
      Button(action: {
        interstitial.presentInterstitial()
      }) {
        Text(interstitial.interstitialAdLoaded ? "インタースティシャル広告表示" : "読み込み中...")
      }
      .onAppear() {
        interstitial.loadInterstitial()
      }
      .disabled(!interstitial.interstitialAdLoaded)
      
    }
  }
}

struct AdmobView_Previews: PreviewProvider {
  static var previews: some View {
    AdmobView()
  }
}



