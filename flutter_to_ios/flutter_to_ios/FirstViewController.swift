//
//  FirstViewController.swift
//  flutter_to_ios
//
//  Created by Ngoc Bao on 11/06/2023.
//

import Flutter
import FlutterPluginRegistrant
import Foundation

/// A FlutterViewController intended for the MyApp widget in the Flutter module.
///
/// This view controller maintains a connection to the Flutter instance and syncs it with the
/// datamodel.  In practice you should override the other init methods or switch to composition
/// instead of inheritence.
class SingleFlutterViewController: FlutterViewController {
  private var channel: FlutterMethodChannel?

  init(withEntrypoint entryPoint: String?) {
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let newEngine = appDelegate.engines.makeEngine(withEntrypoint: entryPoint, libraryURI: nil)
    GeneratedPluginRegistrant.register(with: newEngine)
    super.init(engine: newEngine, nibName: nil, bundle: nil)
  }

  deinit {
    print("Frist viewcontroller deinit")
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    channel = FlutterMethodChannel(
      name: "multiple-flutters", binaryMessenger: self.engine!.binaryMessenger)
    channel!.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        print(call.method)
    }
  }
}
