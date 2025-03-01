-- local ls = require("luasnip")
-- -- some shorthands...
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.conditions")
-- local conds_expand = require("luasnip.extras.conditions.expand")

return {
  s(
    "suite",
    fmt(
      [[
      describe('{}', () => {{
        {}

        it('should {}', {}() => {{
          {}
        }})

      }});
    ]],
      {
        i(1, "SuiteName"),
        c(2, { t("  beforeEach(() => {})"), t("") }),
        i(3, "do something"),
        c(4, { t("async "), t("") }),
        i(0),
      }
    )
  ),
  s(
    "it",
    fmt(
      [[
      it('should {}', {}() => {{
        {}
      }});
    ]],
      {
        i(1, "do something"),
        c(2, { t("async "), t("") }),
        i(0),
      }
    )
  ),
  s(
    "bfe",
    fmt(
      [[
      beforeEach({}() => {{
        {}
      }});
      ]],
      {
        c(1, { t("async "), t("") }),
        i(0),
      }
    )
  ),
  s(
    "fn",
    fmt(
      [[
      {}function {}({}:{}):{} {{
        {}
      }}
      ]],
      {
        c(1, { t("async "), t("") }),
        i(2, "name"),
        i(3, "req"),
        i(4, "type"),
        i(5, "Returns"),
        i(0),
      }
    )
  ),
}
