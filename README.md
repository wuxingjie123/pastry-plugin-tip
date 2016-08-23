# 支持平台

|平台 | 是否支持 |
|-----|------|
|JS    |  不支持    |
|FO-NodeJS    |  不支持    |
|iOS    | 支持    |
|android    | 支持(待开发)    |

# 依赖服务器数据

|平台 | 是否依赖 |
|-----|------|
|FO-Java    | 不依赖    |
|FO-NodeJS    | 不依赖    |
>>>>>>> pastryTeam/master

# 组件依赖关系

|组件 | 版本号 | 地址|
|-----|------|----|
|提示框    | 1.0.0    | [GitHub地址](https://github.com/wuxingjie123/pastry-plugin-tip.git)|

# 功能介绍
>
* 可选功能
  * 显示网络请求时，网络请求结束时的状态
  
# 安装方法
>
* pastry本地包安装
        
    pastry bake plugin add pastry-plugin-tip
>
* github在线安装

    # 安装指定 tag 版本
    pastry bake plugin add https://github.com/pastryTeam/pastry-plugin-tip.git#1.0.0 
    
    # 安装最新代码
    pastry bake plugin add https://github.com/pastryTeam/pastry-plugin-tip.git
    
# 使用方法
>
* 网络请求时的提示框（ECLoadingView）

        导入类：#import "ECLoadingView"
        获取LoadingView单例：[ECLoadingView shareLoadingView];
        调用方法：show;

>
* 网络请求结束时的提示框（ECWrongView）

        导入类：#import "ECWrongView"
        获取LoadingView单例：[ECWrongView shareLoadingView];
        调用方法：show;
        
# 作者
* pastryTeam团队

