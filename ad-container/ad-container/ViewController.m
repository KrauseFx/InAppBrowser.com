//
//  ViewController.m
//  ad-container
//
//  Created by Felix Krause on 07.06.22.
//

#import "ViewController.h"
#import <WebKit/WKWebView.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://InAppBrowser.com"] cachePolicy:0 timeoutInterval:0]];
}
- (void)viewDidAppear:(BOOL)animated {
    [self.webView reload];
    [super viewDidAppear:animated];
}


@end
