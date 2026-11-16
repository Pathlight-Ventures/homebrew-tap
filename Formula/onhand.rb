class Onhand < Formula
  desc "OnHand CLI (published on npm as @onhand-mcp/cli)"
  homepage "https://askonhand.com/use"
  url "https://registry.npmjs.org/@onhand-mcp/cli/-/cli-0.1.0.tgz"
  sha256 "6aafb05b178a57efc33347c2319e3a72f5f587e85a5f9adae421c0b177a10bcb"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    (bin/"onhand").write_env_script libexec/"bin/onhand", PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/onhand --version").strip
  end
end
