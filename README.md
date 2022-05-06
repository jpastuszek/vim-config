# Initial setup

* git clone to `git clone git@github.com:jpastuszek/vim-config .vim`
* checkout bundles: `cd .vim && ./checkout`

# Nvim

```
cd ~/.config
ln -s ~/.vim nvim
```

# Rust analyzer

```
xi rust-analyzer
```

```
sudo -i
cd /usr/lib/rustlib
ln -s /usr/src
cd src
curl https://static.rust-lang.org/dist/rustc-1.57.0-src.tar.gz | tar xz
ln -s rustc-1.57.0-src rust
```
