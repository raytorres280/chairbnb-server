# fithub-2.0

Login: logins are saved via core data and retrieved any time you reopen the app. Might try Realm with next project cause core data is a pain.

Dashboard: this is your dashboard at a glance for the day. water intake, macro breakdown of meals, and calories burned (in progress)

Meals: retrieves from static list of meals, not very healthy :), waiting for MyfitnessPal API access, maybe some day.

Logs: Logs are just previous days' dashboards stored so you can track your progress and compare your old entries day by day.
Might make this a tab based screen, the other tab being analytics for your history so you get straightforward information.

Run: Not complete, need to work with MKMapKit some more in order to play with tracing and polygon lines on mapkit. I want this to trace your run, and time it. Plug it into some algorithm on google to guesstimate your calories burned.


All in all I am pleased with my first Swift building experience. It is a happy medium between a static language like java and JS where functions and async stuff is treated like a first class citizen.
I pray Apple open sources Cocoa if it's in danger of dying to things like Flutter and React Native as I really think their SDK is a joy to work with.

Originally, I wanted to incorporate Vapor for the server but I was completely new to Swift at the time and thought working with the client side of things and Apple's SDK might be a bit easier. Codegen tools on Vapor are a breeze to work with though, and may try for next project. Too addicted to GraphQL at the moment to get off though so I switched to a Node based Prisma server and will remove the vapor server code at a later time.

As a NERD stack developer, I definitely appreciate the speed and simplicity that coding in 1 language gives you.

Great tools, this was my first project and have nothing but positive things to say about Cococa and Xcode.

'Reactive' library for Swift and no storyboard on next project!
