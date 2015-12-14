//
//  ViewController.m
//  OahuDemo
//
//  Created by Miguel Bassila on 12/11/15.
//  Copyright © 2015 Miguel Bassila. All rights reserved.
//

#import "ViewController.h"
#import "Oahu-Swift.h"

@import WebKit;

@interface ViewController () <WKNavigationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
//  WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame];
//  [self.view addSubview:webView];
//  webView.navigationDelegate = self;
//
//  [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.uol.com.br"]]];
//

  Oahu *oahu = [[Oahu alloc] initForView:self.view allowsBackForwardNavigationGestures:YES];
  oahu.navigationDelegate = self;
  [oahu loadRequest:@"http://www.globo.com"];
}

-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
  NSLog(@"Ola");
}

@end
