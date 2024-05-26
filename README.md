# Bullseye
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/JustinInCoding/BullseyeSwiftUI/blob/master/README.md)
[![zh-cn](https://img.shields.io/badge/lang-zh--cn-blue.svg)](https://github.com/JustinInCoding/BullseyeSwiftUI/blob/master/README.zh-cn.md)

> This project is for me to learn from kodeco's iOS courses. Here I try to grasp the knowledge of SwiftUI by recording the steps of building an SwiftUI app.


## Technologies Used
- Use SwiftUI and Swift to build the App
- Use Stack, Text, Slider and Button to make the UI
- Use modifiers to style the text
- Use @State(and $ binding) to track the alert view(display some info)'s presenting state
- Use @State variable to binding the slider to make sure the value fo the slider will be sync when user is playing with it
- use string interpolation to display the slider value in alert
- make the game logic depart from the contentView for according to Single Responsibility Principle
- use random (find in swift standard library) to generate the target value


## Features
List the ready features here:
- Must Haves
    - Add an instructions label
    - Add a target label
    - Add a slider and make it go between the values 1 and 100
    - Add a “Hit Me” button
    - Style the text like Luke’s design
    - Show a popup when the user taps the Hit Me button
    - Read the value of the slider after the user taps the Hit Me button.
    - Generate a random number for the target value.
    - Calculate and display the store.
- Nice to Haves
    - Implement multiple rounds
    - Implement restarting the game
    - Add the leaderboard screen
    - Make the app look pretty :]


## Screenshots/Design
- [High-Fidelity Design for Bull’s Eye (made with Figma)](https://www.figma.com/file/3MBMeYd2hP4rajTbHnZL0z/Bullseye?node-id=0%3A1)
- [HIG-Foundations-Typography-Specifications](https://developer.apple.com/design/human-interface-guidelines/typography#Specifications)
<!-- ![Example screenshot](./img/screenshot.png) -->


## Setup
Xcode - 15.4 (the version I created the project)

## Tips and Learned
- Control + i: format indentation of the code
- Control + Command + Space: show Emoji editor
- Option + Command + P: show/hide Preview
- every time you apply a view modifier, behind the scenes SwiftUI is creating a new, modified version of the original view, so the order matters
- do not use fixed font size cause the feature of dynamic text in iOS, check that with dynamic type variants
- modifiers about test styling, like bold, multilineTextAlignment, lineSpacing, font, kerning
- concept of Instances, data and methods
- your app is made up of instances of classes or structs
- In Swift, the way you store data on an instance is through something called a property (stored properties and computed properties)
- stored properties is used when you want the instance to simply store a piece of data for you
- computed properties is used when you want the instance to run some code you write in order to calculate a piece of data
- the body is a computed property of the contentView
- for checking the design tab in figma, you need to have the edit permission or tap the small triangle of project name and tap duplicate to your drafts, download the figma desktop to check it out
- Be careful of the typo and case sensitivity mistake, try use autocomplete instead, also don't miss the parentheses or miss a curly brace (you can reindent code by using control + i or use code folding to find where you miss it)
- code floding, you can turn on in Xcode’s settings. It’s under “Text Editing” - Display - and then check the code folding ribbon
- it is best to treat all warnings as if they were errors
- Buttons and Action, SwiftUI State, SwiftUI Bindings, Strings, Variables, App Architecture, Data Model
- shift + command + y for open/hide console
- calling a method (of an instance), calling a function
- State in SwiftUI is used to make your user interface accurately represent the internal state of your app, also means your user interfaces and your state are always consistent
- @State is a special keyword that says this is a state variable, means whenever a state variable changes, SwiftUI is going to automatically recompute the body, resolve the body of the view, and so the view and state variable are always in sync
- using $ sign before the state variable cause we want to convert our state variable to a binding into the state variable
- use Control + click to check the description that you don't know
- SwiftUI was designed to solve the problem of the mismatch between user interface and application state. One of the things SwiftUI provides to help with this is something called Bindings
- Bindings are a way of that a particular user interface view will always be tied to a particular state value
- Behind the scenes, strings are just a sequence of characters
- If you try to simply assign the Double to the Int, you’ll get an error because the feature of Swift which is type safety
- lifetime of a variable is called “scope”
- use a local variable to convert convert a double value to an integer with rounded()
- App Architecture, which is a fancy way of saying the strategy you use for how to organize your code
- One of the best practices of App Architecture is called the “single responsibility principle”. That means that you should think about how to organize your app into multiple classes and structs, where each class or struct has one, and only one job
- convert integer value to string value
- The Swift Standard Library (Random), Unit Testing, Test-Driven Development, If/Else Statements, Variables vs. Constants, Type Inference
- check the developer documentation to find useful method in Swift Standard Library, here we use random to generate the target value


## Acknowledgements
Thanks for the kodeco's team providing such a great course
- Original Repository of Kodeco [_here_](https://github.com/kodecocodes/video-yfsa1-materials). 

