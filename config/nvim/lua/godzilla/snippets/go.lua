-- go.lua
-- angles-n-daemons

local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require 'luasnip.extras.expand_conditions'
local postfix = require('luasnip.extras.postfix').postfix
local types = require 'luasnip.util.types'
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

local function com(str)
  return t('-- ' .. str)
end

local function lb()
  return t { '', '' }
end

local function tab()
  return t '\t'
end

ls.add_snippets('go', {
  -- godoc
  -- function
  -- struct function
  -- error exit
  -- ternary
  s('?var', {
    t 'var ',
    i(1, '<varname>'),
    t ' ',
    i(2, '<type>'),
    lb(),

    t 'if ',
    i(3, '<condition>'),
    t ' {',
    lb(),
    tab(),
    rep(1),
    t ' = ',
    i(4, '<then>'),
    lb(),

    t '} else {',
    lb(),
    tab(),
    rep(1),
    t ' = ',
    i(5, '<else>'),
    lb(),
    t '}',
    i(0),
  }),
  s('?return', {
    t 'if ',
    i(1, '<condition>'),
    t ' {',
    lb(),
    tab(),
    t 'return ',
    i(2, '<then>'),
    lb(),

    t '} else {',
    lb(),
    tab(),
    t 'return ',
    i(3, '<else>'),
    lb(),
    t '}',
    i(0),
  }),

  -- for loops
  s('for', {
    t 'for ',
    i(1, 'i'),
    t ' := 0; ',
    rep(1),
    t ' < ',
    i(2, '<end>'),
    t ';',
    t ' ',
    rep(1),
    t '++ {',
    lb(),
    t '\t',
    i(3),
    lb(),
    t '}',
    lb(),
  }),

  -- error handling

  -- testing
  s('test', {
    t 'func Test',
    i(1, '<test_name>'),
    t '(t *testing.T) {',
    lb(),
    tab(),
    i(2),
    lb(),
    t '}',
    lb(),
    i(0),
  }),

  s('tErr', {
    t 'if ',
    i(1, '<condition>'),
    t ' {',
    lb(),
    tab(),
    t 't.Fatalf("',
    i(2),
    t '")',
    lb(),

    t '}',
    lb(),
    i(0),
  }),

  -- Test suite?
  -- Benchmark?
})
