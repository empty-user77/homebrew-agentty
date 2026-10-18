cask "agentty" do
  version "0.2.21"
  sha256 "a86f90117a5ccf1b7c05744956d531f778af47228b38e0c0c9a208cd55e5c830"

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
