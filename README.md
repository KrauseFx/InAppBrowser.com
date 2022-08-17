<img src="/assets/tiktok_framed.png" width="300" align="right">

# [InAppBrowser.com](https://InAppBrowser.com)

## What is this project?

Please read [this article](https://krausefx.com/blog/announcing-inappbrowsercom-see-what-javascript-commands-get-executed-in-an-in-app-browser) first

## How does it work?

To my knowledge, there is no good way to monitor all JavaScript commands that get executed by the host iOS app ([would love to hear if there is a better way](https://twitter.com/KrauseFx)).

I created a new, plain HTML file, with some JS code to override some of the `document.` methods:

```javascript
document.getElementById = function(a, b) {
    appendCommand('document.getElementById("' + a + '")')
    return originalGetElementById.apply(this, arguments);
}
```

<h4><a href="/index.html">View the Source Code here</a></h4>

<h4><a href="https://krausefx.com/blog/announcing-inappbrowsercom-see-what-javascript-commands-get-executed-in-an-in-app-browser">Check out the full announcement</a></h4>

## How to use

Open [InAppBrowser.com](https://InAppBrowser.com) through the iOS/Android app of your choice. For a social media app post the link, or for messengers send the link to yourself, and try opening the page as part of their in-app web browser.

## `ad-container` folder

This folder contains an empty iOS app project, that renders the [`InAppBrowser.com`](InAppBrowser.com) website. 

```objective-c
[self.webView evaluateJavaScript:@"document.getElementById('usingNewMethod')"
                         inFrame:nil
                   inContentWorld:[WKContentWorld defaultClientWorld]
                completionHandler:^(id _Nullable something, NSError * _Nullable error) {
    NSLog(@"new: %@", something);
}];

[self.webView evaluateJavaScript:@"document.getElementById('usingOldMethod')"
                copletionHandler:^(id _Nullable something, NSError * _Nullable error) {
    NSLog(@"old: %@", something);
}];
```

<img src="/assets/using-old-method.png" width="300" align="right">

The above code uses the new and the old method of running JavaScript code on websites. For more deatils, check out [WKContentWorld](https://developer.apple.com/documentation/webkit/wkcontentworld).

When you open the InAppBrowser.com website through that app, you can see how only the "usingOldMethod" output is shown, while the "usingNewMethod" output doesn't show up.
