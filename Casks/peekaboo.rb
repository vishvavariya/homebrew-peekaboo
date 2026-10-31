cask "peekaboo" do
  version "0.1.2"
  sha256 "144446d5d198bcd4c110176f88734966e1b8aa2611cabecebe8512400f398179"

  url "https://github.com/vishvavariya/peekaboo-releases/releases/download/v#{version}/Peekaboo-#{version}.zip"
  name "Peekaboo"
  desc "Find, preview and clean up every file"
  homepage "https://getpeekaboo.app/"

  livecheck do
    url "https://getpeekaboo.app/appcast.xml"
    strategy :sparkle, &:short_version
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
    "~/Library/Preferences/app.getpeekaboo.Peekaboo.plist",
    "~/Library/Preferences/ByHost/app.getpeekaboo.Peekaboo.*.plist",
    "~/Library/Saved Application State/app.getpeekaboo.Peekaboo.savedState",
    "~/Library/WebKit/app.getpeekaboo.Peekaboo",
  ]
end
