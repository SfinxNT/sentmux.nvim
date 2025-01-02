<div align=center>

# Sentmux

Send it already!

</div>

## Purpose

Eliminate copy-pasting between notes and terminal.

## How it works

Find marked pane in all tmux sessions and send line under cursor to that pane.

## Typical use case

- In a new window create few panes with ssh sessions to different servers;
- Sync input with `setw synchronize-panes`;
- Mark one synced pane;
- Go to your notes and send commands to marked pane;

![How i use it](https://i.imgur.com/GfirrGX.gif)

## Typical configuration

```lua
{
  "SfinxNT/sentmux.nvim",
  lazy = true,
  keys = {
    { "<leader>p", "<cmd>SendCommand<CR>", desc = "Send to TMUX" },
  },
}
```

## Another way to configure it

```lua
{
  "SfinxNT/sentmux.nvim",
  lazy = true,
  keys = {
    {
      "<leader>P",
      function()
        require("sentmux").send_command("echo 'hmm... interesting...'")
      end,
      desc = "Hmm...",
    },
  },
}
```
