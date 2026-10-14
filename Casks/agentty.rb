cask "agentty" do
  version "0.2.19"
  sha256 "4e2970efe67a925e090f3640162b7fdc40666d2b97bdaaee265ccca11d46c3ae"

  url "https://github.com/empty-user77/Agentty/releases/download/v#{version}/Agentty-#{version}-arm64.zip"
  name "Agentty"
  desc "Terminal for AI coding agents"
  homepage "https://www.agentty.run/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Agentty.app"

  # ~/.agentty is left alone on purpose: it holds the agents' git worktrees, which may contain unsaved work.
  zap trash: [
    "~/Library/Preferences/run.agentty.app.plist",
    "~/Library/Saved Application State/run.agentty.app.savedState",
  ]
end
