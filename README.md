# nodeBBrun

# Now we support English (Partialy)

Gitee:https://gitee.com/nidb/nodeBBrun
Github:https://github/nidbCN/noodeBBrun

# 项目介绍
快速部署nodeBB的脚本
Ubuntu已经完成，由Gaein nidb编写
CentOS由Logic H编写中
感谢nodebb中文社区

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
