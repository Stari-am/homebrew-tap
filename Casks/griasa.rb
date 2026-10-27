cask "griasa" do
  version "1.0.22"
  sha256 "83b7ea641d866a86068fa77cc4f77f65e33faf5b5164b4dfcac01fc6530b4429"

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
