//
//  SceneDelegate.swift
//  Mobile2You
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = MovieTableViewController(movieTableViewModel: MovieTableViewModel(movie: 105))
        self.window = window
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
    
}

