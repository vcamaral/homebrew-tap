cask "netstatus" do
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/vcamaral/NetStatus/releases/download/v#{version}/NetStatus.dmg"
  name "NetStatus"
  desc "Menu bar dot that shows whether your internet is working"
  homepage "https://github.com/vcamaral/NetStatus"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "NetStatus.app"

  # Not notarized: spare the Gatekeeper "Open Anyway" step.
  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/NetStatus.app"],
                          writable_paths: ["{{appdir}}/NetStatus.app"]
  end

  uninstall quit: "com.vcamaral.netstatus"

  zap trash: [
    "~/Library/Logs/NetStatus-update.log",
    "~/Library/Preferences/com.vcamaral.netstatus.plist",
  ]
end
