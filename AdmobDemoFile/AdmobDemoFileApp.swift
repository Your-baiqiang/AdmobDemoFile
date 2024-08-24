//
//  AdmobDemoFileApp.swift
//  AdmobDemoFile
//
//  Created by Yiu on 2024/8/24.
//

import SwiftUI
import GoogleMobileAds

@main
struct AdmobDemoFileApp: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  @StateObject var appOpen = AppOpen()
  
    var body: some Scene {
        WindowGroup {
          if !appOpen.appOpenAdLoaded {
            ProgressView()
          } else {
            ContentView()
          }
        }
        .onChange(of: appOpen.appOpenAdLoaded) { newValue in
          appOpen.presentAppOpenAd()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    GADMobileAds.sharedInstance().start(completionHandler: nil)
    return true
  }
  
}
