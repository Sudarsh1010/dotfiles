-- Rust tooling overrides.
--
-- bacon and bacon-ls are installed via Nix (modules/dev/rust.nix), so we
-- strip them from Mason's ensure_installed lists to avoid the
-- `cargo install` path that breaks on darwin with `ld: library not found for -liconv`.
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "bacon" and pkg ~= "bacon-ls"
      end, opts.ensure_installed)
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "bacon" and pkg ~= "bacon-ls"
      end, opts.ensure_installed)
    end,
  },
}
