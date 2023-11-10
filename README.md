# Multiple Player Thinkscripts Module
A TF2 VScript module to allow entities to have multiple think scripts at once. It integrates seamlessly into any project, as it adds functions into the CTFPlayer class, and can be adapted to any other Source Engine game.

## Usage
Whenever a player is spawned, you want to call the `StartThinking()` method:
```squirrel
player.StartThinking();
```

To add a thinkscript to a player, simply call the `AddPlayerThink(name, function)` method:
```squirrel
player.AddPlayerThink("think_example", function() {
    // Your code here...
});
```

To remove a player's thinkscript, you can call the `RemovePlayerThink(name)` method:
```squirrel
player.RemovePlayerThink("think_example");
```
