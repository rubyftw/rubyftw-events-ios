class FTWEventsViewController < UITableViewController

  attr_accessor :events

  def viewDidLoad
    # ALWAYS CALL SUPER!
    super

    # initialize an empty events array
    self.events = []

    # set the navigation bar title
    self.title = 'Events'

    # fetch the events from the api
    fetchEvents

  end

  def fetchEvents
    # fetch events using the bubble-wrap gem
    BW::HTTP.get('http://rubyftw.org/events/index.json') do |response|
      # parse the JSON using the bubble-wrap gem
      results = BW::JSON.parse(response.body.to_s)
      parseResults(results)
    end
  end

  def parseResults(results)
    @parsedEvents = []

    results.each do |result|
      event = FTWEvent.new(result)
      @parsedEvents << event
    end

    self.events = @parsedEvents

    self.tableView.reloadData
  end

  # UITableView methods

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection: section)
    self.events.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= 'CELL_IDENTIFIER'

    # grab a reusable cell if it exists, or create a new one
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
    end

    # Configure the cell
    @event = self.events[indexPath.row]
    cell.textLabel.text = @event.title
    cell.detailTextLabel.text = @event.long_date
    cell.accessoryType = UITableViewCell::UITableViewCellAccessoryDisclosureIndicator

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)

    # Instantiate a new detail view controller
    @detailViewController = FTWEventDetailViewController.alloc.init

    # Set the event, based on the row of the cell selected
    @detailViewController.event = self.events[indexPath.row]

    # Push the detail view on to the navigation stack
    self.navigationController.pushViewController(@detailViewController, animated: true)

    # Deselect that row (otherwise it would still be highlighted when you pop back)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  end

end