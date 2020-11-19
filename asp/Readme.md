[English](#Introduction)

[中文](#介绍)

# Introduction

x1_crypt.asp  --  The Webshell

x1_crypt.html -- The cryption key generator

x1_crypt.js -- The javascript code for AntSword encoder

x1_crypt_source.asp -- The data cryption source file.It is not a Webshell.I translate it from asp to javascript


# Usage

1. First,We must generate a KEY for cryption.Use a Browser to open file "x1_crypt.html".And then we will get a group of KEY

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/1.png">

2. copy the js code from file "x1_crypt.js" to your AntSword Encoder.Encoder type is "ASP"

3. we must change the key in our webshell and AntSword

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/2.png">

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/3.png">

4. upload the webshell to your target.Then use AntSword to test.modify the *Shell psw* and *Encoder*.If you want to be more secretive,you can also modify the HTTP header "User-Agant"

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/4.png" width=520>

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/5.png" width=520>

5. Connect to your target.We can see the traffic is crypted.But I haven't wrote the "Response crypted"

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/6.png" width=520>

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/8.png" width=520>


# 介绍

x1_crypt.asp  --  马

x1_crypt.html -- 加解密密钥生成器

x1_crypt.js -- 蚁剑的编码器代码

x1_crypt_source.asp -- asp加解密代码源文件。这不是Webshell。我将其加密算法从 asp 转换成 javascript。感兴趣的可以学习学习


# 用法

1. 首先，我们需要用浏览器访问"x1_crypt.html"文件，生成一组key。 

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/1.png">

2. 从 "x1_crypt.js" 中复制 js 代码出来，复制到蚁剑的编码器中。注意创建编码器的时候类型要选择 ASP

3. 修改webshell 和 蚁剑编码器中的 key 值

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/2.png">

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/3.png">

4. 上传webshell 到目标机器中。然后使用蚁剑连接。连接时注意参数 *Shell psw*，*Encoder* 。如果想要更隐秘一点，修改下请求头 "User-Agant"

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/4.png" width=520>

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/5.png" width=520>

5. 连接到目标机器，可以发现post的数据已经进行了加密。但是回显加密暂时还没做
Connect to your target.We can see the post data has been encrypted.But I haven't wrote the "Response crypted"

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/6.png" width=520>

<img src="https://github.com/xiaopan233/AntSword-Cryption-WebShell/blob/main/asp/pic/8.png" width=520>
