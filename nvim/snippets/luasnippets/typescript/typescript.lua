return {
  s("suite",
    fmt([[
      describe('{}', () => {{
        {}

        it('should {}', {}() => {{
          {}
        }})

      }});
    ]],
      {
        i(1, "SuiteName"),
        c(2, { t "  beforeEach(() => {})", t "" }),
        i(3, "do something"),
        c(4, { t "async ", t "" }),
        i(0)
      }
    )
  )
}
