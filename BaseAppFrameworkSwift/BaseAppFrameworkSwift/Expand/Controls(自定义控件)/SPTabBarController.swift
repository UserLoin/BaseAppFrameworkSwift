//
//  SPTabBarController.swift
//  BaseAppFrameworkSwift
//
//  Created by Simple_Code on 2018/8/29.
//  Copyright © 2018年 AnyApp. All rights reserved.
//

import UIKit

class SPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupItemTitleTextAttributes()
        setupChildViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  设置所有UITabBarItem的文字属性
    private func setupItemTitleTextAttributes() {
        let item = UITabBarItem.appearance()
        var normalAttrs = [NSAttributedStringKey : AnyObject]()
        normalAttrs[NSAttributedStringKey.font] = UIFont.systemFont(ofSize: 12)
        normalAttrs[NSAttributedStringKey.foregroundColor] = UIColor.gray;
        item.setTitleTextAttributes(normalAttrs, for: .normal)
        
        var selectedAttrs = [NSAttributedStringKey : AnyObject]()
        selectedAttrs[NSAttributedStringKey.font] = UIFont.systemFont(ofSize: 12)
        selectedAttrs[NSAttributedStringKey.foregroundColor] = UIColor.blue;
        item.setTitleTextAttributes(selectedAttrs, for: .selected)
    }
    
    
    // 添加子控件
    private func setupChildViewControllers() {
        addChildViewController(HomeViewController(),
                               title: "夺宝",
                               imageName: "duo-gary",
                               selectedImageName: "duo-blue")
        addChildViewController(HomeViewController(),
                               title: "折扣商城",
                               imageName: "shang-gary",
                               selectedImageName: "shang-blue")
        addChildViewController(HomeViewController(),
                               title: "最新揭晓",
                               imageName: "zui-gary",
                               selectedImageName: "zui-blue")
        addChildViewController(HomeViewController(),
                               title: "我的",
                               imageName: "me-gary",
                               selectedImageName: "me-blue")
    }
    
    /// 私有方法、只有在此页面内调用
    /// 初始化子控制器
    /// - Parameters:
    ///   - childController: 需要初始化的子控制器
    ///   - title: 子控制器的标题
    ///   - imageName: 子控制器的图片
    fileprivate func addChildViewController(_ childController: UIViewController, title:String, imageName:String, selectedImageName:String) {
        
        // 1.设置首页对应的数据
        childController.navigationItem.title = title;
        childController.tabBarItem.title = title;
        childController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        
        // 2.给首页包装一个导航控制器
        let nav = SPNavigationController()
        nav.addChildViewController(childController)
        
        // 3.将导航控制器添加到当前控制器上
        addChildViewController(nav)
    }

}
