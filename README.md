# CVConfiguration
Tool for views settings

传送门~>[CVConfiguration](https://github.com/Chan4iOS/CVConfiguration)
用`链式写法`来设置各种控件，减少代码的行数，让代码更加清晰，简结

![将你想要的设置'点'出来](http://upload-images.jianshu.io/upload_images/2170902-e5a4dd2a99348048.gif?imageMogr2/auto-orient/strip)
## 安装

### Manually
直接将项目中的  `UIView+ChanViewConfiguration.h` 和 `UIView+ChanViewConfiguration.m `添加进项目中即可

### CocoaPod
```
pod 'CVConfiguration'
```

## 写法对比
##### 普通写法
```
    [self.testButton setImage:[UIImage imageNamed:@"public_phone_icon"] forState:UIControlStateNormal];
    [self.testButton setTitle:@"284766710" forState:UIControlStateNormal];
    [self.testButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.testButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.testButton.backgroundColor = [UIColor yellowColor];
    self.testButton.titleLabel.font = [UIFont systemFontOfSize:14];
```

##### cvc写法
```
    self.testButton.cvc.buttonImage([UIImage imageNamed:@"public_phone_icon"],UIControlStateNormal).buttonTitle(@"284766710",0).buttonResponse(self,@selector(click:),UIControlEventTouchUpInside).buttonTitleFontSize(14).buttonTitleColor([UIColor redColor],0).viewBackGroundColor([UIColor yellowColor]);
```


## Common
###### UIView
```objectivec
self.testView = [[UIView alloc]initWithFrame:(CGRect){50,50,50,50}];
self.testView.cvc.viewBorder([UIColor redColor],CVC_ONE_PIX_HEIGHT).viewCornerRatioToHeight(0.5).viewBackGroundColor([UIColor yellowColor]);
```

###### UILabel
```objectivec
self.testLabel = [[UILabel alloc]initWithFrame:(CGRect){25,150,80,100}];
self.testLabel.cvc.labelFontSize(15).labelAlignment(NSTextAlignmentCenter).labelTextColor([UIColor blueColor]).labelNumOfLines(0).viewBackGroundColor([UIColor cyanColor]);
self.testLabel.text = @"交流QQ群518241824,QQ284766719,注明来因";
```

###### UIButton
```objectivec
//以下enum在 UIView+ChanViewConfiguration.h 上面
typedef NS_ENUM(NSUInteger, ChanButtonEdgeInsetsStyle) {
ChanButtonEdgeInsetsStyleTop, // image在上，label在下
ChanButtonEdgeInsetsStyleLeft, // image在左，label在右
ChanButtonEdgeInsetsStyleBottom, // image在下，label在上
ChanButtonEdgeInsetsStyleRight // image在右，label在左
};


self.testButton = [[UIButton alloc]initWithFrame:(CGRect){150,150,100,40}];
self.testButton.cvc.buttonImage([UIImage imageNamed:@"public_phone_icon"],UIControlStateNormal).buttonTitle(@"284766710",0).buttonResponse(self,@selector(click:),UIControlEventTouchUpInside).buttonTitleFontSize(14).buttonLayoutContent
    (ChanButtonEdgeInsetsStyleLeft,5).buttonTitleColor([UIColor redColor],0).viewBackGroundColor([UIColor yellowColor]);
```
###### UITableView
```objectivec
//这个数据源就懒得写了，不在界面显示
self.testTableView = [[UITableView alloc]init];

//此方法注册的cell，identifier默认为nibname
[self.testTableView cvc_tableViewRegisterCellWithNibNames:<#(NSArray *)#>]

//此方法注册的cell，identifier默认为classname
[self.testTableView cvc_tableViewRegisterCellWithClassNames:<#(NSArray *)#>]

[self.testTableView cvc_tableViewRegisterHeaderFooterViewWithNibNames:<#(NSArray *)#>]
[self.testTableView cvc_tableViewRegisterHeaderFooterViewWithClassNames:<#(NSArray *)#>]

//默认设置    
[self.testTableView setUpDefaultSettings];
//或者
self.testTableView.cvc.tableViewDefaultSettings();
```
###### UISearchBar
```objectivec
self.testSearchBar = [[UISearchBar alloc]initWithFrame:(CGRect){10,300,200,40}];
self.testSearchBar.placeholder = @"fas";
self.testSearchBar.cvc.searchBarTextFontSize(14).searchBarPlaceholderColor([UIColor blueColor]).searchBarTextColor([UIColor redColor]);
```

###### 批量添加子控件
```objectivec
[self.view cvc_addSubviews:@[self.testSearchBar,self.testButton,self.testView,self.testLabel]];
```
