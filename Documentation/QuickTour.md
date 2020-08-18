# Quick-Tour of the Stats-Configurator

---

## Quick-Start

It's time to get your feet wet, so let's get started. Once you've installed and activated the mod, open up the game and load into a save. The *stats-configurator* item will be added to your inventory automatically. Using it will open up the **Mod-Menu** - from here, you can access most functions of this mod.

|                                                           |                                                               |
| --------------------------------------------------------- | ------------------------------------------------------------- |
| Configurator Item                                         | Stats-Configurator Mod Menu                                   |
| ![Stats-Configurator-Item](https://imgur.com/BagN95a.png) | ![Stats-Configurator-Mod-Menu](https://imgur.com/sADorrm.png) |
|                                                           |                                                               |

### Creating a Config-File

Before we go any further let's create a **config-file**. Navigate to `\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\Osiris Data` folder on your system. This is where the ***script-extender*** reads from and writes files to. Create `S7_Config.json` file and open it in your favourite text editor _(VSCode, Sublime, Notepad++, or regular Notepad etc.)_.

Inside `S7_Config.json` write the following content:

```json
{
    "Projectile_Fireball":  {
        "ActionPoints": 4,
        "Cooldown": 7
    }
}
```

The block of code is pretty self-explanatory. We want the skill `Projectile_Fireball` to have an `ActionPoints` cost of **4** and a `Cooldown` of **7** turns. `Projectile_Fireball` is the internal name of the skill **"Fireball"**, as are `ActionPoints` and `Cooldown`. I've provided a few tools to display stat-names and such for your reference, please read the ***[documentation](Extensive-Documentation.md#References)*** for more details.

### Looking at Original Attributes

Let's go back in the game, but before we load this configuration-file, let's see what the **original values** of this skill's attributes are. The script-extender comes with a `debug-console` which opens up automatically as you open the game. It looks like this:

![DebugConsole](https://imgur.com/l8PeToQ.png)

This is where this mod outputs a lot of _useful information_. This is also where you can input [console-commands](Extensive-Documentation.md#Console-Commands). Stats-Configurator comes with a suite of [***console-commands***](Extensive-Documentation.md#Console-Commands) to make your life easier. Right now, we want to add `Projectile_Fireball` to our character (if we don't have the skill already memorized).
We will use the `AddSkill` console command for this purpose.

Pressing `enter` on the debug console will allow you to enter console-commands. Write `!S7_Config AddSkill Projectile_Fireball` and hit enter. Type `exit` and press enter to exit out of the console-command view. This command will add `Projectile_Fireball` to all ***client*** characters.
***Pro-tip:*** use `!S7_Config Help` for a helpful guide on console-commands in this mod. For more details, read [this](Extensive-Documentation.md#Console-Commands).

![Console-Command-Image](https://imgur.com/bYxl5uE.gif)

Now that your characters have the *original* and *unmodified* `Projectile_Fireball`. Take note of its **attributes**. `ActionPoints` and `Cooldown` specifically.

### Configuring Stats

Now for the fun part, open the stats-configurator mod-menu and select `1.[configuration]`. The first option, `1.[Load Configuration]`, will load the configuration file we just created in `Osiris Data` and apply the stat-overrides. Watch the magic happen in the debug console.

![Debug-Console-Output](https://imgur.com/yNqhRU2.png)

Now have a look at `Projectile_Fireball` again. It's `ActionPoints` and `Cooldown` have changed to the values **you** set in the config-file.

### Building Config-Data

With the [_default settings_](Extensive-Documentation.md#Default-Settings), these changes will **not** be restored the next time you load the game. Due to a myriad of reasons (that'll take too long to explain in a quick-start guide), the mod **compiles** all configuration-data into a seperate file (`S7_ConfigData.json` by default). Stat-overrides made here are loaded during the `ModuleLoading` event i.e. when the game loads. There's a whole lot to ***Config-Data***, but for now we just need to put our configuration in Config-Data so that our changes are saved persistently and are loaded in the game automatically during startup.

Using the mod-menu, in `1.[configuration]`,chosing the second option called `2.[Rebuild ConfigData]` will create a Config-Data file by compiling all the sources of configuration-data - Only `S7_Config.json` in our case. Do so now.

You should see `S7_ConfigData.json` appear in `Osiris Data` folder.

Reload the entire game and keep an eye on the debug-console. You'll see that the Config-Data file is loaded automatically when the game starts. That's it. Congratulations, You're done. Wait for the game to load and check if your changes still exist.

### Sharing Config-Data

If you are playing multiplayer with friends, there's one more thing you need to consider. The ConfigData file is loaded client-side. This means that each client needs to have their own local copy of the ConfigData file. Users can share their json files manually or through the mod-menu. This will ensure that each peer has the same ConfigData and thus the same stats across their game. The host character can **broadcast** their ConfigData file to all connected peers from the mod-menu. They can also quickly verify if all clients have the same version of the ConfigData file from the menu.

---

### Congratulations

That's pretty much it. That's all you need to know to get started with this mod. I'll urge you to read the ***[extensive documentation](Documentation/Extensive-Documentation.md)*** to learn more about this mod and all that it has to offer. Take a look at some ***[examples](Documentation/Examples.md)*** for more ideas.
