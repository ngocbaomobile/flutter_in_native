//
//  AppDelegate.swift
//  flutter_to_ios
//
//  Created by Ngoc Bao on 05/06/2023.
//

import UIKit
import Flutter
// The following library connects plugins with iOS platform code to this app.
import FlutterPluginRegistrant

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let engines = FlutterEngineGroup(name: "multiple-flutters", project: nil)
    
//    lazy var flutterEngine = FlutterEngine(name: "my_app_engine")
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        flutterEngine.run();
//            GeneratedPluginRegistrant.register(with: self.flutterEngine);
//        let batteryChannel = FlutterMethodChannel(name: "flutter_call_native",
//                                                  binaryMessenger: flutterEngine.binaryMessenger)
//        batteryChannel.setMethodCallHandler({
//          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
//            guard call.method == "getBatteryLevel" else {
//                result(FlutterMethodNotImplemented)
//                return
//              }
//            self.receiveBatteryLevel(result: result)
//        })

        return true
    }
//    private func receiveBatteryLevel(result: FlutterResult) {
//        result(Int(1111))
//    }
    


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

