-- mod-version:4
local syntax = require "core.syntax"

local rgc_symbols = {
  ["if"]        = "keyword",
  ["elif"]      = "keyword",
  ["else"]      = "keyword",
  ["for"]       = "keyword",
  ["in"]        = "keyword",
  ["while"]     = "keyword",
  ["match"]     = "keyword",
  ["case"]      = "keyword",
  ["def"]       = "keyword",
  ["class"]     = "keyword",
  ["enum"]      = "keyword",
  ["interface"] = "keyword",
  ["import"]    = "keyword",
  ["and"]       = "keyword",
  ["or"]        = "keyword",
  ["not"]       = "keyword",
  ["return"]   = "keyword",
  ["break"]     = "keyword",
  ["continue"] = "keyword",
  ["pass"]      = "keyword",
  ["var"]       = "keyword",

  ["int"]   = "keyword2",
  ["float"] = "keyword2",
  ["bool"]  = "keyword2",
  ["str"]   = "keyword2",
  ["self"]  = "keyword2",

  ["True"]  = "literal",
  ["False"] = "literal",
  ["None"]  = "literal",
}

syntax.add {
  name = "RGC",
  files = { "%.rg$" },
  comment = "#",
  block_comment = { "/*", "*/" },

  patterns = {
    { pattern = "#.*",                       type = "comment" },
    { pattern = { "/%*", "%*/" },              type = "comment" },

    { pattern = { '"', '"', '\\' },             type = "string"  },

    { pattern = "0[xX][%da-fA-F_]+",            type = "number" },
    { pattern = "0[bB][01_]+",                  type = "number" },
    { pattern = "0[oO][0-7_]+",                  type = "number" },
    { pattern = "%d+[%d%.eE_]*",                type = "number" },
    { pattern = "%.?%d+",                       type = "number" },

    { pattern = "@[%a_][%w_]*",                 type = "keyword2" },

    { pattern = "[%+%-=/%*%^%%<>!~|&]",         type = "operator" },

    { pattern = "[%a_][%w_]*%f[(]",             type = "function" },
    { pattern = "[%a_][%w_]+",                  type = "symbol" },
  },

  symbols = rgc_symbols,
}