# 社区服务可达性与供给分析

network 处理有向路网和出行约束；catchments 构建可服务关系；supply 在共享容量池下计算供需；equity 组织分组指标；analysis_runs 保存可核对的场景、结果和归档。

有向边不能自动反转。设施标签与容量池是不同实体，共享池容量只能计算一次。浮点可达性指数、分数规划和保守整数投影有不同含义。数据为合成路网与社区，不代表实时交通或全局选址结论。

## 运行

Python 3.11，使用标准库及内置 SQLite，无第三方依赖。无需安装第三方包。 在项目根目录执行，命令不访问公网。演示在临时目录内创建数据，结束后自行清理，不需要预置凭据或另启服务。

```sh
python3 accessibility.py demo --fixture fixtures/community.json
```

## 开发检查

测试覆盖当前产品的核心计算、边界输入、事务或版本恢复及异常路径。编译或语法检查可单独运行。

```sh
python3 -m unittest discover -s tests -v
python3 -m compileall -q network catchments supply equity analysis_runs accessibility.py
```

## 容器复现

先在有网络的准备阶段取得运行镜像。之后可在断网容器中复制项目到临时工作区运行，避免向源目录写入缓存。

```sh
docker build -t local/analysis-product .
docker run --rm --network none local/analysis-product
```

具体接口参数可通过主入口的帮助命令查看。数据库、归档和导出文件应存入调用者指定的工作目录，不提交到源码仓库。
