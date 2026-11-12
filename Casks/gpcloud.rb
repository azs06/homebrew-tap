cask "gpcloud" do
  version "1.0.0"
  sha256 "121b0c5f471fbc93a45f739e454222cfa5eccb391688d04d98a28125f9f9832b"

  url "https://github.com/azs06/gpcloud-mac/releases/download/v#{version}/GPCloud-#{version}-macOS.zip"
  name "GP Cloud for Mac"
  desc "Unofficial client for Grameenphone GP Cloud storage"
  homepage "https://github.com/azs06/gpcloud-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "GPCloud.app"

  # The app is ad-hoc signed, not notarized; clear the download quarantine so it opens normally.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/GPCloud.app"],
                   sudo: false
  end

  uninstall quit: "io.github.azs06.gpcloud-mac"

  zap trash: [
    "~/Library/Caches/GPCloud",
    "~/Library/Caches/io.github.azs06.gpcloud-mac",
    "~/Library/HTTPStorages/io.github.azs06.gpcloud-mac",
    "~/Library/Preferences/io.github.azs06.gpcloud-mac.plist",
    "~/Library/WebKit/io.github.azs06.gpcloud-mac",
  ]
end
