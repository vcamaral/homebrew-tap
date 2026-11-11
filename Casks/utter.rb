cask "utter" do
  version "1.0.1"
  sha256 "87b920fa0c009b6b5f799d7f11c7d36694a405b8a48c447c79127704fd5c66e6"

  url "https://github.com/vcamaral/Utter/releases/download/v#{version}/Utter.dmg"
  name "Utter"
  desc "Local voice dictation with Whisper"
  homepage "https://github.com/vcamaral/Utter"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Utter.app"

  # Not notarized: spare the Gatekeeper "Open Anyway" step.
  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Utter.app"],
                          writable_paths: ["{{appdir}}/Utter.app"]
  end

  uninstall quit: "com.vcamaral.utter"

  zap trash: [
    "~/Library/Application Support/Utter",
    "~/Library/Logs/Utter-update.log",
    "~/Library/Preferences/com.vcamaral.utter.plist",
  ]
end
