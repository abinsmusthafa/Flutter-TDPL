# Flutter-TDPL
Tata digital Flutter Assignment

Descriptive:(Answers)

1. Hot Reload

    - It is fastest methode to apply and load new UI / fuctionality changes .
    - Fast performance to load the new code changes.
    - Can not rebuild from main()
    - to do Hot Reload - (COMMAND + S)  or (Type r) in Command prompt

    Hot Restart

    - Its load chages and restart the entire app.
    - Take more time to restart that Hot Relaod 
    - Rebuild from main()
    - To do Hot Restart Click on HOT RELOAD button or TYPE R

2. Yes We can. Scaffold is one kind of Widget in Fluter , Same like other other type Widget we can simple nest the Scaffold widget.

3. Through "Platform Channel" we can access the Android and iOS navitve code from flutter code . we can create a channel object inside out Flutter code 

    static const platform = MethodChannel('com.tata.sample');

    final var result = await platform.invokeMethod('getNativeData');

    When we invoke methode with methode name (getNativeData) it will go and check native METHODE HANDLER and run and return the corresponding result to         flutter side

4.  
