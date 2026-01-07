# Homebrew Cask formula for LuminaBar
# Place this file in your homebrew-tap repo at: Casks/luminabar.rb

cask "luminabar" do
  version "1.0.0"
  sha256 "REPLACE_WITH_SHA256_FROM_RELEASE"

  url "https://github.com/azs06/LuminaBar/releases/download/v#{version}/LuminaBar.dmg"
  name "LuminaBar"
  desc "Menu bar app to control Yeelight smart bulbs"
  homepage "https://github.com/azs06/LuminaBar"

  depends_on macos: ">= :sonoma"

  app "LuminaBar.app"

  zap trash: [
    "~/Library/Preferences/com.lumina.bar.plist",
    "~/Library/Caches/com.lumina.bar",
  ]
end
