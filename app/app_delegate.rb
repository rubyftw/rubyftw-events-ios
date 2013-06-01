class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    # Create a window for our app
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    # Create a new events view controller
    @eventsViewController = FTWEventsViewController.alloc.init

    # Create a navigation controller with our events view controller as the root view controller, so we can
    # have back buttons, animated segues and other free navigation functionality
    @navigationController = UINavigationController.alloc.initWithRootViewController(@eventsViewController)

    # Assign the window's root view controller as our navigation controller
    @window.rootViewController = @navigationController

    # Make this window the app's key window
    @window.makeKeyAndVisible
    true
  end
end
