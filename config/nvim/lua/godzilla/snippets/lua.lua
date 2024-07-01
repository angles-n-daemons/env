-- lua.lua
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

-- collection of test snippets
ls.cleanup()
-- stylua: ignore
ls.add_snippets('lua', {
  ls.parser.parse_snippet(
    { trig = 'ddt', docstring = 'I am a docstring guy' },
    '-- $1 chlorinated $2 hydrocarbons $0 --'
  ),
  s('fndoc',
    { com(''), rep(1), t(' '), i(4, '<desc>'), lb(), t('local function '), i(1, '<fn name>'), t('('), i(2), t(')'), lb(),
      i(3), lb(), t('end'), i(0) }),

  s('absindexexamples', {
    com('abs: '), i(1, '<zabsolute>'), lb(),
    com(''), f(function(args, snip)
    return { args[1][1] .. ' ' .. args[2][1] .. ' returns ' .. args[3][1] }
  end, { ai[1], ai[2][1], ai[2][2] }),
    sn(2, {
      t('local function '), i(1, '<fn>'), t('()'), lb(),
      t('  return '), i(2), lb(),
      t('end')
    })
  }),
  s("choice", c(1, {
    t("Ugh boring, a text node"),
    i(nil, "At least I can edit something now..."),
    f(function(args) return "Still only counts as text!!" end, {})
  })),
  s('placeholders', {
    i(1, 'p1'), t ' ',
    i(2, 'p2'), t ' ',
    i(3, 'p3'), t ' ',
  })
})
