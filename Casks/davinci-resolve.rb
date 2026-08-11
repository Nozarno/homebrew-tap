cask "davinci-resolve" do
  version "21.0.4"
  sha256 :no_check

  url "https://raw.githubusercontent.com/Nozarno/homebrew-tap/main/apps/davinci/free.sh",
      verified: "raw.githubusercontent.com"
  name "DaVinci Resolve"
  desc "Installateur CLI pour DaVinci Resolve (Gratuit)"
  homepage "https://www.blackmagicdesign.com/products/davinciresolve"

  installer script: {
    executable: "#{staged_path}/free.sh",
    sudo:       true,
  }

  uninstall delete: "/Applications/DaVinci Resolve"
end
