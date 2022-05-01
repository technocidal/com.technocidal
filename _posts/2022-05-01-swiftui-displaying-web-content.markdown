---
layout: post+image
title: SwiftUI - Displaying Web Content
tags: tutorial swift swiftui software
path_to_image: /assets/macbook+coding.jpg 
---
SwiftUI has been in released almost 3 years ago but it still has some pretty obvious holes in its capabilities. I'm partial to the issue that you can't change the background color of list items in a list-style `Picker` or any layout specifics of that component to be honest. Admittedly this is a minor annoyance when you realise that there is no SwiftUI equivalent for `WKWebView`. Luckily the implementation of a simple UIKit wrapper is straight forward.

## Implementation

To get things started open a new file and import `WebKit`. We need this to have access to `WKWebView` which is Apples replacement for `UIWebView`.

```swift
import WebKit
```

Create a new struct called `WebView` which should conform to `UIViewRepresentable`.

```swift
import WebKit

struct WebView: UIViewRepresentable {
...
}
```

*Keeping with Apples naming conventions for SwiftUI it should just be called `Web` but that seemed a bit odd to me. It also confused me when I realised that Apple did **exactly** that when they called the SwiftUI equivalent for `MKMapView` just `Map`.*

Add a property called `url`. You can define this with `String` or `URL` as its type depending on where you want to implement the error handling in case the supplied URL is invalid.
```swift
import WebKit

struct WebView: UIViewRepresentable {
  
  let url: String
}
```

Now you're ready to implement the two methods required by the `UIViewRepresentable` protocol. Let's start with `makeUIView(context:)`.
```swift
import WebKit

struct WebView: UIViewRepresentable {
  
  ...
  
  func makeUIView(context: Context) -> WKWebView {
      WKWebView()
  }
}
```
Pretty straight forward, right? Now we just need to load the supplied URL and we're done. Continue by implementing the second required function like so. 
```swift
import WebKit

struct WebView: UIViewRepresentable {
  
  ...
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
      guard let url = URL(string: url) else {
          return
      }
      let request = URLRequest(url: url)
      uiView.load(request)
  }
}
```
This function tries to create a URL using the provided string. If it succeeds the newly created URL is passed to a `URLRequest` which is subsequently handed to the `load(_:)` function of our `WKWebView` instance.

That's all there is to it. Be aware that `WKWebView` is not equivalent to `SFSafariViewController` which basically embeds Safari into your application giving users access to Password Autofill for example.

## Conclusion

Wrapping `WKWebView` like this gives you a quick and easy way to show web content inside your application.

If you found this helpful, feel free to let me know. You can send me an E-Mail to [{{ site.email }}](mailto:{{ site.email }}) or find me on Twitter [@technocidal](https://twitter.com/technocidal).
