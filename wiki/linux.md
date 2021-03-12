# Manjaro

* System upgrade

```bash
sudo pacman -Syu
```

* Install new kernel
```sh
sudo mhwd-kernel -i linux58
```

* Mount CDROM with execute
```sh
sudo mkdir /mnt/media
sudo mount -o exec /dev/cdrom /mnt/media
```

* change shell to zsh
```sh
which zsh
sudo chsh -x /usr/bin/zsh
```
