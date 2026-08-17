cask "openharness" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0-beta.3"
  sha256 arm:   "042d045ae247c1db4d305a7f16631217d9a7a6420c856db8a56217c8a6899c5f",
         intel: "4446a436a7a7c8381eba6b5a32c7ff2c0e62156b400baaead43a8cff1b266abc"

  url "https://github.com/MicroSpotlight/OpenHarness/releases/download/v#{version}/OpenHarness_#{version.split("-").first}_#{arch}.dmg",
      verified: "github.com/MicroSpotlight/OpenHarness/"
  name "OpenHarness"
  desc "Native desktop app for the DeepSeek Harness AI agent runtime"
  homepage "https://openharness.microspotlight.team/"

  livecheck do
    url "https://github.com/MicroSpotlight/OpenHarness/releases.atom"
    regex(%r{releases/tag/v?(\d+(?:\.\d+)+(?:-[^"'/<]+)?)["'<]}i)
    strategy :page_match
  end

  auto_updates true
  depends_on macos: :sequoia

  app "OpenHarness.app"

  zap trash: [
    "~/Library/Application Support/team.MicroSpotlight.OpenHarness",
    "~/Library/Caches/team.MicroSpotlight.OpenHarness",
    "~/Library/Logs/team.MicroSpotlight.OpenHarness",
    "~/Library/Preferences/team.MicroSpotlight.OpenHarness.plist",
    "~/Library/Saved Application State/team.MicroSpotlight.OpenHarness.savedState",
    "~/Library/WebKit/team.MicroSpotlight.OpenHarness",
  ]
end
