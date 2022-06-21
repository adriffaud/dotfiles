import_if_available(Ecto.Query)
import_if_available(Ecto.Changeset)

Application.put_env(:elixir, :ansi_enabled, true)
IEx.configure(
  colors: [
    enabled: true,
    eval_result: [:green, :bright] ,
    eval_error: [:red,:bright],
    eval_info: [:yellow, :bright ],
  ],
  default_prompt: [
    "\e[G",
    "🧪 ",
    :magenta,
    "%prefix",
    " ▶",
    :reset
  ]
  |> IO.ANSI.format()
  |> IO.chardata_to_string()
)
