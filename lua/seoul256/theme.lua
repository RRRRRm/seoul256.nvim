local colors = require("seoul256/colors")
local ct = require("seoul256.colortools")

local M = {}

-- Syntax highlight groups
-- Type `:h syntax` for more informations
M.syntax = {
    Boolean = { fg = colors.light_cyan },
    Character = { fg = colors.light_cyan },
    Comment = { fg = colors.green },
    Conditional = { fg = colors.light_red },
    Constant = { fg = colors.brown },
    Debug = { fg = colors.red },
    Define = { fg = colors.purple },
    Delimiter = { fg = colors.cyan },
    Error = { fg = colors.error, bg = colors.none, style = "underline,bold" },
    Exception = { fg = colors.cyan },
    Float = { fg = colors.light_cyan },
    Function = { fg = colors.cyan },
    Identifier = { fg = colors.purple },
    Ignore = { fg = colors.fg },
    Include = { fg = colors.cyan },
    Keyword = { fg = colors.light_red },
    Label = { fg = colors.light_red },
    Macro = { fg = colors.cyan },
    Number = { fg = colors.light_cyan },
    Operator = { fg = colors.cyan },
    PreCondit = { fg = colors.cyan },
    PreProc = { fg = colors.light_red },
    Repeat = { fg = colors.light_red },
    Special = { fg = colors.red },
    SpecialChar = { fg = colors.purple },
    SpecialComment = { fg = colors.white },
    Statement = { fg = colors.purple },
    StorageClass = { fg = colors.cyan },
    String = { fg = colors.string, bg = colors.none, style = "italic" },
    Structure = { fg = colors.puple },
    Tag = { fg = colors.red },
    Todo = { fg = colors.brown, bg = colors.none, style = "bold,italic" },
    Type = { fg = colors.light_red },
    Typedef = { fg = colors.red },
    Underlined = { fg = colors.link, bg = colors.none, style = "underline" },
}

-- Editor highlight groups
-- Type `:h highlight-groups` for more informations
M.editor = {
    ColorColumn = { fg = colors.none, bg = colors.bg_l },
    Conceal = { fg = colors.fg },
    Cursor = { fg = colors.cursor, bg = colors.none, style = "reverse" },
    lCursor = {}, -- TODO
    CursorColumn = { fg = colors.none, bg = colors.bg_l },
    CursorIM = { fg = colors.cursor, bg = colors.none, style = "reverse" },
    CursorLine = { fg = colors.none, bg = colors.bg_l },
    CursorLineNr = { fg = colors.accent },
    DiffAdd = { fg = colors.green, bg = colors.none, style = "reverse" },
    DiffChange = { fg = colors.light_cyan, bg = colors.none, style = "reverse" },
    DiffDelete = { fg = colors.red, bg = colors.none, style = "reverse" },
    DiffText = { fg = colors.brown, bg = colors.none, style = "reverse" },
    Directory = { fg = colors.cyan, bg = colors.none },
    EndOfBuffer = { fg = colors.fg },
    ErrorMsg = { fg = colors.none },
    FoldColumn = { fg = colors.cyan },
    Folded = { fg = colors.green, bg = colors.bg, style = "italic" },
    IncSearch = { fg = colors.highlight, bg = colors.white, style = "reverse" },
    LineNr = { fg = colors.line_numbers },
    MatchParen = { fg = colors.brown, bg = ct.lighten(colors.bg, 32), style = "bold" },
    ModeMsg = { fg = colors.accent },
    MoreMsg = { fg = colors.accent },
    MsgArea = {}, -- TODO
    MsgSeparator = {}, -- TODO
    NonText = { fg = colors.fg },
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.float },
    NormalNC = {}, -- TODO f
    Pmenu = { fg = colors.fg, bg = colors.bg_l },
    PmenuSbar = { fg = colors.text, bg = colors.bg_d },
    PmenuSel = { fg = colors.fg, bg = colors.red },
    PmenuThumb = { fg = colors.fg, bg = colors.accent },
    Question = { fg = colors.green },
    QuickFixLine = {
        fg = colors.highlight,
        bg = colors.white,
        style = "reverse",
    },
    Search = { fg = colors.highlight, bg = colors.white, style = "reverse" },
    SignColumn = { fg = colors.fg, bg = colors.bg },
    SpecialKey = { fg = colors.light_red },
    SpellBad = { fg = colors.red, bg = colors.none, style = "undercurl,italic" },
    SpellCap = { fg = colors.cyan, bg = colors.none, style = "undercurl,italic" },
    SpellLocal = {
        fg = colors.cyan,
        bg = colors.none,
        style = "undercurl,italic",
    },
    SpellRare = {
        fg = colors.light_red,
        bg = colors.none,
        style = "undercurl,italic",
    },
    StatusLine = { fg = colors.fg, bg = colors.bg_l },
    StatusLineNC = { fg = colors.text, bg = colors.fg },
    WinBar = { fg = colors.fg, bg = colors.bg_d },
    WinBarNC = { fg = colors.text, bg = colors.disabled },
    Substitute = {}, -- TODO
    TabLineFill = { fg = colors.fg },
    Tabline = { fg = colors.fg },
    TablineSel = { fg = colors.bg, bg = colors.accent },
    TermCursor = { fg = colors.cursor, bg = colors.none, style = "reverse" },
    TermCursorNC = { fg = colors.cursor, bg = colors.none, style = "reverse" },
    Title = { fg = colors.green, bg = colors.none, style = "bold" },
    VertSplit = { fg = colors.bg },
    Visual = { fg = colors.none, bg = colors.selection },
    VisualNOS = { fg = colors.none, bg = colors.selection },
    WarningMsg = { fg = colors.brown },
    Whitespace = { fg = colors.text },
    WildMenu = { fg = colors.light_cyan, bg = colors.none, style = "bold" },

    -- GUI only
    Menu = {},
    Scrollbar = {},
    Tooltip = {},
}

-- TreeSitter highlight groups
-- Type `:h nvim-treesitter-highlights` for more informations
M.treesitter = {
    TSAttribute = { fg = colors.brown },
    TSBoolean = { fg = colors.light_cyan },
    TSCharacter = { fg = colors.light_cyan },
    TSComment = { fg = colors.green },
    TSConditional = { fg = colors.light_red },
    TSConstBuiltin = { fg = colors.cyan },
    TSConstMacro = { fg = colors.cyan },
    TSConstant = { fg = colors.brown },
    TSConstructor = { fg = colors.light_red },
    TSDanger = {}, -- TODO
    TSEmphasis = { fg = colors.orange },
    TSEnvironment = {}, -- TODO
    TSEnvironmentName = {}, -- TODO
    TSError = { fg = colors.error },
    TSException = { fg = colors.brown },
    TSField = { fg = colors.white },
    TSFloat = { fg = colors.red },
    TSFuncBuiltin = { fg = colors.cyan },
    TSFuncMacro = { fg = colors.cyan },
    TSFunction = { fg = colors.cyan },
    TSInclude = { fg = colors.cyan },
    TSKeyword = { fg = colors.light_red },
    TSKeywordFunction = { fg = colors.light_red },
    TSKeywordOperator = {}, -- TODO
    TSKeywordReturn = {}, -- TODO
    TSLabel = { fg = colors.red },
    TSLiteral = { fg = colors.fg },
    TSMath = {}, -- TODO
    TSMethod = { fg = colors.cyan },
    TSNamespace = { fg = colors.brown },
    TSNone = {}, -- TODO
    TSNote = {}, -- TODO
    TSNumber = { fg = colors.light_cyan },
    TSOperator = { fg = colors.cyan },
    TSParameter = { fg = colors.orange },
    TSParameterReference = { fg = colors.orange },
    TSProperty = { fg = colors.orange },
    TSPunctBracket = { fg = colors.cyan },
    TSPunctDelimiter = { fg = colors.cyan },
    TSPunctSpecial = { fg = colors.cyan },
    TSRepeat = { fg = colors.light_red },
    TSStrike = {}, -- TODO
    TSString = { fg = colors.string },
    TSStringEscape = { fg = colors.fg },
    TSStringRegex = { fg = colors.cyan },
    TSStringSpecial = {}, -- TODO
    TSStrong = {}, -- TODO
    TSSymbol = { fg = colors.brown },
    TSTag = { fg = colors.red },
    TSTagAttribute = {}, -- TODO
    TSTagDelimiter = { fg = colors.brown },
    TSText = { fg = colors.text },
    TSTextReference = { fg = colors.brown }, -- FIXME ???
    TSTitle = { fg = colors.orange, bg = colors.none, style = "bold" },
    TSType = { fg = colors.light_red },
    TSTypeBuiltin = { fg = colors.light_red },
    TSURI = { fg = colors.link },
    TSUnderline = { fg = colors.fg, bg = colors.none, style = "underline" },
    TSVariable = { fg = colors.white },
    TSVariableBuiltin = { fg = colors.white },
    TSWarning = { fg = colors.brown },
}

-- Lsp highlight groups
-- Type `:h lsp-highlight` for more informations
M.lsp = {
    LspCodeLens = {}, -- TODO
    LspDiagnosticsDefaultError = { fg = colors.error },
    LspDiagnosticsDefaultHint = { fg = colors.hint },
    LspDiagnosticsDefaultInformation = { fg = colors.orange },
    LspDiagnosticsDefaultWarning = { fg = colors.brown },
    LspDiagnosticsFloatingError = { fg = colors.error },
    LspDiagnosticsFloatingHint = { fg = colors.hint },
    LspDiagnosticsFloatingInformation = { fg = colors.orange },
    LspDiagnosticsFloatingWarning = { fg = colors.brown },
    LspDiagnosticsSignError = { fg = colors.error },
    LspDiagnosticsSignHint = { fg = colors.hint },
    LspDiagnosticsSignInformation = { fg = colors.orange },
    LspDiagnosticsSignWarning = { fg = colors.brown },
    LspDiagnosticsUnderlineError = { style = "undercurl", sp = colors.error },
    LspDiagnosticsUnderlineHint = { style = "undercurl", sp = colors.orange },
    LspDiagnosticsUnderlineInformation = {
        style = "undercurl",
        sp = colors.orange,
    },
    LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = colors.brown },
    LspDiagnosticsVirtualTextError = { fg = colors.error },
    LspDiagnosticsVirtualTextHint = { fg = colors.hint },
    LspDiagnosticsVirtualTextInformation = { fg = colors.orange },
    LspDiagnosticsVirtualTextWarning = { fg = colors.brown },
    LspReferenceRead = { fg = colors.accent, bg = colors.highlight },
    LspReferenceText = { fg = colors.accent, bg = colors.highlight },
    LspReferenceWrite = { fg = colors.accent, bg = colors.highlight },
}

-- Plugins highlight groups
M.plugins = {
    LspTrouble = {
        LspTroubleText = { fg = colors.text },
        LspTroubleCount = { fg = colors.light_red, bg = colors.bg_l },
        LspTroubleNormal = { fg = colors.fg, bg = colors.sidebar },
    },
    Diff = {
        diffAdded = { fg = colors.green },
        diffRemoved = { fg = colors.red },
        diffChanged = { fg = colors.brown },
        diffOldFile = { fg = colors.brown },
        diffNewFile = { fg = colors.light_cyan },
        diffFile = { fg = colors.cyan },
        diffLine = { fg = colors.green },
        diffIndexLine = { fg = colors.light_red },
    },

    Neogit = {
        NeogitBranch = { fg = colors.orange },
        NeogitRemote = { fg = colors.light_red },
        NeogitHunkHeader = { fg = colors.fg, bg = colors.highlight },
        NeogitHunkHeaderHighlight = { fg = colors.cyan, bg = colors.contrast },
        NeogitDiffContextHighlight = { fg = colors.text, bg = colors.contrast },
        NeogitDiffDeleteHighlight = { fg = colors.red },
        NeogitDiffAddHighlight = { fg = colors.green },
    },

    GitGutter = {
        GitGutterAdd = { fg = colors.green },
        GitGutterChange = { fg = colors.brown },
        GitGutterDelete = { fg = colors.red },
    },

    GitSigns = {
        GitSignsAdd = { fg = colors.green },
        GitSignsAddNr = { fg = colors.green },
        GitSignsAddLn = { fg = colors.green },
        GitSignsChange = { fg = colors.brown },
        GitSignsChangeNr = { fg = colors.brown },
        GitSignsChangeLn = { fg = colors.brown },
        GitSignsDelete = { fg = colors.red },
        GitSignsDeleteNr = { fg = colors.red },
        GitSignsDeleteLn = { fg = colors.red },
    },

    Telescope = {
        TelescopePromptBorder = { fg = colors.cyan },
        TelescopeResultsBorder = { fg = colors.light_red },
        TelescopePreviewBorder = { fg = colors.green },
        TelescopeSelectionCaret = { fg = colors.light_red },
        TelescopeSelection = { fg = colors.light_red },
        TelescopeMatching = { fg = colors.cyan },
        TelescopeNormal = { fg = colors.fg, bg = colors.float },
    },

    NvimTree = {
        NvimTreeNormal = { fg = colors.fg, bg = colors.sidebar },
        NvimTreeRootFolder = { fg = colors.cyan, style = "bold" },
        NvimTreeGitDirty = { fg = colors.brown },
        NvimTreeGitNew = { fg = colors.green },
        NvimTreeImageFile = { fg = colors.brown },
        NvimTreeExecFile = { fg = colors.green },
        NvimTreeSpecialFile = { fg = colors.light_red, style = "underline" },
        NvimTreeFolderName = { fg = colors.orange },
        NvimTreeEmptyFolderName = { fg = colors.fg },
        NvimTreeFolderIcon = { fg = colors.accent },
        NvimTreeIndentMarker = { fg = colors.fg },

        -- TODO not sure this goes here
        LspDiagnosticsError = { fg = colors.error },
        LspDiagnosticsWarning = { fg = colors.brown },
        LspDiagnosticsInformation = { fg = colors.orange },
        LspDiagnosticsHint = { fg = colors.hint },
    },

    WhichKey = {
        WhichKey = { fg = colors.accent, style = "bold" },
        WhichKeyGroup = { fg = colors.text },
        WhichKeyDesc = { fg = colors.cyan, style = "italic" },
        WhichKeySeperator = { fg = colors.fg },
        WhichKeyFloating = { bg = colors.float },
        WhichKeyFloat = { bg = colors.float },
    },

    LspSaga = {
        DiagnosticError = { fg = colors.error },
        DiagnosticWarning = { fg = colors.brown },
        DiagnosticInformation = { fg = colors.orange },
        DiagnosticHint = { fg = colors.hint },
        DiagnosticTruncateLine = { fg = colors.fg },
        LspFloatWinNormal = { bg = colors.bg },
        LspFloatWinBorder = { fg = colors.light_red },
        LspSagaBorderTitle = { fg = colors.cyan },
        LspSagaHoverBorder = { fg = colors.orange },
        LspSagaRenameBorder = { fg = colors.green },
        LspSagaDefPreviewBorder = { fg = colors.green },
        LspSagaCodeActionBorder = { fg = colors.cyan },
        LspSagaFinderSelection = { fg = colors.green },
        LspSagaCodeActionTitle = { fg = colors.orange },
        LspSagaCodeActionContent = { fg = colors.light_red },
        LspSagaSignatureHelpBorder = { fg = colors.purple },
        ReferencesCount = { fg = colors.light_red },
        DefinitionCount = { fg = colors.light_red },
        DefinitionIcon = { fg = colors.cyan },
        ReferencesIcon = { fg = colors.cyan },
        TargetWord = { fg = colors.cyan },
    },

    BufferLine = {
        BufferLineIndicatorSelected = { fg = colors.accent },
        BufferLineFill = { bg = colors.bg_l },
    },

    Noise = {
        NotifyERRORBorder = { fg = colors.red },
        NotifyWARNBorder = { fg = colors.orange },
        NotifyINFOBorder = { fg = colors.green },
    },

    Sneak = {
        Sneak = { fg = colors.bg, bg = colors.accent },
        SneakScope = { bg = colors.selection },
    },

    IndentBlankline = {
        IndentBlanklineChar = { fg = colors.indentline },
        IndentBlanklineContextChar = { fg = colors.indentline },
        IblIndent = { fg = colors.indentline },
        IblScope = { fg = colors.highlight },
    },

    NvimDap = {
        DapBreakpoint = { fg = colors.red },
        DapStopped = { fg = colors.green },
    },

    DashboardNvim = {
        DashboardCenter = { fg = colors.cyan },
        DashboardFooter = { fg = colors.green, style = "italic" },
        DashboardHeader = { fg = colors.red },
        DashboardShortCut = { fg = colors.cyan },
    },

    NvimDapUi = {
        DapUINormal = { M.editor.Normal },
        DapUIVariable = { M.editor.Normal },
        DapUIScope = { guifg = colors.cyan },
        DapUIType = { guifg = colors.purple },
        DapUIValue = { M.editor.Normal },
        DapUIModifiedValue = { guifg = colors.cyan, style = "bold" },
        DapUIDecoration = { guifg = colors.cyan },
        DapUIThread = { guifg = colors.green },
        DapUIStoppedThread = { guifg = colors.cyan },
        DapUIFrameName = { M.editor.Normal },
        DapUISource = { guifg = colors.purple },
        DapUILineNumber = { guifg = colors.cyan },
        DapUIFloatNormal = { M.editor.NormalFloat },
        DapUIFloatBorder = { guifg = colors.cyan },
        DapUIWatchesEmpty = { guifg = colors.red },
        DapUIWatchesValue = { guifg = colors.green },
        DapUIWatchesError = { guifg = colors.red },
        DapUIBreakpointsPath = { guifg = colors.cyan },
        DapUIBreakpointsInfo = { guifg = colors.green },
        DapUIBreakpointsCurrentLine = { guifg = colors.green, style = "bold" },
        DapUIBreakpointsLine = { M.editor.DapUILineNumber },
        DapUIBreakpointsDisabledLine = { guifg = colors.white },
        DapUICurrentFrameName = { guifg = colors.green, style = "bold" },
        DapUIStepOver = { guifg = colors.cyan },
        DapUIStepInto = { guifg = colors.cyan },
        DapUIStepBack = { guifg = colors.cyan },
        DapUIStepOut = { guifg = colors.cyan },
        DapUIStop = { guifg = #colors.red },
        DapUIPlayPause = { guifg = colors.green },
        DapUIRestart = { guifg = colors.green },
        DapUIUnavailable = { guifg = colors.white },
        DapUIWinSelect = { ctermfg = colors.cyan, guifg = colors.cyan, style = "bold" },
        DapUIEndofBuffer = { M.editor.EndofBuffer },
    },
}

-- Options:

if vim.g.seoul256_disable_background == true then
    M.editor.Normal = { fg = colors.fg, bg = colors.none }
    M.editor.SignColumn = { fg = colors.fg, bg = colors.none }
    M.editor.NormalFloat = { fg = colors.fg, bg = colors.none }
    M.editor.Pmenu = { fg = colors.text, bg = colors.none }
    M.plugins.Telescope.TelescopeNormal = { fg = colors.fg, bg = colors.none }
end

if vim.g.seoul256_italic_comments == true then
    M.syntax.Comment = { fg = colors.green, bg = colors.none, style = "italic" }
    M.treesitter.TSComment = { fg = colors.green, bg = colors.none, style = "italic" }
end

if vim.g.seoul256_italic_keywords == true then
    M.syntax.Conditional = { fg = colors.light_red, bg = colors.none, style = "italic" }
    M.syntax.Keyword = { fg = colors.light_red, bg = colors.none, style = "italic" }
    M.syntax.Repeat = { fg = colors.light_red, bg = colors.none, style = "italic" }
    M.treesitter.TSConditional = { fg = colors.light_red, style = "italic" }
    M.treesitter.TSKeyword = { fg = colors.light_red, style = "italic" }
    M.treesitter.TSRepeat = { fg = colors.light_red, style = "italic" }
    M.treesitter.TSKeywordFunction = { fg = colors.light_red, style = "italic" }
end

if vim.g.seoul256_italic_functions == true then
    M.syntax.Function = { fg = colors.cyan, bg = colors.none, style = "italic" }
    M.treesitter.TSFunction = { fg = colors.cyan, style = "italic" }
    M.treesitter.TSMethod = { fg = colors.cyan, style = "italic" }
    M.treesitter.TSFuncBuiltin = { fg = colors.cyan, style = "italic" }
end

if vim.g.seoul256_italic_variables == true then
    M.syntax.Identifier = { fg = colors.purple, bg = colors.none, style = "italic" }
    M.treesitter.TSVariable = { fg = colors.white, style = "italic" }
    M.treesitter.TSVariableBuiltin = { fg = colors.white, style = "italic" }
end

if vim.g.seoul256_borders == true then
    M.editor.VertSplit = { fg = colors.border }
end

if vim.g.seoul256_hl_current_line == false then
    M.editor.CursorLine = { fg = colors.none, bg = colors.none }
end

if vim.g.seoul256_italic_string == false then
    M.syntax.String = { fg = colors.string, bg = colors.none }
end

return M
