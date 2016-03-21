# iosdebug
Debugging tools for iOS

## Ugly

Ugly is really simple but super useful. Whenever you can't seem to find out what is going on with views overlaying each other use this to debug it. It'll add random colors to every view that is on-screen at the time of the call. Use this when you can't figure out why a button or control isn't tappable. Call this function inside the view controller that you want to debug and wait for everything is on-screen to call it, *viewDidAppear(animated)* usually works great.

**Usage:**


```Swift
override func viewDidAppear(animated: Bool) {
  super.viewDidAppear(animated)
  ugly()
}
```

If you want to optionally make views that are hidden or views that are transparent visible you can alternatively pass in parameters to make all the views visible:

```Swift
ugly(makeVisible: true, makeOpaque: true)
```

**Installation:**

Just include Ugly.swift file
