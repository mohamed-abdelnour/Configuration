local lush = require "lush"
local p = require "lush_theme/palette"
local styles = {
    bold = "bold",
    italic = "italic",
    none = "none",
    strike = "strikethrough",
    underline = "underline",
}

local theme = lush(function()
    return {
        -- Default groups
        ---- Base
        ColorColumn { bg = p.bg_hl_line },
        Comment { fg = p.fg_alt },
        Conceal { fg = p.blue },
        CursorLineNr { bg = p.bg_active },
        DiffAdd { bg = p.bg_diff_focus_added, fg = p.fg_diff_focus_added },
        DiffChange { bg = p.bg_diff_focus_changed, fg = p.fg_diff_focus_changed },
        DiffDelete { bg = p.bg_diff_focus_removed, fg = p.fg_diff_focus_removed },
        DiffText { bg = p.bg_diff_refine_changed, fg = p.fg_diff_refine_changed },
        Directory { fg = p.blue },
        EndOfBuffer { fg = p.bg_main },
        ErrorMsg { bg = p.red_intense_bg, fg = p.fg_main },
        Folded { bg = p.bg_alt, fg = p.fg_alt },
        IncSearch { bg = p.cyan_refine_bg, fg = p.cyan_refine_fg },
        LineNr { bg = p.bg_dim, fg = p.fg_alt },
        MatchParen { bg = p.bg_paren_match, fg = p.fg_main },
        MoreMsg { fg = p.cyan_alt_other },
        MsgSeparator { bg = p.bg_alt },
        NonText { fg = p.fg_alt },
        Normal { fg = p.fg_main },
        Pmenu { bg = p.bg_alt },
        PmenuSel { bg = p.cyan_subtle_bg },
        PmenuThumb { bg = p.fg_alt },
        Question { fg = p.cyan_alt_other },
        Search { bg = p.green_intense_bg, fg = p.fg_main },
        SpecialKey { fg = p.fg_escape_char_construct },
        StatusLine { bg = p.bg_active, fg = p.fg_active },
        StatusLineNC { bg = p.bg_inactive, fg = p.fg_inactive },
        Substitute { bg = p.yellow_refine_bg, fg = p.yellow_refine_fg },
        TabLine { bg = p.bg_alt, fg = p.fg_alt },
        TabLineFill {},
        TermCursor { bg = p.fg_main, fg = p.bg_main },
        Title { fg = p.cyan },
        VertSplit { fg = p.fg_window_divider_inner },
        Visual { bg = p.bg_region, fg = p.fg_main },
        WarningMsg { bg = p.yellow_intense_bg, fg = p.fg_main },
        Whitespace { bg = p.bg_whitespace, fg = p.fg_whitespace },
        ------ Extra
        HintMsg { bg = p.magenta_subtle_bg, fg = p.fg_dim },
        InfoMsg { bg = p.cyan_subtle_bg, fg = p.fg_dim },
        SuccessMsg { bg = p.green_intense_bg, fg = p.fg_main },
        ---- Linked
        Cursor { Normal },
        CursorColumn { ColorColumn },
        CursorIM { Normal },
        CursorLine { ColorColumn },
        FloatBorder { VertSplit },
        FoldColumn { LineNr },
        ModeMsg { Normal },
        MsgArea { Normal },
        NormalFloat { Normal },
        NormalNC { Normal },
        PmenuSbar { Pmenu },
        QuickFixLine { Search },
        SignColumn { LineNr },
        SpellBad { ErrorMsg },
        SpellCap { WarningMsg },
        SpellLocal { PmenuSel },
        SpellRare { HintMsg },
        TabLineSel { PmenuSel },
        TermCursorNC { TermCursor },
        VisualNOS { Visual },
        WildMenu { PmenuSel },
        lCursor { Normal },

        -- Standard groups
        ---- Base
        Bold { gui = styles.bold },
        Boolean { fg = p.magenta_alt },
        Character { fg = p.cyan_alt_other },
        Conditional { fg = p.magenta_alt_other },
        Constant { fg = p.blue_alt_other },
        Debug { fg = p.magenta_alt },
        Define { fg = p.red_alt_other },
        Error { fg = p.red },
        Exception { fg = p.yellow },
        Function { fg = p.magenta },
        Identifier { fg = p.cyan },
        Ignore { bg = p.bg_alt, fg = p.fg_alt },
        Include { fg = p.red_alt_other },
        Italic { gui = styles.italic },
        Keyword { fg = p.magenta_alt_other },
        Label { fg = p.red_alt_other },
        Macro { fg = p.magenta_alt },
        Number { fg = p.blue_alt_other },
        Operator { fg = p.magenta_alt_other },
        PreCondit { fg = p.red_alt_other },
        PreProc { fg = p.red_alt_other },
        Repeat { fg = p.magenta_alt },
        Special { fg = p.magenta_alt_other },
        SpecialChar { fg = p.magenta_alt_other },
        SpecialComment { fg = p.blue_alt_other },
        Statement { fg = p.magenta_alt_other },
        StorageClass { fg = p.cyan_alt_other },
        String { fg = p.blue_alt },
        Structure { fg = p.cyan_alt_other },
        Tag { fg = p.magenta_alt },
        Todo { fg = p.red_alt_other },
        Type { fg = p.cyan_alt_other },
        Typedef { fg = p.cyan_alt_other },
        Underlined { gui = styles.underline },
        ------ Extra
        Builtin { fg = p.magenta_alt },
        Hint { fg = p.magenta },
        Info { fg = p.cyan },
        Link { gui = styles.underline, fg = p.blue_alt_other },
        Warning { fg = p.yellow },
        ---- Linked
        Delimiter { Normal },
        Float { Number },

        -- Diagnostic
        DiagnosticError { Error },
        DiagnosticWarn { Warning },
        DiagnosticInfo { Info },
        DiagnosticHint { Hint },
        DiagnosticUnderlineError { Error },
        DiagnosticUnderlineWarn { Warning },
        DiagnosticUnderlineInfo { Info },
        DiagnosticUnderlineHint { Hint },
        DiagnosticVirtualTextError { ErrorMsg },
        DiagnosticVirtualTextWarn { WarningMsg },
        DiagnosticVirtualTextInfo { InfoMsg },
        DiagnosticVirtualTextHint { HintMsg },
        DiagnosticFloatingError { Error },
        DiagnosticFloatingWarn { Warning },
        DiagnosticFloatingInfo { Info },
        DiagnosticFloatingHint { Hint },
        DiagnosticSignError { ErrorMsg },
        DiagnosticSignWarn { WarningMsg },
        DiagnosticSignInfo { InfoMsg },
        DiagnosticSignHint { HintMsg },

        -- LSP
        LspCodeLens { fg = p.fg_alt },
        LspDiagnosticsDefaultError { Error },
        LspDiagnosticsDefaultHint { Hint },
        LspDiagnosticsDefaultInformation { Info },
        LspDiagnosticsDefaultWarning { Warning },
        LspDiagnosticsFloatingError { Error },
        LspDiagnosticsFloatingHint { Hint },
        LspDiagnosticsFloatingInformation { Info },
        LspDiagnosticsFloatingWarning { Warning },
        LspDiagnosticsSignError { ErrorMsg },
        LspDiagnosticsSignHint { HintMsg },
        LspDiagnosticsSignInformation { InfoMsg },
        LspDiagnosticsSignWarning { WarningMsg },
        LspDiagnosticsUnderlineError { Error },
        LspDiagnosticsUnderlineHint { Hint },
        LspDiagnosticsUnderlineInformation { Info },
        LspDiagnosticsUnderlineWarning { Warning },
        LspDiagnosticsVirtualTextError { ErrorMsg },
        LspDiagnosticsVirtualTextHint { HintMsg },
        LspDiagnosticsVirtualTextInformation { InfoMsg },
        LspDiagnosticsVirtualTextWarning { WarningMsg },
        LspReferenceRead { ColorColumn },
        LspReferenceText { ColorColumn },
        LspReferenceWrite { ColorColumn },

        -- Telescope
        TelescopeMatching { fg = p.blue_alt_other },

        -- Tree-sitter
        TSAnnotation { Label },
        TSAttribute { Label },
        TSBoolean { Boolean },
        TSCharacter { Character },
        TSComment { Comment },
        TSConditional { Conditional },
        TSConstBuiltin { Builtin },
        TSConstMacro { Macro },
        TSConstant { Constant },
        TSConstructor { Type },
        TSDanger { ErrorMsg },
        TSEmphasis { Special },
        TSEnvironment { Macro },
        TSEnvironmentName { Type },
        TSError { Error },
        TSException { Exception },
        TSField { Identifier },
        TSFloat { Float },
        TSFuncBuiltin { Builtin },
        TSFuncMacro { Label },
        TSFunction { Function },
        TSInclude { Include },
        TSKeyword { Keyword },
        TSKeywordFunction { Keyword },
        TSKeywordOperator { Operator },
        TSKeywordReturn { Keyword },
        TSLabel { Label },
        TSLiteral { String },
        TSMath { Special },
        TSMethod { Function },
        TSNamespace { Label },
        TSNone { NonText },
        TSNote { SpecialComment },
        TSNumber { Number },
        TSOperator { Operator },
        TSParameter { Identifier },
        TSParameterReference { Identifier },
        TSProperty { Identifier },
        TSPunctBracket { Normal },
        TSPunctDelimiter { Delimiter },
        TSPunctSpecial { Keyword },
        TSRepeat { Repeat },
        TSStrike { gui = styles.strike },
        TSString { String },
        TSStringEscape { Keyword },
        TSStringRegex { String },
        TSStringSpecial { SpecialChar },
        TSStrong { Bold },
        TSSymbol { Identifier },
        TSTag { Label },
        TSTagAttribute { Identifier },
        TSTagDelimiter { Delimiter },
        TSText { String },
        TSTextReference { Constant },
        TSTitle { fg = p.fg_special_cold },
        TSType { Type },
        TSTypeBuiltin { Builtin },
        TSURI { Link },
        TSUnderline { Underlined },
        TSVariable { Normal },
        TSVariableBuiltin { Builtin },
        TSWarning { Warning },

        -- health
        healthSuccess { SuccessMsg },
        healthWarning { WarningMsg },
        healthError { ErrorMsg },
        healthHelp { Info },
        healthBar {},

        -- markdown
        markdownCode { bg = p.bg_alt, fg = p.fg_special_calm },
        markdownCodeBlock { bg = p.bg_dim },
        markdownH1 { fg = p.fg_main },
        markdownH2 { fg = p.fg_special_warm },
        markdownH3 { fg = p.fg_special_cold },
        markdownH4 { fg = p.fg_special_mild },
        markdownH5 { fg = p.fg_special_calm },
        markdownH6 { fg = p.yellow_nuanced_fg },
        markdownHeadingDelimiter { fg = p.fg_dim },
        markdownLinkText { Link },

        -- nvim-ts-rainbow
        rainbowcol1 { Normal },
        rainbowcol2 { fg = p.magenta_intense },
        rainbowcol3 { fg = p.cyan_intense },
        rainbowcol4 { fg = p.orange_intense },
        rainbowcol5 { fg = p.purple_intense },
        rainbowcol6 { fg = p.red_intense },
        rainbowcol7 { fg = p.blue_intense },

        -- Miscellaneous
        NvimInternalError { ErrorMsg },
        RedrawDebugClear { WarningMsg },
        RedrawDebugComposed { SuccessMsg },
        RedrawDebugNormal { bg = p.fg_alt, fg = p.bg_main },
        RedrawDebugRecompose { ErrorMsg },
    }
end)

return theme
