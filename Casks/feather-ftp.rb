# Homebrew cask for Feather FTP — rendered by scripts/brew-cask.sh from a
# published GitHub release (never hand-edit the version / sha256 lines).
#
# Tap: brew install --cask raduzoom/feather-ftp/feather-ftp
# The app is closed source; downloads live in the public releases-only repo.
cask "feather-ftp" do
  arch arm: "aarch64", intel: "x64"

  version "2.0.0"
  sha256 arm:   "83d8c6a7bd54e0efd433f951dddd22e32863fc9f8ffdc5b12b501b8a85b84b02",
         intel: "503bcbfb6a9dd663902a578be4d599ee9490754210f8444a1cbad90c86837bed"

  url "https://github.com/raduzoom/feather-ftp-releases/releases/download/v#{version}/FeatherFTP-#{version}-#{arch}.dmg",
      verified: "github.com/raduzoom/feather-ftp-releases/"
  name "Feather FTP"
  desc "Calmer FTP, FTPS and SFTP client with keychain credentials and a recoverable transfer queue"
  homepage "https://github.com/raduzoom/feather-ftp-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Signed + notarized Developer ID build; the Mac App Store .pkg is separate.
  # No `depends_on macos:`: the app supports 10.15, older than any macOS
  # Homebrew still runs on, and Homebrew 7 rejects `:catalina`.

  app "Feather FTP.app"

  # The app is sandboxed, so its data (sites, known hosts, prefs, bookmarks)
  # lives in the container; the other paths cover unsandboxed dev builds.
  zap trash: [
    "~/Library/Containers/com.featherftp.app",
    "~/Library/Application Support/com.featherftp.app",
    "~/Library/Caches/com.featherftp.app",
    "~/Library/Preferences/com.featherftp.app.plist",
    "~/Library/Saved Application State/com.featherftp.app.savedState",
    "~/Library/WebKit/com.featherftp.app",
  ]
end
