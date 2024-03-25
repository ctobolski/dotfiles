return {
  s({ trig = "!",
    desc = "shebang"
  }, {
      t("#!/bin/"),
      c(1, {
        t("bash"),
        t("zsh")
      })
    }
  )
}

