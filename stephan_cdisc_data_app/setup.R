if (!require("remotes")) install.packages("remotes")

# install teal
remotes::install_github("insightsengineering/teal@*release")

# install teal.modules.general
remotes::install_github("insightsengineering/teal.modules.general@*release")

# install tern mmrm (required for teal.modules.clinical)
remotes::install_github("insightsengineering/tern.mmrm@*release")

# install teal.modules.clinical
remotes::install_github("insightsengineering/teal.modules.clinical@*release")

# install teal.modules.hermes
remotes::install_github("insightsengineering/teal.modules.hermes@*release")


ADSL <- random.cdisc.data::cadsl
ADAE <- random.cdisc.data::cadae
ADTTE <- random.cdisc.data::cadtte

list(ADSL, ADAE,  ADTTE) |> map(head, 3)
