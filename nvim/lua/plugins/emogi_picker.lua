return {
  "WilsonOh/emoji_picker-nvim",
  config = function()
    require("emoji_picker").setup({
      window = {
        width = 25,
        height = 10,
      },
      emoji_list = {
        "✨🧨🎈🎉🎊🎋🎍🎏🎐🎀",
        "🎁🎖🏅🎯♥⛳🀄🃏",
        "😀😃😄😁😆😅😂🤣😊💀",
        "😉😌😍🥰😘😗😙😚😋😛",
        "🧐🤓😎🤩🥳😏😒😞😔🙏",
        "😣😖😫😩🥺😢😭😤😠😡",
        "🥶😱😨😰😥😓🤗🤔🤭🤫",
        "😬🙄😯😦😧😮😲🥱😴🤤",
        "🤢🤮🤧😷🤒🤕🤑🤠😈👿",
        "👋🤚✋🖖👌🤏✌️🤞🤟🤘",
      },
    })
  end,
}
