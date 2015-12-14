//
//  ViewController.swift
//  OahuDemo
//
//  Created by Miguel Bassila on 12/10/15.
//  Copyright © 2015 Miguel Bassila. All rights reserved.
//

import UIKit
import oahu

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let browser = Oahu(forView: view, allowsBackForwardNavigationGestures: true)
    browser.loadRequest("http://www.globo.com")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

