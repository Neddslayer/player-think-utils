# Multiple Entity Thinkscripts Module
A TF2 VScript module to allow entities to have multiple think scripts at once. It integrates seamlessly into any project, as it adds functions into the CBaseEntity class.

## Usage
Whenever the entity is spawned, you want to call the `StartThinking()` method:
```squirrel
entity.StartThinking();
```

To add a thinkscript to the entity, simply call the `AddEntityThink(name, function)` method:
```squirrel
entity.AddEntityThink("think_example", function() {
    // Your code here...
});
```

To remove an entity's thinkscript, you can call the `RemoveEntityThink(name)` method:
```squirrel
entity.RemoveEntityThink("think_example");
```
