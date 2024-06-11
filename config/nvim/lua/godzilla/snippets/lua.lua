local ls = require 'luasnip'

-- `add_snippets(ft:string or nil, snippets:list or table, opts:table or nil)`:
ls.add_snippets('lua', {
  ls.parser.parse_snippet('ddt', '-- $1 chlorinated $2 hydrocarbons $0 --'),
})
