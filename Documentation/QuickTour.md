# QuickTour of the Stats-Configurator

---

Come on in, I'll show you around.

## Pre-requisites

* [Norbyte's Script-Extender](https://github.com/Norbyte/ositools) and the [Stats-Configurator](#ReleasesLink).

## Getting Started

Let's get started. Open up the game and load into a save. The stats-configurator item will be added to your inventory. Using it will open up the Mod-Menu. But let's create a config-file first.

Navigate to `\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\Osiris Data` folder on your system. This is where the script-extender reads and writes files. Create `S7_Config.json` file (make sure its a json file and not a text file. Windows sometimes likes to mess things up - `S7_Config.json.txt` for example).

The stats-configurator reads json files for configuration so we need to follow proper json format. If you're familiar with json then that's fantastic, otherwise you can look that up on the internet, or you can just follow along with this tour - json isn't exactly indecipherable.

Inside `S7_Config.json` write the following content:

```json
{
    "Projectile_Fireball":  {"ActionPoints": 4, "Cooldown": 7}
}
```

json files/objects are just key-value pairs. you can nest key-value pairs inside other key-value pairs (which can inturn be nested inside another key-value pair). Here `Projectile_Fireball` is the key and everything after the `:` is it's value. Within that, we have two key-value pairs.

1. `"ActionPoints": 4`. ActionPoints is the key and 4 is the value.
2. `"Cooldown": 7` . Cooldown is the key and 7 is the value.

Enough about json :P
The block of code is pretty self-explanatory. We want the skill `Projectile_Fireball` to have an `ActionPoints` cost of 4 and a `Cooldown` of 7 turns.

Let's go back in the game, but before we load this configuration let's see what the original values of this skill's attributes are.

The script-extender comes with a `Debug Console`. Looks like this
|IMAGE HERE|

This is where a lot of useful information will be outputted. This is also where you can input information. Stats-Configurator comes with a suite of console-commands to make your life easier. Right now, we want to add `Projectile_Fireball` to our character (if you don't have it already.).
We will use the `AddSkill` console command for this purpose.

Pressing `enter` on the debug console will allow you to enter console-commands. write `!S7_Config AddSkill Projectile_Fireball`.
`!` is what you use to denote that you're calling a console command, `S7_Config` is the name of the console-command function that I've given (it'll always be `S7_Config`, for any command in this mod), `AddSkill` is the actual command and we want `Projectile_Fireball`.
Pro-tip: use `!S7_Config Help` for a helpful guide on console-commands.
This will basically add `Projectile_Fireball` to all `client` characters.

Now would be a good time to elaborate on `host` and `clients` but I'll digress till after the basics.

Now that your characters have the original unmodified `Projectile_Fireball`. Have a look at its attributes. `ActionPoints` and `Cooldown` specifically. Now the fun part, open the stats-configurator and open `[configuration]`. Load the configuration file we just created in `Osiris Data`.

P.S.: watch the magic happen in the debug console.

Have a look at `Projectile_Fireball` again. It's `ActionPoints` and `Cooldown` have changed to the values you designated. Take this time to congratulate yourself.
