cask "griasa" do
  version "1.0.25"
  sha256 "578dbf6cee8ad7701ffdf386c30f90d592728739763f823052595c367c790f21"

  url "https://github.com/Stari-am/griasa/releases/download/v#{version}/Griasa-#{version}.dmg"
  name "Griasa"
  desc "Local-first meeting memory: who promised what, briefs and dictation"
  homepage "https://stari-am.github.io/griasa/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  # The speech and AI engines Griasa would otherwise install with brew on first launch.
  depends_on formula: ["whisper.cpp", "llama.cpp"]

  app "Griasa.app"

  zap trash: [
    "~/Library/Application Support/Griasa",
    "~/Library/Preferences/am.stari.griasa.plist",
  ]
end
