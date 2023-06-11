//
//  ViewController.swift
//  flutter_to_ios
//
//  Created by Ngoc Bao on 05/06/2023.
//

import UIKit
import Flutter

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    var stack = UIStackView()
      
      stack.axis = .vertical
      stack.distribution = .equalSpacing
      stack.spacing = 20
      stack.distribution = .fill
      self.view.addSubview(stack)
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
      stack.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 100).isActive = true
      stack.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
      
      let button1 = UIButton(type:UIButton.ButtonType.custom)
      button1.addTarget(self, action: #selector(showFlutterMain), for: .touchUpInside)
      button1.setTitle("main screen", for: UIControl.State.normal)
      button1.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
      button1.backgroundColor = UIColor.red
      
      let button2 = UIButton(type:UIButton.ButtonType.custom)
      button2.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
      button2.setTitle("top main", for: UIControl.State.normal)
      button2.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
      button2.backgroundColor = UIColor.red
      
    // Make a button to call the showFlutter function when pressed.
    let button = UIButton(type:UIButton.ButtonType.custom)
    button.addTarget(self, action: #selector(showFirstViewcontroller), for: .touchUpInside)
    button.setTitle("bottom main", for: UIControl.State.normal)
    button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
    button.backgroundColor = UIColor.blue
      stack.addArrangedSubview(button1)
      stack.addArrangedSubview(button2)
      
      stack.addArrangedSubview(button)
      

      
  }
    @objc func showFlutterMain() {
        let vc = SingleFlutterViewController(withEntrypoint: nil)
        present(vc, animated: true, completion: nil)
    }

  @objc func showFlutter() {
      let vc = SingleFlutterViewController(withEntrypoint: "topMain")
      present(vc, animated: true, completion: nil)
  }
    
    @objc func showFirstViewcontroller() {
        let vc = SingleFlutterViewController(withEntrypoint: "bottomMain")
        present(vc, animated: true, completion: nil)
    }
}


