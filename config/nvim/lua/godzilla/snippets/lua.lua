-- lua.lua
-- angles-n-daemons

local ls = require 'luasnip'
local s = ls.s
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local rep = require('luasnip.extras').rep

vim.print 'loading'
vim.print(s('ddt_fmt', fmt('ddt', '-- $1 chlorinated $2 hydrocarbons $0 --')))
ls.add_snippets('lua', {
  ls.parser.parse_snippet('ddt', '-- $1 chlorinated $2 hydrocarbons $0 --'),
  --s('ddt_fmt', fmt('ddt', '-- $1 chlorinated $2 hydrocarbons $0 --')),
  -- ls.parser.parse_snippet('disclaimer', '-- $TM_FILENAME\n-- angles-n-daemons'),
  -- s('_edu_req', fmt("local {} = require('{}')", { i(1, 'default'), rep(1) })),
  -- s('_edu_rep2', {
  --   t { '-- ' },
  --   rep(1),
  --   t { ': ' },
  --   rep(2),
  --   t { '', '' },
  --   t { '-- ' },
  --   i(1, 'chemical'),
  --   t { ' has the effect ' },
  --   i(2, 'effect'),
  -- }),
  -- s('_edu_rep_formatted', '-- ${1:class}\n$0\n-- ${1}'),
  -- repeat with the formatted snippet?
  -- is parse_snippet and fmt the same?
  -- snippet with selected text?
})
