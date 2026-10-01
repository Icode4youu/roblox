# roblox-script-project

Project scaffold para sa Roblox scripting gamit ang VS Code + Git.

## Structure

```
roblox-script-project/
├── .vscode/                 # VS Code settings (Lua globals para walang warnings)
├── modules/                 # Dito nakalagay ang mga reusable functions
│   ├── movement.lua         # Teleport at pathfinding logic
│   └── ui_helper.lua        # GUI creation helpers
├── .gitignore
├── main.lua                 # Ang pangunahing script na magtatawag ng modules
└── README.md
```

## Paano gamitin

### Sa Roblox Studio (manual)

1. Gumawa ng **Script** sa `ServerScriptService`, i-paste ang laman ng `main.lua`.
2. Gumawa ng **Folder** na `modules` sa `ServerScriptService`.
3. Sa loob nito, gumawa ng dalawang **ModuleScript** (`movement`, `ui_helper`) at i-paste ang laman ng mga files.

### Gamit ang Rojo (recommended)

Kung may [Rojo](https://rojo.space/) ka, i-sync mo lang itong folder na ito papunta sa Studio:

```bash
rojo serve
```

### Git setup

```bash
git init
git add .
git commit -m "Initial commit"
```

## Notes

- Ang `main.lua` ay **server Script** — ang GUI clicks (e.g. `MouseButton1Click`) ay kailangan ng **LocalScript** para gumana.
- Idagdag ang mga bagong module sa `modules/` folder at i-`require` sa `main.lua`.
