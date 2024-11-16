# fivem-working-lighter
Simple FiveM script allowing players to start fire using lighter item.
## Video
https://www.youtube.com/watch?v=bs7Isb54We8

## Resource Installation
* Download the repository
* Put the `fivem-working-lighter` folder in your resources directory
* Add `ensure fivem-working-lighter` to your server config
* If you use pure ESX, add `lighter` item into your database
* If you use ox_inventory add the following lines into `ox_inventory\data\items.lua`:
```lua
['lighter'] = {
	label = 'Lighter',
	weight = 145,
},
```
