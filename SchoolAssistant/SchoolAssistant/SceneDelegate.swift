//
//  SceneDelegate.swift
//  SchoolAssistant
//
//  Created by Александра on 20.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
                window = UIWindow(windowScene: windowScene)
                window?.windowScene = windowScene
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let registrationVC = storyboard.instantiateViewController(withIdentifier: String(describing: RegistrationViewController.self)) as? RegistrationViewController else { return }
        
                window?.rootViewController = registrationVC
                window?.makeKeyAndVisible()
        
        
    }

}

