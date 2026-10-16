cask "notchhider" do
  version "1.0.1"
  sha256 "c533f094f664ed4dc0ccc2aa2fe5be8a359cbe5cc682f2b87c125ba8ecd128e4"

  url "https://github.com/vcamaral/NotchHider/releases/download/v#{version}/NotchHider.dmg"
  name "NotchHider"
  desc "Hides the notch by painting a black band on the wallpaper"
  homepage "https://github.com/vcamaral/NotchHider"

  depends_on macos: :ventura

  app "NotchHider.app"

  # Not notarized: spare the Gatekeeper "Open Anyway" step.
  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/NotchHider.app"],
                          writable_paths: ["{{appdir}}/NotchHider.app"]
  end

  # Quitting restores the original wallpaper.
  uninstall quit: "br.com.vcamaral.NotchHider"

  zap trash: [
    "~/Library/Application Support/NotchHider",
    "~/Library/Preferences/br.com.vcamaral.NotchHider.plist",
  ]
end
