## My personal emacs init.el file

Used by myself so it is kept between reinstallations of the
computer. Will change over time. Tested on Emacs 25 for GNU/Linux
and [OS X](https://emacsformacosx.com/).

Note. Uses [use-package](https://github.com/jwiegley/use-package) to
install packages via [melpa](https://melpa.org/). Don't install the
same emacs packages using the GNU/Linux package manager.

Thanks to @magnusmalm for many emacs tips. A couple of them below:

## Pre-built emacs25 binaries for Ubuntu 16.04
```
sudo apt-add-repository -y ppa:adrozdoff/emacs
sudo apt update
sudo apt install emacs25
```

## Build from source
```
git clone git://git.savannah.gnu.org/emacs.git
cd emacs
sudo apt-get build-dep emacs24
./autogen.sh
./configure
make
sudo make install
make clean
```


```
        ~~=) All Rights Reversed (=~~

Sweetmorn, the 46th day of Chaos in the YOLD 3183
```