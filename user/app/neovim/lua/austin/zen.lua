
vim.keymap.set("n", "<C-z>", function() 
  require("zen-mode").toggle({
  window = {
    width = .65 -- width will be 85% of the editor width
  }
})
end)
