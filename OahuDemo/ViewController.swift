//
//  ViewController.swift
//  OahuDemo
//
//  Created by Miguel Bassila on 12/10/15.
//  Copyright © 2015 Miguel Bassila. All rights reserved.
//

import UIKit
import oahu
import WebKit

class ViewController: UIViewController {

  var browser: Oahu?


  override func viewDidLoad() {
    super.viewDidLoad()

    var evalutors = [Evaluator]()

    let evaluator = OahuEvaluator(closure: { () -> Void in
      print("show")
      }, url: "tech")
    

    evalutors.append(evaluator)

    let interceptor = Interceptor(evaluators: evalutors)

    browser = Oahu(forView: view, allowsBackForwardNavigationGestures: true, interceptor: interceptor)
    browser?.loadRequest("http://www.globo.com")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
