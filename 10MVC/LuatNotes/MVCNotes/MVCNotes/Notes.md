What is Design Pattern
1) Solves a problem
- Ex. Delegation: Two instances having direct reference to each other -> loosely coupled communication
2) Architecture Design Pattern: separation of types/responsibility
- responsibilities: Displaying data, fetching data, saving data, responding to user input, etc

MVC: Model, View, Controller

Model: Data
- Holds the data (Database )
- Data manipulation (Business Logic)
- Data Parsing
- Completely UI/ independent 

View: Visual rendering, communicates with Controller, register user’s interaction
- Users Input
	- TapGesture, Buttons, Swipes
- Showing Data
	- Does not hold any data
	- Shows the formatted data given by the controller
- Communication 
	- From Controller to View: Controller owns the view as a property, direct reference
	- From View to Controller: IBActions and delegation pattern. Does not own a controller
- Completely Data independent
 
Controller: How to display that data
- Fetching Data: Networking
- Handling User events
- Navigation (Routing)
- Communication
	- From Controller to View: talks directly to the view (owns the view)
	- From Controller to Model: owns the model
	- From View to Controller: IBActions and delegation pattern
	- From Model to Controller: 
		- Observer Pattern (property observer)
		- Publisher/Subscriber pattern, (Notification)
		- Closures
		- Delegation
