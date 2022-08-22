//
//  SceneDelegate.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        /*
        guard let scene = (scene as? UIWindowScene) else { return }  // 디폴트
        window = UIWindow(windowScene: scene)
        
        UserDefaults.standard.set(false, forKey: "First")  // >> 다른 화면에 배치해야 함
        
        // true면 WelclomeViewController, false면 SearchMovieTableViewController
        if UserDefaults.standard.bool(forKey: "First") {
            // 가장 첫번째에 뜰 화면
            let sb = UIStoryboard(name: "Trending", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "WelclomeViewController") as! WelclomeViewController  // guard-let이나 if-let으로 감싸주는 것이 안전하다
            
//            window?.rootViewController = vc
            window?.rootViewController = UINavigationController(rootViewController: vc)  // 네비게이션 컨트롤러 붙이기 가능
        } else {
            // 가장 첫번째에 뜰 화면
            let sb = UIStoryboard(name: "Shopping-Lecture", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SearchMovieTableViewController") as! SearchMovieTableViewController  // guard-let이나 if-let으로 감싸주는 것이 안전하다
            
//            window?.rootViewController = vc
            window?.rootViewController = UINavigationController(rootViewController: vc)
        }
            
        
        window?.makeKeyAndVisible()  // 윈도우가 디바이스에 보여지도록 한다
        */
        
        guard let _ = (scene as? UIWindowScene) else { return }  // 디폴트
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

