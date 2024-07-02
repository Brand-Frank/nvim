-- https://github.com/mfussenegger/nvim-lint
-- require("lint").try_lint("cspell", "clangtidy", "cppcheck") -- windows11
-- require("lint").try_lint("clangtidy", "cppcheck") -- Ubuntu VM
require("lint").try_lint("cppcheck") -- armbian-cm311 //NOTE: need to install clang-tidy to invoke clangtidy. In view of the Disk-Space, I lost it.
