cask "griasa" do
  version "1.0.27"
  sha256 "00296990046566be8c8a9a99f19bb190bd062b28ddcf5fde70de87fce81689ca"

  url "https://github.com/Stari-am/griasa/releases/download/v#{version}/Griasa-#{version}.dmg"
  name "Griasa"
  desc "Remembers what was promised in your meetings, on your Mac"
  homepage "https://stari-am.github.io/griasa/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  # The speech and AI engines Griasa would otherwise install with brew on first launch.
  depends_on formula: ["whisper.cpp", "llama.cpp"]

  app "Griasa.app"

  zap trash: [
    "~/Library/Application Support/Griasa",
    "~/Library/Preferences/am.stari.griasa.plist",
  ]
end
