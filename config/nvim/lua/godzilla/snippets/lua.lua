-- lua.lua
-- angles-n-daemons

local ls = require 'luasnip'
local s = ls.s
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local rep = require('luasnip.extras').rep

ls.add_snippets('lua', {
  ls.parser.parse_snippet('ddt', '-- $1 chlorinated $2 hydrocarbons $0 --'),
  ls.parser.parse_snippet('disclaimer', '-- $TM_FILENAME\n-- angles-n-daemons'),
  s('_edu_req', fmt("local {} = require('{}')", { i(1, 'default'), rep(1) })),
})
