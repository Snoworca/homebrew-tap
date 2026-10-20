# Snoworca Homebrew Tap

Homebrew formulae for [BuilderGate](https://github.com/Snoworca/BuilderGate).

## Install

```sh
brew install snoworca/tap/buildergate
```

- Apple Silicon (arm64) Macs only.
- The program is installed under Homebrew's prefix. Settings, certificates and state are kept in `$(brew --prefix)/var/buildergate`, so they survive upgrades.

## Run

```sh
buildergate                       # start in the background (daemon)
buildergate --foreground          # run in this terminal
buildergate stop                  # stop the background daemon
brew services start buildergate   # start at login
```

Open `https://localhost:2002` and set the administrator password. To change the port, edit `server.port` in `$(brew --prefix)/var/buildergate/config.json5`, or pass `--port <port>`.

## Update

```sh
brew update && brew upgrade buildergate
```

The formula is updated automatically when a BuilderGate release is published.

---

## 한국어

### 설치

```sh
brew install snoworca/tap/buildergate
```

- Apple Silicon(arm64) Mac 전용입니다.
- 프로그램은 Homebrew 경로에 설치됩니다. 설정·인증서·상태는 `$(brew --prefix)/var/buildergate` 에 저장되어 업그레이드 후에도 남습니다.

### 실행

```sh
buildergate                       # 백그라운드(데몬)로 시작
buildergate --foreground          # 현재 터미널에서 실행
buildergate stop                  # 백그라운드 데몬 종료
brew services start buildergate   # 로그인할 때 자동 시작
```

`https://localhost:2002` 에 접속해 관리자 비밀번호를 정합니다. 포트를 바꾸려면 `$(brew --prefix)/var/buildergate/config.json5` 의 `server.port` 를 고치거나 `--port <포트>` 를 붙입니다.

### 업데이트

```sh
brew update && brew upgrade buildergate
```

BuilderGate 릴리즈가 게시되면 formula 가 자동으로 갱신됩니다.
