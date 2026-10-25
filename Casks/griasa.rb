cask "griasa" do
  version "1.0.21"
  sha256 "1d6911bcd1c0348e2852f666401af372fea98515ada1b8adbf1fde45a03493e6"

  url "https://github.com/Stari-am/griasa/releases/download/v#{version}/Griasa-#{version}.dmg"
  name "Griasa"
  desc "Local-first meeting memory: who promised what, briefs and dictation"
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
