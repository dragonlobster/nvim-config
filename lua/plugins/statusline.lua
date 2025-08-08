local symbols = {
    error = " ",
    warn = " ",
    info = " ",
    hint = "󰠠 ",
    fern = " "
}

return {
    {
        "echasnovski/mini.statusline",
        version = false,
        opts = {
            content = {
                active =
                    function()
                        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                        local git           = MiniStatusline.section_git({ trunc_width = 40 })
                        local diagnostics   = MiniStatusline.section_diagnostics({
                            trunc_width = 75,
                            signs = { ERROR = symbols.error, WARN = symbols.warn, INFO = symbols.info, HINT = symbols.hint }
                        })
                        local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
                        local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                        local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

                        if vim.bo.filetype == "fern" then
                            return symbols.fern .. "Fern"
                        else
                            return MiniStatusline.combine_groups({
                                { hl = mode_hl,                  strings = { mode } },
                                "%<", -- Mark general truncate point
                                { hl = "MiniStatuslineFilename", strings = { filename } },
                                "%=", -- End left alignment
                                { hl = mode_hl,                  strings = { diagnostics } },
                                { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                                { hl = mode_hl,                  strings = { search } },
                            })
                        end
                    end,

                inactive = function()
                    local filename = MiniStatusline.section_filename({ trunc_width = 140 })
                    if vim.bo.filetype == "fern" then
                        return symbols.fern
                    else
                        return filename
                    end
                end
            }
        }
    }
}
