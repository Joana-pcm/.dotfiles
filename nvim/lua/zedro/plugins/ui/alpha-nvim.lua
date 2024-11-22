-- Alpha (dashboard) for neovim

local options

-- For random header
math.randomseed(os.time())
-- Create button for initial keybind.
--- @param sc string
--- @param txt string
--- @param hl string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, hl, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position       = "center",
    shortcut       = sc,
    cursor         = 5,
    width          = 33,
    align_shortcut = "right",
    hl_shortcut    = hl,
  }

  if keybind then
    keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(sc_ .. '<Ignore>', true, false, true)
    vim.api.nvim_feedkeys(key, "normal", false)
  end

  return {
    type     = "button",
    val      = txt,
    on_press = on_press,
    opts     = opts,
  }
end

-- All custom headers
Headers = {
  {
    [[      ⣿⣿⣿⡟⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠙⣿⣿⣿⣿                ]],
    [[      ⣿⣿⣿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⢿⣿⣿                ]],
    [[      ⣿⣿⡇⠄⠄⠄⠄⠄⠄⢀⣀⣀⣤⣶⣦⣤⣤⣤⣤⣄⣄⠄⠸⣿⣿                ]],
    [[      ⣿⣿⠁⠄⠄⢀⣠⣾⣿⣿⣥⣤⣶⣶⡖⢻⣿⣿⡥⣤⣤⣉⣦⢹⣿   NEOVIM       ]],
    [[      ⣿⣿⡆⠄⠄⣿⣿⣿⣿⣿⣿⢽⠉⠙⣻⣿⣿⣿⣶⢟⠛⢻⡇⢸⣿   IS           ]],
    [[      ⣿⣿⣿⠄⠄⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣷⣾⣿⡈⣿   A            ]],
    [[      ⣿⣿⣿⣷⣸⣿⣿⠸⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣄⠙⣿⣿⣿⠇⣿   blessing     ]],
    [[      ⠉⠉⠉⠉⠁⣿⣿⣆⠹⣿⣿⣿⣿⣿⣄⣹⣏⣿⡋⣸⣿⣿⠟⣰⣿                ]],
    [[      ⠄⠄⠄⠄⠄⣿⣿⣿⣷⣌⠛⢿⣿⣏⣉⠛⠛⠛⠛⢻⣿⡇⣾⣿⣿                ]],
    [[      ⠄⠄⠄⠄⢸⣿⣿⣯⣿⣿⣷⣄⠙⢿⣿⣿⣿⣷⣦⡀⠙⡴⢟⣿⣿                ]],
    [[      ⠄⠄⠄⢠⣿⣿⣟⣯⣿⣿⣿⣿⣿⣶⣤⣉⣉⠉⠉⠰⣷⣼⣿⣿⣿                ]],
    [[                                               ]],
  },
  {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
  },

  {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  },
  {
    [[116 145 157 166 151 155]],
  },
  {
    [[78 101 111 118 105 109]],
  },
  {
    [[01001110 01100101 01101111 01110110 01101001 01101101]],
  },
  {
    [[ 4E 65 6F 76 69 6D ]],
  },
  {
    [[)]],
    [[ ( /(]],
    [[ )\())   (        )   (      )]],
    [[((_)\   ))\  (   /((  )\    (]],
    [[ _((_) /((_) )\ (_))\((_)   )\  ']],
    [[| \| |(_))  ((_)_)((_)(_) _((_))]],
    [[| .` |/ -_)/ _ \\ V / | || '  \()]],
    [[|_|\_|\___|\___/ \_/  |_||_|_|_|]],
    [[	]],
  },
  {
    [[ @@@  @@@  @@@@@@@@   @@@@@@   @@@  @@@  @@@  @@@@@@@@@@]],
    [[ @@@@ @@@  @@@@@@@@  @@@@@@@@  @@@  @@@  @@@  @@@@@@@@@@@]],
    [[ @@!@!@@@  @@!       @@!  @@@  @@!  @@@  @@!  @@! @@! @@!]],
    [[ !@!!@!@!  !@!       !@!  @!@  !@!  @!@  !@!  !@! !@! !@!]],
    [[ @!@ !!@!  @!!!:!    @!@  !@!  @!@  !@!  !!@  @!! !!@ @!@]],
    [[ !@!  !!!  !!!!!:    !@!  !!!  !@!  !!!  !!!  !@!   ! !@!]],
    [[ !!:  !!!  !!:       !!:  !!!  :!:  !!:  !!:  !!:     !!:]],
    [[ :!:  !:!  :!:       :!:  !:!   ::!!:!   :!:  :!:     :!:]],
    [[  ::   ::   :: ::::  ::::: ::    ::::     ::  :::     ::]],
    [[ ::    :   : :: ::    : :  :      :      :     :      :]],
  },
  {
    [[    <-. (`-')_  (`-')  _                 (`-')  _     <-. (`-')]],
    [[       \( OO) ) ( OO).-/     .->        _(OO ) (_)       \(OO )_]],
    [[    ,--./ ,--/ (,------.(`-')----. ,--.(_/,-.\ ,-(`-'),--./  ,-.)]],
    [[    |   \ |  |  |  .---'( OO).-.  '\   \ / (_/ | ( OO)|   `.'   |]],
    [[    |  . '|  |)(|  '--. ( _) | |  | \   /   /  |  |  )|  |'.'|  |]],
    [[    |  |\    |  |  .--'  \|  |)|  |_ \     /_)(|  |_/ |  |   |  |]],
    [[    |  | \   |  |  `---.  '  '-'  '\-'\   /    |  |'->|  |   |  |]],
    [[    `--'  `--'  `------'   `-----'     `-'     `--'   `--'   `--']],
    [[    -. . --- ...- .. --]],
  },
  {
    [[_   _   U _____ u U  ___ u__     __             __  __]],
    [[     | \ |"|  \| ___"|/  \/"_ \/\ \   /"/u  ___     U|' \/ '|u]],
    [[    <|  \| |>  |  _|"    | | | | \ \ / //  |_"_|    \| |\/| |/]],
    [[    U| |\  |u  | |___.-,_| |_| | /\ V /_,-. | |      | |  | |]],
    [[     |_| \_|   |_____|\_)-\___/ U  \_/-(_/U/| |\u    |_|  |_|]],
    [[     ||   \\,-.<<   >>     \\     //   .-,_|___|_,-.<<,-,,-.]],
    [[     (_")  (_/(__) (__)   (__)   (__)   \_)-' '-(_/  (./  \.)]],
  },
  {
    [[     .-') _   ('-.                     (`-.           _   .-')]],
    [[    ( OO ) )_(  OO)                  _(OO  )_        ( '.( OO )_]],
    [[,--./ ,--,'(,------. .-'),-----. ,--(_/   ,. \ ,-.-') ,--.   ,--.)]],
    [[|   \ |  |\ |  .---'( OO'  .-.  '\   \   /(__/ |  |OO)|   `.'   |]],
    [[|    \|  | )|  |    /   |  | |  | \   \ /   /  |  |  \|         |]],
    [[|  .     |/(|  '--. \_) |  |\|  |  \   '   /,  |  |(_/|  |'.'|  |]],
    [[|  |\    |  |  .--'   \ |  | |  |   \     /__),|  |_.'|  |   |  |]],
    [[|  | \   |  |  `---.   `'  '-'  '    \   /   (_|  |   |  |   |  |]],
    [[`--'  `--'  `------'     `-----'      `-'      `--'   `--'   `--']],
  },
  {
    [[ ░   ░░░  ░        ░░      ░░  ░░░░  ░        ░  ░░░░  ░]],
    [[ ▒    ▒▒  ▒  ▒▒▒▒▒▒▒  ▒▒▒▒  ▒  ▒▒▒▒  ▒▒▒▒  ▒▒▒▒   ▒▒   ▒]],
    [[ ▓  ▓  ▓  ▓      ▓▓▓  ▓▓▓▓  ▓▓  ▓▓  ▓▓▓▓▓  ▓▓▓▓        ▓]],
    [[ █  ██    █  ███████  ████  ███    ██████  ████  █  █  █]],
    [[ █  ███   █        ██      █████  ████        █  ████  █]],
  },
  {
    [[    _   __                _]],
    [[   / | / /__  ____ _   __(_)___ ___]],
    [[  /  |/ / _ \/ __ \ | / / / __ `__ \]],
    [[ / /|  /  __/ /_/ / |/ / / / / / / /]],
    [[/_/ |_/\___/\____/|___/_/_/ /_/ /_/]],
  },
  {
    [[  _  _                              _]],
    [[ | \| |    ___     ___    __ __    (_)    _ __]],
    [[ | .` |   / -_)   / _ \   \ V /    | |   | '  \]],
    [[ |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_|]],
    [[_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|]],
    [["`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-']],
  },
  {
    [[     .-. .-.,---.   .---..-.   .-.,-.]],
    [[ |  \| || .-'  / .-. )\ \ / / |(||\    /|]],
    [[ |   | || `-.  | | |(_)\ V /  (_)|(\  / |]],
    [[ | |\  || .-'  | | | |  ) /   | |(_)\/  |]],
    [[ | | |)||  `--.\ `-' / (_)    | || \  / |]],
    [[ /(  (_)/( __.' )---'         `-'| |\/| |]],
    [[(__)   (__)    (_)               '-'  '-']],
  },
  {
    [[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓]],
    [[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
    [[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░]],
    [[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██]],
    [[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒]],
    [[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░]],
    [[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░]],
    [[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░]],
    [[          ░    ░  ░    ░ ░        ░   ░         ░]],
    [[                                 ░]],
  },
  {
    [[     ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.]],
    [[•█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪]],
    [[▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·]],
    [[██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌]],
    [[▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀]],
  },
  {
    [[  _  _]],
    [[ | \| |_  _    ()  _ _]],
    [[ | \\ /o\/o\\V7|||/ \ \]],
    [[ |_|\_\( \_/ V L|L_n_n|]],
  },
  {
    [[                              <~)_    ;. ,-==.]],
    [[                 ||  .-.   ( v~\ ; |  (  (\]],
    [[        ....     || _|_ \   \_/' `.|   |\.\\]],
    [[^^^^^^^ `=.`''===.' (_)     /\     |  _]_]`\\]],

  },
  {
    [[_____   __                 _____]],
    [[___  | / /_____________   ____(_)______ ___]],
    [[__   |/ /_  _ \  __ \_ | / /_  /__  __ `__ \]],
    [[_  /|  / /  __/ /_/ /_ |/ /_  / _  / / / / /]],
    [[/_/ |_/  \___/\____/_____/ /_/  /_/ /_/ /_/]],
  },
  {
    [[ ____ ____ ____ ____ ____ ____]],
    [[||N |||e |||o |||v |||i |||m ||]],
    [[||__|||__|||__|||__|||__|||__||]],
    [[|/__\|/__\|/__\|/__\|/__\|/__\|]],
  },
  {
    [[   \  |                     _)]],
    [[    \ |   _ \   _ \ \ \   /  |  __ `__ \]],
    [[  |\  |   __/  (   | \ \ /   |  |   |   |]],
    [[ _| \_| \___| \___/   \_/   _| _|  _|  _|]],
  },
  {
    [[ :::= === :::===== :::====  :::  === ::: :::=======]],
    [[ :::===== :::      :::  === :::  === ::: ::: === ===]],
    [[ ======== ======   ===  === ===  === === === === ===]],
    [[ === ==== ===      ===  ===  ======  === ===     ===]],
    [[ ===  === ========  ======     ==    === ===     ===]],
  },
  {
    [[#   # #####  ###  ####  #   # #   #]],
    [[#   # #     #   # #   # #  ## ## ##]],
    [[##### ####  #   # ####  # # # # # #]],
    [[#   # #     #   # #   # ##  # #   #]],
    [[#   # #####  ###  ####  #   # #   #]],
  },
  {
    [[{___     {__]],
    [[{_ {__   {__                                {_]],
    [[{__ {__  {__   {__       {__    {__     {__   {___ {__ {__]],
    [[{__  {__ {__ {_   {__  {__  {__  {__   {__ {__ {__  {_  {__]],
    [[{__   {_ {__{_____ {__{__    {__  {__ {__  {__ {__  {_  {__]],
    [[{__    {_ __{_         {__  {__    {_{__   {__ {__  {_  {__]],
    [[{__      {__  {____      {__        {__    {__{___  {_  {__]],
  },
  {
    [[ __  __  ____   ___   __ __ __ ___  ___]],
    [[ ||\ || ||     // \\  || || || ||\\//||]],
    [[ ||\\|| ||==  ((   )) \\ // || || \/ ||]],
    [[ || \|| ||___  \\_//   \V/  || ||    ||]],
  },
  {
    [[_  _ ____ ____ _  _ _ _  _]],
    [[|\ | |___ |  | |  | | |\/|]],
    [[| \| |___ |__|  \/  | |  |]],
  },
  {
    [[::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    ::::]],
    [[:+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+]],
    [[:+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+]],
    [[+#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+]],
    [[+#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+]],
    [[#+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#]],
    [[###    #### ########## ########      ###     ########### ###       ###]],
  },
  {
    [[ _|      _|                                  _|]],
    [[ _|_|    _|    _|_|      _|_|    _|      _|      _|_|_|  _|_|]],
    [[ _|  _|  _|  _|_|_|_|  _|    _|  _|      _|  _|  _|    _|    _|]],
    [[ _|    _|_|  _|        _|    _|    _|  _|    _|  _|    _|    _|]],
    [[ _|      _|    _|_|_|    _|_|        _|      _|  _|    _|    _|]],
  },
  {
    [[8b    |                              ,e,]],
    [[|y88b   |  e88~~8e   e88~-_  y88b    /  "  888-~88e-~88e]],
    [[| y88b  | d888  88b d888   i  y88b  /  888 888  888  888]],
    [[|  y88b | 8888__888 8888   |   y88b/   888 888  888  888]],
    [[|   y88b| y888    , y888   '    y8/    888 888  888  888]],
    [[|    y888  "88___/   "88_-~      y     888 888  888  888]],
  },
  {
    [[@@@@@@@@:@@@@@@:@@@@@@@@:@@@::::@@@:@@@:@@@@::::@@@@:]],
    [[%%%--%%%-%%%----%%%--%%%-%%%----%%%-%%%-%%%%%--%%%%%-]],
    [[&&&++&&&+&&&&&++&&&++&&&+&&&++++&&&+&&&+&&&&&&&&&&&&+]],
    [[|||**|||*|||||**|||**|||**|||**|||**|||*|||*||||*|||*]],
    [[!!!==!!!=!!!====!!!==!!!===!!!!!!===!!!=!!!==!!==!!!=]],
    [[:::##:::#::::::#::::::::####::::####:::#:::######:::#]],
    [[...@@...@......@@......@@@@@@..@@@@@...@...@@@@@@...@]],
  },
  {
    [[    dMMMMb  dMMMMMP .aMMMb  dMP dMP dMP dMMMMMMMMb]],
    [[   dMP dMP dMP     dMP"dMP dMP dMP amr dMP"dMP"dMP]],
    [[  dMP dMP dMMMP   dMP dMP dMP dMP dMP dMP dMP dMP]],
    [[ dMP dMP dMP     dMP.aMP  YMvAP" dMP dMP dMP dMP]],
    [[dMP dMP dMMMMMP  VMMMP"    VP"  dMP dMP dMP dMP]],
  },
  {
    [[888b    888                            d8b]],
    [[8888b   888                            Y8P]],
    [[88888b  888]],
    [[888Y88b 888  .d88b.   .d88b.  888  888 888 88888b.d88b.]],
    [[888 Y88b888 d8P  Y8b d88""88b 888  888 888 888 "888 "88b]],
    [[888  Y88888 88888888 888  888 Y88  88P 888 888  888  888]],
    [[888   Y8888 Y8b.     Y88..88P  Y8bd8P  888 888  888  888]],
    [[888    Y888  "Y8888   "Y88P"    Y88P   888 888  888  888]],
  },
  {
    [['##::: ##:'########::'#######::'##::::'##:'####:'##::::'##:]],
    [[ ###:: ##: ##.....::'##.... ##: ##:::: ##:. ##:: ###::'###:]],
    [[ ####: ##: ##::::::: ##:::: ##: ##:::: ##:: ##:: ####'####:]],
    [[ ## ## ##: ######::: ##:::: ##: ##:::: ##:: ##:: ## ### ##:]],
    [[ ##. ####: ##...:::: ##:::: ##:. ##:: ##::: ##:: ##. #: ##:]],
    [[ ##:. ###: ##::::::: ##:::: ##::. ## ##:::: ##:: ##:.:: ##:]],
    [[ ##::. ##: ########:. #######::::. ###::::'####: ##:::: ##:]],
    [[..::::..::........:::.......::::::...:::::....::..:::::..::]],
  }
}

--
-- Sections for Alpha.
--

local header = {
  type = "text",
  val = Headers[math.random(#Headers)],
  -- val = Headers[3],
  opts = {
    position = "center",
    hl       = "Character",
  }
}

-- Get Neovim version
local get_neovim_version = function()
  local v = vim.version()
  return "v" .. v.major .. "." .. v.minor .. "." .. v.patch
end

local footer = {
  type = "text",
  -- Change 'rdn' to any program that gives you a random quote.
  -- https://github.com/BeyondMagic/scripts/blob/master/quotes/rdn
  -- Which returns one to three lines, being each divided by a line break.
  -- Or just an array: { "I see you:", "Above you." }
  val  = {
    "",
    "",
    "Neovim " .. get_neovim_version(),
    "󰟪'ed by Joana",
  },
  opts = {
    position = "center",
    hl       = "SpellCap",
  }
}


---@diagnostic disable: missing-parameter
local buttons = {
  type = "group",
  val = {
    button("n", "  New file", 'Macro', ':ene <BAR> startinsert <CR>'),
    button("f", "  Find file", 'Macro', ':Telescope find_files <CR>'),
    button("F", "  Find text", 'Macro', ':Telescope live_grep <CR>'),
    button("-", "󰼙  Get Oil", 'Macro', ':Oil --float<CR>'),
    button("r", "󱣱  Get Ranger", 'Macro', ':Ranger<CR>'),
    button("l", "  Get Lazy", 'Macro', ':Lazy<CR>'),
    button("m", "  Get Mason", 'Macro', ':Mason<CR>'),
    button("h", "󰞋  Get Help", 'Macro', ':vertical help<CR>'),
    button("o", "  Get Options", 'Macro', ':vertical options<CR>'),
    button("q", "󰩈  Quit", 'Macro', ':qa<CR>'),
  },
  opts = {
    spacing = 1,
  }
}
---@diagnostic enable: missing-parameter

--
-- Centering handler of ALPHA
--

local ol = {                              -- occupied lines
  icon            = #header.val,          -- CONST: number of lines that your header will occupy
  message         = #footer.val,          -- CONST: because of padding at the bottom
  length_buttons  = #buttons.val * 2 - 1, -- CONST: it calculate the number that buttons will occupy
  neovim_lines    = 2,                    -- CONST: 2 of command line, 1 of the top bar
  padding_between = 5,                    -- STATIC: can be set to anything, padding between keybinds and header
}

local left_terminal_value = vim.api.nvim_get_option('lines') -
    (ol.length_buttons + ol.message + ol.padding_between + ol.icon + ol.neovim_lines)

-- Not screen enough to run the command.
if (left_terminal_value >= 0) then
  local top_padding    = math.floor(left_terminal_value / 2)
  local bottom_padding = left_terminal_value - top_padding

  --
  -- Set alpha sections
  --

  options              = {
    layout = {
      { type = "padding", val = top_padding },
      header,
      { type = "padding", val = ol.padding_between },
      buttons,
      footer,
      { type = "padding", val = bottom_padding },
    },
    opts = {
      margin = 5
    },
  }
end

return {
  "goolord/alpha-nvim",
  dependencies = 'kyazdani42/nvim-web-devicons',
  config = function()
    if (options ~= nil) then
      require("alpha").setup(options)
    end
  end
}