# Neovim Keybindings Cheatsheet

Leader = `<Space>`

## Telescope

| Key            | Action            |
|----------------|-------------------|
| `<leader>tf`   | Find files        |
| `<leader>tg`   | Live grep         |
| `<leader>tb`   | Buffers           |
| `<leader>th`   | Help tags         |

## Copilot (inline suggestions)

| Key     | Mode   | Action             |
|---------|--------|--------------------|
| `<C-J>` | insert | Accept suggestion  |
| `<C-]>` | insert | Dismiss suggestion |
| `<M-]>` | insert | Next suggestion    |
| `<M-[>` | insert | Prev suggestion    |

## Copilot Chat

| Key            | Mode    | Action            |
|----------------|---------|-------------------|
| `<leader>gc`   | normal  | Toggle chat panel |
| `<leader>ge`   | n / v   | Explain           |
| `<leader>gf`   | n / v   | Fix               |
| `<leader>gt`   | n / v   | Generate tests    |

## Git (gitsigns)

| Key            | Action                    |
|----------------|---------------------------|
| `]h`           | Next hunk                 |
| `[h`           | Prev hunk                 |
| `<leader>gp`   | Preview hunk              |
| `<leader>gs`   | Stage hunk                |
| `<leader>gr`   | Reset hunk                |
| `<leader>gS`   | Stage buffer              |
| `<leader>gR`   | Reset buffer              |
| `<leader>gb`   | Blame line                |
| `<leader>gB`   | Toggle inline blame       |
| `<leader>gd`   | Diff this                 |

## Navigation

| Key            | Action                        |
|----------------|-------------------------------|
| `-`            | Oil (open parent directory)   |
| `<leader>jo`   | Prev jump (same buffer)       |
| `<leader>ji`   | Next jump (same buffer)       |

## UI

| Key            | Action                  |
|----------------|-------------------------|
| `<leader>bg`   | Toggle dark/light theme |
