![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ellisonleao/nvim-plugin-template/lint-test.yml?branch=main&style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

# nvim-dap-view

> minimalistic [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) alternative

![dap-view window](https://github.com/user-attachments/assets/cd901f79-b74a-4609-8dd8-7b4e7cd181ac)

> [!WARNING]  
> **Currently requires a neovim nightly (0.11+)**

## Installation

### Via lazy.nvim

```lua
return {
    {
        "igorlfs/nvim-dap-view",
        dependencies = { "mfussenegger/nvim-dap" },
        config = true,
    },
}
```

## Documentation

TBA

## Acknowledgements

- Code to inject treesitter highlights into line is taken from [`quicker.nvim`](https://github.com/stevearc/quicker.nvim);
- Some snippets are directly extracted from `nvim-dap`:
    - Currently, there's no API to exctract breakpoint information (see [issue](https://github.com/mfussenegger/nvim-dap/issues/1388)), so we resort to using nvim-dap internal mechanism, that tracks extmarks;
    - The magic to extract expressions from visual mode is also a courtesy of `nvim-dap`.
- [lucaSartore](https://github.com/lucaSartore/nvim-dap-exception-breakpoints) for the inspiration for handling breakpoint exceptions;
- [Kulala](https://github.com/mistweaverco/kulala.nvim) for the creative usage of neovim's winbar to handle multiple views.
