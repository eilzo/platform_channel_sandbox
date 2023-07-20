## What's happening here? 

This repo is connected to FlutterFlow project https://enterprise.flutterflow.io/project/so-t-temp-dwdkfm. 

When pushes are made from FlutterFlow, they are pushed to this repo's `FlutterFlow` branch. 

To modify platform channel code, we do the following: 

```
git clone git@github.com:eilzo/platform_channel_sandbox.git
git checkout flutterflow
git branch platform-channels
```

On the new branch, we make appropriate changes to `MainActivity.kt` and `AppDelegate.swift` (see [commit](https://github.com/eilzo/platform_channel_sandbox/commit/fd754de378c9308eb53b58078c58450fa5e2d1f3)).

From there, we push the changes. Depending on your CI/CD pipeline, you'd likely merge the `platform-channels` branch into `staging` or `main` and deploy from there. 

