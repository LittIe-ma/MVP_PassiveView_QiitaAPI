//
//  Router.swift
//  MVP_PassiveView_QiitaAPI
//
//  Created by yasudamasato on 2022/01/12.
//

import UIKit

final class Router {
  static let shared = Router()
  private init() {}

  private var window: UIWindow?

  func showRoot(window: UIWindow) {
    let vc = QiitaArticlesViewController.init()
    let presenter = QiitaPresenter(output: vc)
    vc.inject(presenter: presenter)

    let nav = UINavigationController(rootViewController: vc)
    window.rootViewController = nav
    window.makeKeyAndVisible()
    self.window = window
  }
}
