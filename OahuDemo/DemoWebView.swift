//
//  DemoWebView.swift
//  OahuDemo
//
//  Created by Miguel Bassila on 12/14/15.
//  Copyright © 2015 Miguel Bassila. All rights reserved.
//

import Foundation
import WebKit

class DemoWebView: NSObject {
  var webView: WKWebView?

  init(frame: CGRect) {
    webView = WKWebView(frame: frame)
  }

  func loadRequest() {
    let request = NSURLRequest(URL: NSURL(string: "http://www.globo.com")!)
    webView?.navigationDelegate = self
    webView?.loadRequest(request)
  }
}

extension DemoWebView: WKNavigationDelegate {
  func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
    print("cai aqui")
  }
}