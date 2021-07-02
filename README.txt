[h1][b]Stats Configurator[/b][/h1]

[h2]Divinity Original Sin 2: Definitive Edition[/h2]

<hr>

The [b][i]Stats Configurator[/i][/b] allows you to modify and customize stats by creating [i]config files[/i]. Through the configuration file, you can change attributes like [i]action-points costs, cooldowns[/i] and [i]memory costs[/i] of [b]skills[/b]; [i]gold-value, damage-values[/i] and [i]damage type[/i] of [b]weapons[/b]; [i]resistances[/i] and [i]item-color[/i] of [b]armors[/b]; [i]talents, accuracy[/i] and [i]dodge[/i] of [b]characters[/b]; and many more.

[h2]Releases[/h2]

[list]
[*] [strike][b][i][url=#SteamWorkshop]Steam Workshop[/url][/i][/b][/strike]
[*] [b][i][url=https://github.com/Shresht7/Stats-Configurator/releases]Github[/url][/i][/b]
[/list]

[h2]Requirements[/h2]

[list]
[*] [b][i][url=https://github.com/Norbyte/ositools]Norbyte's Script-Extender[/url][/i][/b]
[/list]

[h2]Features[/h2]

[h3]Configure to your heart's desire[/h3]

Users can override stats by creating [b]json files[/b] (Default: `Config.json`) like so:

[code]
{
  "Projectile_Fireball": {
    "ActionPoints": 4,
    "Cooldown": 7,
    "ExplodeRadius": 10,
    "DisplayName": "BOOMER"
  }
}
[/code]

[quote]Create your config-files in the Osiris Data\StatsConfigurator\ folder. - i.e. `..\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\Osiris Data\StatsConfigurator\`.[/quote]

When this configuration loads, it will override `Projectile_Fireball`. The [b]Fireball[/b] skill will now cost [b][i]4 ActionPoints_[/b], have a [b][i]7 turn Cooldown[/i][/b], [/i]explode_ in a [b][i]10m radius[/i][/b] and will be called [b][i]BOOMER[/i][/b].

![url=https://imgur.com/Vc3NkF8.png]Fireball-Example[/url]

[b][i]Checkout more [url=Documentation/Examples.md]examples![/url][/i][/b]

[h3]Quick Start[/h3]

[olist]
[*] Create/Edit `Config.json` in `Osiris Data\StatsConfigurator\`.
[*] `Load Configuration` from the in-game [b]mod-menu[/b].
[*] `Rebuild ConfigData` once you're happy with your edits.
[*] `Broadcast` your [b]ConfigData[/b] to any peers. (Multiplayer)
[*] `Verify` client configs to ensure everyone is on the same page.
[*] [b]Done[/b] - your [b]ConfigData[/b] will automatically reload your edits whenever the game loads. Repeat the aforementioned options as necessary.
[*] Restart the game for changes to apply.
[/olist]

<hr>

[b][i][url=Documentation/Extensive-Documentation.md]READ THE EXTENSIVE DOCUMENTATION[/url][/i][/b]

<hr>

[h2]Complementary Mods[/h2]

[list]
[*] [[b]EXIM[url=https://steamcommunity.com/sharedfiles/filedetails/?id=2006677782]/b][/url] by [b][i]Luxen[/i][/b] - EXIM allows you to export/import and modify characters stats, skills, inventory and hotbar.
[*] [[b]UI Components Library[url=https://steamcommunity.com/sharedfiles/filedetails/?id=2337228868]/b][/url] - Enables the ContextMenu option to [i]apply configurations[/i].
[/list]

<hr>

[h2]Thanks and Credits[/h2]

[list]
[*] [b][url=http://store.steampowered.com/app/435150/Divinity_Original_Sin_2/]Divinity: Original Sin 2[/url][/b], a game by [b][url=http://larian.com/]Larian Studios[/url][/b].
[*] [b]LaughingLeader[/b] for the [b][url=https://github.com/LaughingLeader/SourceControlGenerator]Source Control Generator[/url][/b].
[*] Huge thanks to [b]Norbyte[/b] for the [b][url=https://github.com/Norbyte/ositools]Script-Extender[/url][/b], for valuable advice and for having a fix for every problem.
[/list]
