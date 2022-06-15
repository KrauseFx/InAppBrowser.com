# [hijacking.report](https://hijacking.report)

## What is this project?

Please read [this article](https://krausefx.com/blog/hijacking-report) first

## How does it work?

To my knowledge, there is no good way to monitor all JavaScript commands that get executed by the host iOS app ([would love to hear if there is a better way](https://twitter.com/KrauseFx)).

I created a new, plain HTML file, with some JS code to override some of the `document.` methods:

```javascript
document.getElementById = function(a, b) {
    appendCommand('document.getElementById("' + a + '")')
    return originalGetElementById.apply(this, arguments);
}
```

<h3><a href="https://krausefx.com/blog/hijacking-report">Check out the full hijacking.report announcement</a></h3>

## How to use

Open [hijacking.report](https://hijacking.report) through the iOS/Android app of your choice. For a social media app post the link, or for messengers send the link to yourself, and try opening the page as part of their in-app web browser.

## ad-container folder

This folder contains an empty iOS app project, that renders the [`hijacking.report`](hijacking.report) website without any modification. This was used to proof that the standard Apple WKWebView doesn't do any queries without consent.
