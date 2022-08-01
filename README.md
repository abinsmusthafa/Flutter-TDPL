Tata digital Flutter Assignment

Descriptive:(Answers)

1. Hot Reload

1.It is fastest methode to apply and load new UI / fuctionality changes 
2.Fast performance to load the new code changes.
3.Can not rebuild from main().
4.To do Hot Reload - (COMMAND + S) or (Type r) in Command prompt

Hot Restart

1.Its load chages and restart the entire app.
2.Take more time to restart that Hot Relaod
3.Rebuild from main()
4.To do Hot Restart Click on HOT RELOAD button or TYPE R


2. Yes We can. Scaffold is one kind of Widget in Fluter , Same like other other type Widget we can simple nest the Scaffold widget.

Through "Platform Channel" we can access the Android and iOS navitve code from flutter code . we can create a channel object inside out Flutter code

static const platform = MethodChannel('com.tata.sample');

final var result = await platform.invokeMethod('getNativeData');

When we invoke methode with methode name (getNativeData) it will go and check native METHODE HANDLER and run and return the corresponding result to flutter side

3. In Mobile Applicaiton there will be N number event get from user. Example Button Click , swipe drag etc ,It need to handle all of the event with single thread and run an event loop It will execute like First in First out until the queue complete. In app some time has the asynchronous event to load,for example calling API / network call, Ath that time System will wait to finish the and get thet response from back end (Future data) , once get the data the even will drop from event loop then only execute the next event

Coding: (answer Any 2)

3.Identify the problem in the following code block and correct it.

only one issue found on the code is the methode name.
Could not find any logical issue. The methode will return "1000000000! times I print the values!"
If need to print the statement just use print('$counting! times I print the values!');
Corrected answer is

Change methode name from LongOperationMethode to longOperationMethode

String longOperationMethode() { 
var counting = 0; for (var i = 1; i <= 1000000000; i++) { counting = i; } 
print('$counting! times I print the values!') ; 
}
