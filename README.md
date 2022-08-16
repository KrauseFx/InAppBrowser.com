<img src="/assets/tiktok_framed.png" width="300" align="right">

# [InAppBrowser.com](https://InAppBrowser.com)

## What is this project?

Please read [this article](https://krausefx.com/blog/ios-privacy-instagram-and-facebook-can-track-anything-you-do-on-any-website-in-their-in-app-browser) first

<!-- TODO: insert new link here -->

## How does it work?

To my knowledge, there is no good way to monitor all JavaScript commands that get executed by the host iOS app ([would love to hear if there is a better way](https://twitter.com/KrauseFx)).

I created a new, plain HTML file, with some JS code to override some of the `document.` methods:

```javascript
document.getElementById = function(a, b) {
    appendCommand('document.getElementById("' + a + '")')
    return originalGetElementById.apply(this, arguments);
}
```

<h3><a href="https://krausefx.com/">Check out the full announcement</a></h3>
<!-- TODO: update link -->

## How to use

Open [InAppBrowser.com](https://InAppBrowser.com) through the iOS/Android app of your choice. For a social media app post the link, or for messengers send the link to yourself, and try opening the page as part of their in-app web browser.

## ad-container folder

This folder contains an empty iOS app project, that renders the [`InAppBrowser.com`](InAppBrowser.com) website without any modification. This was used to proof that the standard Apple `WKWebView` doesn't do any queries without consent.
