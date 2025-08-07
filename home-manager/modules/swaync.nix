{
  settings = {
    positionX = "right";        # Notifications appear on right side
    positionY = "top";          # Notifications appear at top
    control-center-radius = 1;  # Border radius for notification center
    fit-to-screen = true;       # Scale to screen size
    layer-shell = true;         # Use Wayland layer shell
    layer = "overlay";          # Show above other windows
    control-center-layer = "overlay";
    cssPriority = "user";       # User CSS takes priority
    
    # Icon and image sizes
    notification-icon-size = 64;
    notification-body-image-height = 100;
    notification-body-image-width = 200;
    
    # Timeout settings (seconds)
    timeout = 10;         # Normal notifications disappear after 10s
    timeout-low = 5;      # Low priority after 5s
    timeout-critical = 0; # Critical notifications stay until dismissed
    
    # What widgets to show in notification center
    widgets = [
      "inhibitors"      # Do not disturb toggle
      "dnd"            # Do not disturb status
      "mpris"          # Media player controls
      "notifications"  # Actual notifications
    ];
    
    widget-config = {
      title = {
        text = "Notifications";
        clear-all-button = true;    # Show "Clear All" button
        button-text = "Clear All";
      };
      dnd = {
        text = "Do Not Disturb";
      };
      mpris = {
        image-size = 96;   # Album art size
        blur = true;       # Blur album art background
      };
    };
  };
}