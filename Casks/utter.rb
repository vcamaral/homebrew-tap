cask "utter" do
  version "1.0.0"
  sha256 "ecceddffd933fc8d1e9723febeb85ca180626e805db2bc9d09b87462099085db"

  url "https://github.com/vcamaral/utter/releases/download/v#{version}/Utter.dmg"
  name "Utter"
  desc "Local voice dictation with Whisper"
  homepage "https://github.com/vcamaral/utter"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Utter.app"

  # Not notarized: spare the Gatekeeper "Open Anyway" step.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Utter.app"],
                          writable_paths: ["{{appdir}}/Utter.app"]
  end

  uninstall quit: "com.vcamaral.utter"

  zap trash: [
    "~/Library/Application Support/Utter",
    "~/Library/Logs/Utter-update.log",
    "~/Library/Preferences/com.vcamaral.utter.plist",
  ]
end
