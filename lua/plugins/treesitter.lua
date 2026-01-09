return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "asm",
        "bash",
        "c",
        "cpp",
        "cmake",
        "lua",
        "markdown",
        "json",
        "python",
        "rst",
        "yaml",
      })
    end,
  },
}
