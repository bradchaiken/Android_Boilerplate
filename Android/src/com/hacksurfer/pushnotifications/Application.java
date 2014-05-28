package com.hacksurfer.pushnotifications;

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
	Parse.initialize(this, "ThvxqnxUSt10RkWeh4raYq5BMUStIpaFvrIdtoGC", "eVYQGX4hBKCBW9nWIhIKzLbMGF4GW0eYFfIkPH35"); 

	// Specify an Activity to handle all pushes by default.
	PushService.setDefaultPushCallback(this, MainActivity.class);
  }
}