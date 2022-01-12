//
//  AppDelegate.swift
//  MVP_PassiveView_QiitaAPI
//
//  Created by yasudamasato on 2022/01/08.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    Router.shared.showRoot(window: UIWindow(frame: UIScreen.main.bounds))
    return true
  }
}
