cask "agentty" do
  version "0.2.4"
  sha256 "f6667f3ac01433adf9ae8d11f1ddef3281abcf88e54ec6bfe1ac908126425da7"

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
