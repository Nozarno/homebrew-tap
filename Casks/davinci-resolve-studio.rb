cask "davinci-resolve-studio" do
  version "21.0.4"
  sha256 :no_check

  url "https://raw.githubusercontent.com/Nozarno/homebrew-tap/main/apps/davinci/studio.sh",
      verified: "raw.githubusercontent.com"
  name "DaVinci Resolve Studio"
  desc "Installateur CLI pour DaVinci Resolve Studio"
  homepage "https://www.blackmagicdesign.com/products/davinciresolve"

  installer script: {
    executable: "/bin/bash",
    args:       ["#{staged_path}/studio.sh"],
    sudo:       true,
  }

  uninstall delete: "/Applications/DaVinci Resolve"
end
