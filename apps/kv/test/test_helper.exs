exclude =
  if Node.alive?, do: [], else: [distrubuted: true]

ExUnit.start(exclude: exclude)
