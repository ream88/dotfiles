for file in $(find ~/.dotfiles \! -name "README.md" \! -name "bootstrap.sh" \! -path "*.git" -d 1)
do
  ln -sf $file ~
done
