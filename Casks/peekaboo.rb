cask "peekaboo" do
  version "0.1.0"
  sha256 "036b7650e6e74262d70dcf987a90cd474a597a81ad593abb827be1f4e4e543db"

  url "https://github.com/vishvavariya/peekaboo-releases/releases/download/v#{version}/Peekaboo-#{version}.zip"
  name "Peekaboo"
  desc "Find, preview and clean up every file on your Mac"
  homepage "https://getpeekaboo.app/"

  livecheck do
    url "https://getpeekaboo.app/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Peekaboo.app"

  # Keep in sync with SelfUninstall.swift — the in-app "Uninstall Peekaboo…"
  # and `brew uninstall --zap peekaboo` must leave the same machine behind.
  # The plainly named Caches/Peekaboo and Logs/Peekaboo folders are left out:
  # the app only takes them when they carry its owner marker, and brew can't check.
  zap trash: [
    "~/Library/Application Scripts/app.getpeekaboo.Peekaboo",
    "~/Library/Application Support/app.getpeekaboo.Peekaboo",
    "~/Library/Application Support/Peekaboo",
    "~/Library/Caches/app.getpeekaboo.Peekaboo",
    "~/Library/Containers/app.getpeekaboo.Peekaboo",
    "~/Library/Cookies/app.getpeekaboo.Peekaboo.binarycookies",
    "~/Library/HTTPStorages/app.getpeekaboo.Peekaboo",
    "~/Library/HTTPStorages/app.getpeekaboo.Peekaboo.binarycookies",
    "~/Library/LaunchAgents/app.getpeekaboo.Peekaboo*.plist",
    "~/Library/Logs/app.getpeekaboo.Peekaboo",
    "~/Library/Preferences/ByHost/app.getpeekaboo.Peekaboo.*.plist",
    "~/Library/Preferences/app.getpeekaboo.Peekaboo.plist",
    "~/Library/Saved Application State/app.getpeekaboo.Peekaboo.savedState",
    "~/Library/WebKit/app.getpeekaboo.Peekaboo",
  ]
end
