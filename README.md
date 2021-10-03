# ios-LLoydBank-test

## App Description

The app navigates through 4 screens (named Home, People, Rooms) that do the following:

1. Home: Loads the home page
2. People: Downloads a JSON payload for people and load it on the tableview
3. Room: Downloads a JSON payload for room and displays it on the tableview

## Repository Design pattern
Repository pattern is a software design pattern that provides an abstraction of data, so that your application can work with a simple abstraction that has an interface. Using this pattern can help achieve loose coupling and can keep domain objects persistence ignorant.

* https://medium.com/tiendeo-tech/ios-repository-pattern-in-swift-85a8c62bf436


## MVVM-C 

MVVM-C is a combination of MVVM with the Coordinator Pattern

Some resources on coordinators:

* https://benoitpasquier.com/coordinator-pattern-swift/
* https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps
* https://talk.objc.io/episodes/S01E5-connecting-view-controllers

## Usage

SwinjectStoryboard is an extension of Swinject to automatically inject dependency to view controllers instantiated by a storyboard.
Swinject supports automatic dependency injection to view controllers instantiated by SwinjectStoryboard. This class inherits UIStoryboard (or NSStoryboard in case of OS X). To register dependencies of a view controller, use storyboardInitCompleted method. In the same way as a registration of a service type, a view controller can be registered with or without a name. NOTE: Do NOT explicitly resolve the view controllers registered by storyboardInitCompleted method. The view controllers are intended to be resolved by SwinjectStoryboard implicitly.
