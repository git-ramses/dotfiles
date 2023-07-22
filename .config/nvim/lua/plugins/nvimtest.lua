require('nvim-test').setup {
  run = true,                 -- run tests (using for debug)
  commands_create = true,     -- create commands (TestFile, TestLast, ...)
  filename_modifier = ":p:~", -- modify filenames before tests run(:h filename-modifiers)
  silent = false,             -- less notifications
  term = "terminal",          -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "vertical",   -- terminal's direction ("horizontal"|"vertical"|"float")
    width = 96,               -- terminal's width (for vertical|float)
    height = 24,              -- terminal's height (for horizontal|float)
    go_back = false,          -- return focus to original window after executing
    stopinsert = "auto",      -- exit from insert mode (true|false|"auto")
    keep_one = true,          -- keep only one terminal for testing
  },
  runners = {               -- setup tests runners
    ruby = "nvim-test.runners.rspec",
  }
}

require('nvim-test.runners.jest'):setup {
  command = "rspec",                                -- run the test runner
  args = { "-fd" },                                 -- default args
  env = {},                                         -- custom env vars
  file_pattern = "\\v(__spec__/*.|(spec))\\.(rb)$", -- determine whether a file is a testfile
  find_files = { "spec/{name}_spec.{ext}" },        -- find testfile for a file
  filename_modifier = ':p:~',                          -- modify filename before tests run (:h filename-modifiers)
  working_directory = nil,                          -- set working directory (cwd by default)
}
