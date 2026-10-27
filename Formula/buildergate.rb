# BuilderGate as a command-line tool: the single-file runtime from the release ZIP.
#
# The runtime keeps its config, certificates and state beside its root. Inside the
# Cellar that would be lost on every upgrade, so the data root is var/buildergate
# and only the program (binary, web files, shell integration) lives in libexec.
class Buildergate < Formula
  desc "Web workspace for running many terminal sessions and coding agents in parallel"
  homepage "https://github.com/Snoworca/BuilderGate"
  url "https://github.com/Snoworca/BuilderGate/releases/download/v0.10.25/BuilderGate-macos-arm64-0.10.25.zip"
  sha256 "7f1b3c2664cae4cb4c2fdc462c601e46d28c574f0f963f7835e6690cb023d631"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "buildergate", "web", "shell-integration", "config.json5"
    (bin/"buildergate").write_env_script libexec/"buildergate",
      BUILDERGATE_ROOT:                   var/"buildergate",
      BUILDERGATE_WEB_ROOT:               libexec/"web",
      BUILDERGATE_SHELL_INTEGRATION_ROOT: libexec/"shell-integration"
  end

  def post_install
    (var/"buildergate").mkpath
    config = var/"buildergate/config.json5"
    cp libexec/"config.json5", config unless config.exist?
  end

  service do
    run [opt_bin/"buildergate", "--foreground"]
    keep_alive true
    working_dir var/"buildergate"
    log_path var/"log/buildergate.log"
    error_log_path var/"log/buildergate.log"
  end

  def caveats
    <<~EOS
      Data, settings and certificates are kept in:
        #{var}/buildergate
      The default port is 2002 (set server.port in config.json5 there, or pass --port).

      Start in the background:
        buildergate
      Or as a login service:
        brew services start buildergate
      Then open https://localhost:2002 and set the administrator password.
    EOS
  end

  test do
    assert_match "--port", shell_output("#{bin}/buildergate --help")
  end
end
