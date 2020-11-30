## 简介：
弃用之前vim配置管理方式，使用新的目录结构管理
为了方便，将.vimrc放到.vim目录下管理， 通过软连接的方式连接到上级目录。
新增snippet仓库，便于自己添加和维护自己的snippet。

## 安装

### 依赖环境

`cmake, git, nodejs, python3, python3-dev`

- 安装依赖：

  centos:

  `yum install -y cmake git nodejs python3 python3-devel`

  ubuntu:

  `apt install -y cmake git nodejs python3 python3-dev`

- 卸载系统绑定vim

  > 若vim 为 8.2及以上版本可以不卸载，并跳过源码安装vim

  centos:

  `yum remove vim`

- 安装vim8.2

  ```shell
  git clone --depth 1 -b v8.2.1052 https://github.com/vim/vim.git
  # 到vim目录下
  cd vim
  ./configure --with-features=huge \
     --enable-multibyte \
     --enable-python3interp \
     --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu \
     --prefix=/usr/local/vim8
  
  make -j8
  make install
  ```
  
  

### 编译安装 LLVM+Clang

> 若llvm和clang版本足够新，并且安装了clang-tools-extra  可以直接使用，无需源码安装
>
> 若系统为Ubuntu等常见系统，可以直接使用官网上与构建版本的二进制包 [Pre-Built Binaries   https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz](https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz)
>
> ubuntu版本的可能适配多种系统，若不愿意源码构建，可尝试一下

需要下载四个源码，并放到同一个目录下面，安装编译即可，编译完成默认会放到系统目录中 （不同系统路径可能有所差异）  

> 如需修改安装路径请自行修改安装脚本，若不懂请不要随意修改，避免发生错误不知如何操作
>
> 安装其他版本，替换源码的版本号即可，若不懂请不要随意修改，避免发生错误不知如何操作

- 安装脚本：

```shell
mkdir llvm_src
cd llvm_src
wget  https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/llvm-11.0.0.src.tar.xz
tar xf llvm-11.0.0.src.tar.xz
mv llvm-11.0.0.src llvm
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang-11.0.0.src.tar.xz
tar xf clang-11.0.0.src.tar.xz
mv clang-11.0.0.src clang
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/libcxx-11.0.0.src.tar.xz
tar xf libcxx-11.0.0.src.tar.xz
mv libcxx-11.0.0.src libcxx
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/libcxxabi-11.0.0.src.tar.xz
tar xf libcxxabi-11.0.0.src.tar.xz
mv libcxxabi-11.0.0.src.tar.xz libcxxabi
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang-tools-extra-11.0.0.src.tar.xz
tar xf clang-tools-extra-11.0.0.src.tar.xz
mv clang-tools-extra-11.0.0.src.tar.xz clang-tools-extra
# build
mkdir Release
cd Release
cmake ../llvm -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;clang-tools-extra;"
make -j8
make install
# delete tmp and src files
cd ..
rm -rf llvm_src
```

> 此脚本为纯手打，未执行过，如有错误请及时反馈



### 下载vim配置

​	使用的是skywb的配置，如果有其他的配置请自行下载或使用

```shell
cd ~
mv .vim .vim.back   # 如不需要备份请直接删除
mkdir .vim
git clone --depth 1 https://github.com/skywb/vim-config.git ./.vim
mv .vimrc .vimrc.back   # 如不需要备份请直接删除
ln -s .vim/vimrc ./.vimrc
cd .vim/
git submodule init
git submodule update
vim -c ":PlugInstall" -c "q"
```



由于coc.nvim版本里存在部分问题，需要手动执行 :PlugInstall


### 使用基本的配置
### 使用snippet
### 安装插件


