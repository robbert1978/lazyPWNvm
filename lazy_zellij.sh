#!/bin/sh

dir="$HOME/.local/bin/"
mkdir -p "$dir"

case $(uname -m) in
    "x86_64"|"aarch64")
        arch=$(uname -m)
    ;;
    "arm64")
        arch="aarch64"
    ;;
    *)
        echo "Unsupported cpu arch: $(uname -m)"
        exit 2
    ;;
esac

case $(uname -s) in
    "Linux")
        sys="unknown-linux-musl"
    ;;
    "Darwin")
        sys="apple-darwin"
    ;;
    *)
        echo "Unsupported system: $(uname -s)"
        exit 2
    ;;
esac

#Install zellij into ~/.local/bin
url="https://github.com/zellij-org/zellij/releases/latest/download/zellij-$arch-$sys.tar.gz"
curl --location "$url" | tar -C "$dir" -xz

#Create useful script zellij-run
cat << EOF > "$dir/zrun" 
#!/bin/sh
zellij run -- \$@
EOF
chmod +x "$dir/zrun"

#Create useful script zrf
cat << EOF > "$dir/zrf" 
#!/bin/sh
zellij run --floating -- \$@
EOF
chmod +x "$dir/zrf"

#Init zellij to .zshrc / .basrc

if [ "$SHELL" = "$(which zsh)" ]
then
    rc_file=".zshrc"
elif [ "$SHELL" = "$(which bash)" ]
then 
    rc_file=".bashrc"
fi

cat << EOF >> "$HOME/$rc_file"

if [[ ! -z "\$SSH_CLIENT" ]] then
	if [[ "\$TERM_PROGRAM" != "vscode"  && -z "\$ZELLIJ_SESSION_NAME" ]] then
        export TERM_PROGRAM="zrun"
		zellij # If not in vscode terminal, force using zellij
        exit
	fi
fi
EOF
