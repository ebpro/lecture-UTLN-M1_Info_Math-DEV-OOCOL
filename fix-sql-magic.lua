-- fix-sql-magic.lua
function CodeBlock(el)
  -- Si le bloc commence par %%sql, on change le langage pour la coloration
  if el.text:match("^%%%%sql") then
    el.classes = {"sql"}
  end
  return el
end
