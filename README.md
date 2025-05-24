# Neovim Configuration

This Neovim configuration uses **LazyVim** as a base and features a well-organized modular architecture for a modern and efficient development environment.

## Install

### Linux or MacOS
```bash
git clone https://github.com/hugopoggetti/nvim-config ~/.config/nvim && nvim
```

### Windows
```bash
git clone https://github.com/hugopoggetti/nvim-config $HOME\AppData\Local\nvim --depth 1 && nvim
```

After installation, the configuration will automatically install all plugins via Lazy.nvim.

## Reset

```bash
rm -rf ~/.local/share/nvim && rm -rf ~/.config/nvim/lazy-lock.json
```

## Directory Structure

```bash
├── init.lua                            # Main entry point
├── lazy-lock.json                      # Plugin version lockfile
├── lazyvim.json                        # LazyVim configuration
├── lua/
│   ├── config/                          # Core configuration
│   │   ├── autocmds.lua                # Auto commands
│   │   ├── keymaps.lua                 # Key mappings
│   │   ├── lazy.lua                    # Lazy.nvim setup
│   │   └── options.lua                 # Neovim options
│   ├── plugins/                        # Plugin configurations
│   │   ├── autopairs.lua               # Auto-pairs
│   │   ├── basic.lua                   # Essential plugins
│   │   ├── color.lua                   # Color themes
│   │   ├── comments.lua                # Comment management
│   │   ├── diffview.lua                 # Git diff viewer
│   │   ├── disable.lua                 # Disabled LazyVim plugins
│   │   ├── git-worktree.lua            # Git worktree management
│   │   ├── harpoon.lua                 # File navigation
│   │   ├── lspconfig.lua                # Language server configuration
│   │   ├── lualine.lua                 # Status line
│   │   ├── markdown-preview.lua        # Markdown preview
│   │   ├── nvim-cmp.lua                # Autocompletion
│   │   ├── nvim-surround.lua           # Surround operations
│   │   ├── telescope.lua               # Fuzzy finder
│   │   ├── tiny-inline-diagnostic.lua  # Inline diagnostics
│   │   ├── todo-comments.lua           # TODO highlights
│   │   ├── treesitter.lua              # Syntax highlighting
│   │   └── zen.lua                     # Distraction-free mode
│   └── utils/                          # Custom utilities
│       ├── cpp-class-generator.lua     # C++ class generator
│       ├── jump.lua                    # Navigation functions
│       └── telescope-project.lua       # Project management
├── README.md
└── stylua.toml                         # Lua formatter configuration
```

## Language Support

This configuration supports multiple programming languages through LSP servers:

| Language | LSP Server | Description |
|----------|------------|-------------|
| **C/C++** | `clangd` | Full C/C++ language support with IntelliSense |
| **Haskell** | `hls` | Haskell Language Server for functional programming |
| **Python** | `pyright` | Microsoft's Python language server |
| **Lua** | `lua_ls` | Lua language server for Neovim configuration |
| **Assembly** | `asm_lsp` | Assembly language support |
| **CMake** | `cmake` | CMake build system support |
| **YAML** | `yamlls` | YAML configuration files |
| **Bash** | `bashls` | Shell scripting support |
| **Rust** | `rust_analyzer` | Rust language server with advanced features |
| **HTML** | `html` | HTML markup language support |
| **Zig** | `zls` | Zig language server |

## Important Plugins

Below is the list of essential plugins that make this configuration powerful and efficient:

| Plugin Name | Description |
|-------------|-------------|
| **nvim-autopairs** | Automatic closing of brackets, quotes, and parentheses |
| **nvim-surround** | Easy manipulation of surrounding characters (quotes, brackets, etc.) |
| **harpoon** | Quick navigation between favorite files |
| **telescope.nvim** | Powerful fuzzy finder for files, text, and commands |
| **lualine.nvim** | Modern and informative status line |
| **diffview.nvim** | Git diff visualization with advanced features |
| **git-worktree** | Git worktree management for multiple branches |
| **nvim-lspconfig** | Language Server Protocol configuration |
| **nvim-cmp** | Intelligent autocompletion engine |
| **nvim-treesitter** | Advanced syntax highlighting and code analysis |
| **tiny-inline-diagnostic** | Compact inline diagnostic messages |
| **comment.nvim** | Smart comment management |
| **todo-comments.nvim** | Highlight and search TODO/FIXME comments |
| **markdown-preview.nvim** | Live Markdown file preview |
| **zen-mode.nvim** | Distraction-free writing mode |

## Custom Utilities

### C++ Class Generator
Automatically generates C++ class boilerplate code with proper header guards, constructors, and destructors.

### Project Management
Enhanced Telescope integration for managing multiple projects and quick project switching.

### Smart Navigation
Custom jump functions for efficient code navigation and file management.

## About

- This configuration is built on top of LazyVim for stability and modern features
- Modular architecture allows easy customization and maintenance  
- Supports polyglot development with comprehensive language server integration
- Includes specialized tools for C++ development and Git workflow
- Optimized for both solo and team development environments

## Usage

This configuration is ideal for:
- Multi-language development projects
- Git-based collaborative workflows
- C++ development with automatic code generation
- Intensive code navigation and search workflows
- Documentation writing with Markdown support
- Distraction-free coding sessions

The modular structure allows you to easily enable/disable features based on your project needs.
