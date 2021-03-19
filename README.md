## 同文拼音 / PTRIME

此简体拼音输入法在保证易用的基础上，速度快，体积小，保护隐私，让更多的人能收到保护。  
本软件开源，免费，不会上传输入内容，也不需要网络权限  
唯一要读/写内/外存储设备的权限,其他的权限均可禁止

### 缘由
最近发现输入法是隐私泄漏的重灾区，绝大多数输入法都会把用户信息上传，当然也为了收入，会卖给搜索引擎和一些广告公司，增加利润。君子好财，但也要取之有道。很多软件做的也太过了，于是萌生输入法的想法。

实测了一些输入法，都不太理想。 最后发现了[中州韻输入法](https://rime.im/)家族，在其他操作系统上用的很不错，而且有 Android 版的[Trime 同文输入法](https://github.com/osfans/trime)，应该能满足我的需求，我也不需要自己折腾一个出来。但是，我试了好多次，从 F-Droid , Google Play 上 安装下载,怎么都不成功。当我快放弃的时候，才发现里面少了配置文件，当我把配置文件手动加进去，就好了。 整体来说只要配置好，还是很好用的。我就很不明白，为什么会这样，跑去QQ群询问，竟然是为了拦住小白的。 做软件本就是服务大家的，拦住不懂技术的人，又不能挣到服务费，我是不太理解的。既然软件是开源的GPL，那我就二次封装，一次配置好，让更多的人用上吧。

### 使用
本软件是 Trime 同文输入法的二次封装。这不是二次开发，因为我不是专职的Android开发，没有兴趣，也没有时间去增加新功能，修补错误。我只是
1. 更改了名称 （避免冲突）
2. 添加了[简体拼音输入法](https://github.com/rime/rime-pinyin-simp)和最基本的配置文件，修改最开始的配置等

仅此而已，如果你发现 Bug 或者 功能方面的建议 请直接询问 [Trime 同文输入](https://github.com/osfans/trime/issues)。当然，如果他们更新，我也会跟进。

### 第三方
https://github.com/rime/rime-pinyin-simp  
https://github.com/osfans/trime

### 功能和皮肤扩展
由于本人是极简的拥护者，所以此版本只有最基本的皮肤和唯一的简体拼音，优点是体积小，速度快。
但因为用的是和同文输入相同的代码，你也可以添加其他输入法，比如繁体，五笔，注音等等。你也可以增加输入词汇表，增添其他皮肤，具体参看[Trime 同文输入](https://github.com/osfans/trime)

### 捐赠
虽然我不是同文输入法开发组成员，但我建议你们直接捐赠给[Trime 同文输入](https://github.com/osfans/trime)  
当然你们如果有多余的比特币，我也不介意你捐赠给我买奶粉尿布
```
bitcoin:bc1qfjlzjfjy4rpk9mjuvmkgu84ssmcnzc640sernr?time=1614371108
```
## 开发/封装
封装环境 Ubuntu 18 

1. Prepare Tools
* download ndk 21.4.7075529 from https://developer.android.com/ndk/downloads/index.html and extra those to ~/Android/Sdk/ndk/
* install cmake 3.19.7
* gradle 6.8.3
 
2. Populate Trime Code (Only once)
```bash
# 2G+ disk, may take a while
git clone --recursive https://github.com/osfans/trime.git trime
```

3. Prepare code  
`bash ./prepare.sh`

3. Build
```bash
# package. may take 10+ minutes.
export ANDROID_HOME=~/Android/Sdk
cd trime
make debug
```
