//
//  ViewController.m
//  ad-container
//
//  Created by Felix Krause on 07.06.22.
//

#import "ViewController.h"
#import <WebKit/WKWebView.h>
#import <WebKit/WKContentWorld.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://InAppBrowser.com"] cachePolicy:0 timeoutInterval:0]];
    
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 3);
    dispatch_after(delay, dispatch_get_main_queue(), ^(void){
        
        
        [self.webView evaluateJavaScript:@"document.getElementById('usingNewMethod')"
                                 inFrame:nil
                          inContentWorld:[WKContentWorld defaultClientWorld]
                       completionHandler:^(id _Nullable something, NSError * _Nullable error) {
            NSLog(@"new: %@", something);
        }];
        
        [self.webView evaluateJavaScript:@"document.getElementById('usingOldMethod')"
                       completionHandler:^(id _Nullable something, NSError * _Nullable error) {
            NSLog(@"old: %@", something);
        }];
    });
}
- (void)viewDidAppear:(BOOL)animated {
    [self.webView reload];
    [super viewDidAppear:animated];
}


@end
