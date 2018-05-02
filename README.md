# fithub-2.0
playing around with vapor web fw for swift. 

#App currently does the basic functionality. 

Login: logins are saved via core data and retrieved any time you reopen the app. Might try Realm with next project cause core data is a pain.

Dashboard: this is your dashboard at a glance for the day. water intake, macro breakdown of meals, and calories burned (in progress)

Meals: retrieves from static list of meals, not very healthy :), waiting for MyfitnessPal API access, maybe some day.

Logs: Logs are just previous days' dashboards stored so you can track your progress and compare your old entries day by day.
Might make this a tab based screen, the other tab being analytics for your history so you get straightforward information.

Run: Not complete, need to work with MKMapKit some more in order to play with tracing and polygon lines on mapkit. I want this to trace your run, and time it. Plug it into some algorithm on google to guesstimate your calories burned.


All in all I am pleased with my first Swift building experience. It is a happy medium between a static language like java and JS where functions and async stuff is treated like a first class citizen.
I pray Apple open sources Cocoa if it's in danger of dying to things like Flutter and React Native as I really think their SDK is a joy to work with.

Great tools, first project with 'Reactive' library for Swift and no storyboard on next project!
