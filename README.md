收集开发过程中用到的基础工具和UI，避免后续开发过程中重复工作

## Install

### 1.使用源代码
1. 下载工程源代码
2. 将TGCoreKit.xcodeproj 拖入进工程中
3. 在 Frameworks, Libraries, and Embedded Content 中添加 TGCoreKit.framework

### 2.使用 cocoapod
在 Podfile 中添加
```
pod 'TGCoreKit', :git => 'https://github.com/Aaron0927/TGCoreKit.git'
```
执行
```
pod install
```
