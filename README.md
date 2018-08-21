# nodeBBrun

# Now we support English (Partialy)

Gitee:https://gitee.com/nidb/nodeBBrun
Github:https://github/nidbCN/noodeBBrun

# 项目介绍
快速部署nodeBB的脚本
Ubuntu已经完成，由Gaein nidb编写
CentOS由Logic H编写中
感谢nodebb中文社区

#更新日志
3.0 修复无法选择redis/MongoDB，加入提示信息选项均为小写字符
2.9 已经存在redis询问时要求输入r/m修改为y/n，未翻译部分使用中文，而不是空，修复131行[: =: 期待一元表达式
2.8 修复redis无法写入密码的bug，修复redis重复询问密码bug，修复redis颜色bug
2.7 更新语言结构，方便日后翻译
2.6 更新代码结构，更加严谨；提供英语语言支持（部分）
2.5 修复redis块输入其他字符无法安装数据库
2.4 正常运行及安装



#当前仅部分支持英语，代码未经检测，最近的稳定版是 run-3.0.sh，也就是latest版

# 食用方法

Ubuntu使用代码：

```
wget https://github.com/nidbCN/nodeBBrun/blob/Ubuntu/run-latest.sh && chmod u+x run-latest.sh && ./run-latest.sh
```

# 文件说明
run-latest将会是最新版本，老旧版本用run-版本，注意，run-版本最新的与latest是相同的
由于2.4以下版本存在严重错误，故不公开

# 当前功能（Ubuntu）

- 根据用户输入选择下载源（大陆为阿里、中科大镜像）
- 根据用户输入选择数据库（Redis/MongoDB）
- 根据用户输入为数据库进行安全设置（仅限Redis）
- 自动判断系统版本添加合适的源（MongoDB）
- 自动判断是否存在必须软件，没有则自动安装（编译安装过的软件无法实现）
- 高亮信息提示

# 软件架构
Shell

# 最后
本人Linux菜鸟，如果有错误或者改正建议还请指正
未来版本将加入英文支持
