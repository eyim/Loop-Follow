# Loop-Follow
The Loop-Follow application is a simple iOS app written in Swift that accepts notifications from Loop and are powered by Azure. The setup for the Loop-Follow application iOS portion is a little more involved than setting up the Loop application.

For more background read this [blog post](https://blogs.msdn.microsoft.com/alimaz/2016/09/22/azure-logic-apps-azure-sql-and-loop-better-together-part-ii/)

![](https://msdnshared.blob.core.windows.net/media/2016/09/20160922_152515000_iOS-169x300.png)
![](https://msdnshared.blob.core.windows.net/media/2016/09/20160921_044556000_iOS-169x300.png)

Its more challenging to setup Loop-Follow due to the nature of using Push notifications and requiring some special provisioning on both the iOS side and the Azure configuration so they talk to each other.

In this wiki we will setup the Loop-Follow iOS portion and configure our Azure notification hub to send a test message.

Prior to setting up the Loop-Follow Application we need to create a provisioning profile that we will use in XCode to compile/deploy the Loop-Follow application.

For future releases we are planning to use a shared Push notification service hosted on NightScout Foundation Azure subscription to simplify the process and make it available to Loop users not using Azure and also a free service comparing to Push Over with more flexibility!

For instructions go to [wiki](https://github.com/amazaheri/Loop-Follow/wiki)
