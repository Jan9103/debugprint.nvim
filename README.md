# Debugprint.nvim

For all the people, which still use `print` for debugging (which includes me).

Usage:
1. hover over your variable
2. one of:
  - `:Debugprint`
  - `lua require("debugprint").print()` (can be used without calling `setup`)

## Setup


[lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  "jan9103/debugprint.nvim",
  cmd = "Debugprint",
  config = function() require("debugprint").setup() end,
}
```

packer.nvim:

```lua
use {"jan9103/debugprint.nvim", config = function() require("debugprint").setup() end}
```

## Supported Languages

- shell: bash, sh, nu
- java
- javascript & typescript
- lua
- python
- rust

Feel free to open a MR or issue for more languages.
