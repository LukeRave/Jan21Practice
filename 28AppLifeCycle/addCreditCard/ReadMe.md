App Life Cycle States: Not running, background, foreground active, foreground inactive, suspended
States differs by if the app is receiving user events or can it execute code

App Life cycle transitions will post notifications:
 UIApplication.didFinishLaunchingNotification
 UIApplication.didBecomeActiveNotification
 UIApplication.willEnterForegroundNotification
 UIApplication.willResignActiveNotification
 UIApplication.didEnterBackgroundNotification
 UIApplication.willTerminateNotification
 UIApplication.userDidTakeScreenshotNotification
 
Assignment:
1. Create the screen in the given screenshot
2. Use notifications to hide info as the user go to the App Switcher
3. Use Timer and UIApplication.shared.beginBackgroundTask to get a similar sequence of print statements during transitions:

 "func handleAppWillBecomeActive() called"
 "app is in foreground 0"
 "app is in foreground 1"
 "app resign active"
 "app is in foreground 2"
 "func handleAppEnterBG() called"
 "app is in background 3"
 "app is in background 4"
 "app is in background 5"
 "func handleAppWillBecomeActive() called"
 "app is in foreground 6"
 "app is in foreground 7"
 "app resign active"
 "app is in foreground 8"
 "app is in foreground 9"
 
 */

Hello
