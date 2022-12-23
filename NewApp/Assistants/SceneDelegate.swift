//
//  SceneDelegate.swift
//  NewApp
//
//  Created by Кристина Баскакова on 20.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let navController = UINavigationController(rootViewController: StockListViewController())
    navController.navigationBar.isHidden = true
    
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
  }
}

