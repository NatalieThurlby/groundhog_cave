# Ludum Dare 47

## Tools
Programming:
* Godot v3.2.3
* Git/GitHub
* Visual studio code
    * Godot tools v1.1.2
Art:
* Krita 4.3.0
* Wacom Bamboo Pen CTL-460
Misc:
* Macbook pro 2017 (OSX High Sierra 10.13.6)

## Necessary preparations:
### Godot installation
- Installed Godot
- Added a simlink so that I can use the command line more easily `ln -s /Applications/Godot.app/Contents/MacOS/Godot /usr/local/bin/godot` (run `godot --help` to check it works.)
- Installed visual studio code's `godot-tools (v1.1.2)` extension.

### Other
* Re-installed [Waccom Bamboo Pen driver for OSX](https://www.wacom.com/en-us/support/product-support/drivers)
* Installed Krita

## Style guide
### Code
(from the [Godot documentation](https://docs.godotengine.org/en/stable/getting_started/workflow/project_setup/project_organization.html#style-guide))
* Use snake_case (and lower case) for folder and file names (unless using C# scripts - which I will not be). 
* Use PascalCase for node names, as this matches built-in node casing.

### Artwork
* Setup
    - Create a view with a zoomed our mirrored (`M` view)
* Lineart
    - Basic 5 size brush
        - Pressure = thickness (using Wacom tablet)
        - Max thickness = 3.5px
* Animation
    - 2 frames only per sprite animation
    - redraw so it looks a little wobbly


## Repo organisation
`docs/`  -  to for game website, should be able to play and view devlog.
`characters/player`  -  player files and assets

## Workflow

### Code
- Organised with [GitHub](https://github.com/NatalieThurlby/ludumdare47), using issues, feature branches, and milestones
- Aiming for CI with GitHub actions (not done yet)

### Art
For now I am:
* Making one krita `.kra` file for each static asset, or each animation (e.g. each walk cycle)
* Making layer groups for each frame if an animation
* Each layer group contains sketch, lineart, colour lines, colour fill, and background layers.
    * The colour lineart and colour lines layers are cretaed using the basic 5 size brush.
    * The colour fill layers are created by selecting using the contiguous selection tool and then filling the whole selection.





