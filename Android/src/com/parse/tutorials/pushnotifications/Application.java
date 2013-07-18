package com.parse.tutorials.pushnotifications;

import com.parse.Parse;
import com.parse.ParseInstallation;
import com.parse.PushService;

public class Application extends android.app.Application {

  public Application() {
  }

  @Override
  public void onCreate() {
    super.onCreate();

	// Initialize the Parse SDK.
	Parse.initialize(this, "YOUR_APP_ID", "YOUR_CLIENT_KEY"); 

	// Specify a Activity to handle all pushes by default.
	PushService.setDefaultPushCallback(this, MainActivity.class);
	
	// Save the current installation.
	ParseInstallation.getCurrentInstallation().saveInBackground();
  }
}