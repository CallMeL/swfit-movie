## 功能
### 基本功能
#### 三个查询功能
搜索函数：根据选择的搜索类型进行分类查询来提高搜索效率
1.1 名著改编：例子：小妇人 活着 了不起的盖茨比 阿丽塔 悲惨世界 白鹿原 三个火枪手 东方快车谋杀案 巴黎圣母院 slug名著改编
1.2 某人作品：实现可查询导演/演员作品
1.3 一剧多版：利用name/alias进行匹配，巴黎圣母院，名字后面有年号以区分
搜索亮点：
一边输入一边显示结果
#### 最热排行
排序函数：quiksort快排，这样交换最少
排序：vote
### 扩展功能
#### 图形界面
#### 用户收藏
#### 原著展示
book struc

##  页面与文件结构介绍
-Movie
    --MovieApp.swift：APP配置文件，在这里设置总环境变量
    
--Resource：资源类文件夹
    ---list.json
    ---director.json
    ---README.md 软件规划初期的需求分析
    ---README2.0.md 此文件，软件介绍
    
--struct&function：结果与函数文件夹
    --movieStruc.swift 定义struct 数据结构设计
    --loadFunc.swift 定义class 从JSON文件中加载数据
    --LoadImage.swift 从图片网址读取数据并转化成UIImage格式
    --deletSuffix.swift String数据类型的扩展函数，用来删去由于读取数据，如电影标题中的“-电影”这样的多余后缀
    --searchFunc.swift 快排函数
    
--pages
    --ContentView.swift：TabView实现
    --homePage：主页文件夹
        ---HomePage.swift：主页
        ---PersonItem.swift：影人
        ---randomTryPage.swift：“试试手气”页面
        ---CategoryRow.swift：
        ---CatergoryItem.swift
    --searchPage
        ---searchPage.swift
        ---searchBar.swift
        
    

