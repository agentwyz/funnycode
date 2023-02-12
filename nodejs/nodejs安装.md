首先直接get

```shell
wget https://nodejs.org/dist/v12.14.0/node-v12.14.0-linux-x64.tar.gz
```

解压:
```
xz -d node-v12.14.0-linux-x64.tar.xz
```

然后执行:
```
tar -xf node-v12.14.0-linux-x64.tar
```

我们需要的Nodejs应用文件夹


建立软连接发生错误:
```linux
解决方法：
进入提示目录
cd /usr/local/bin/ 
删除node
rm -r node
重新建立软连接
ln -s /usr/lib/nodejs/node-v16.7.0/bin/node /usr/local/bin/

node -v 
成功
```

配置git连接
```js
ssh-keygen -t rsa -f /home/work/${vvvyz}/.ssh/id_rsa
```