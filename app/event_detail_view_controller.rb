class FTWEventDetailViewController < UIViewController
  attr_accessor :event

  def viewDidLoad
    # Don't forget SUPER!
    super

    # Create a new webView and set it as this view controller's view
    # note: CGRectZero is a frame of [[0,0],[0,0]]
    @webView = UIWebView.alloc.initWithFrame(CGRectZero)
    self.view = @webView

    # Set the view controller title as the event's title
    self.title = self.event.title

    # Load the event's map url in the webView
    # note: google maps will ask for your current location
    @url = NSURL.URLWithString(self.event.location_url)
    @request = NSURLRequest.requestWithURL(@url)
    @webView.loadRequest(@request)
  end
end