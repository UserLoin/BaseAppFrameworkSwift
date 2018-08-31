//
//  SPNavigationController.swift
//  BaseAppFrameworkSwift
//
//  Created by Simple_Code on 2018/8/29.
//  Copyright © 2018年 AnyApp. All rights reserved.
//

import UIKit

class SPNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 设置导航控制器为手势识别的代理
        interactivePopGestureRecognizer?.delegate = self
        
        // 设置navigationBar的背景图片
        // navigationBar .setBackgroundImage(UIImage(named:""), for: UIBarMetrics.default)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 重写push方法的目的 : 拦截所有push进来的子控制器
    ///
    /// - Parameters:
    ///   - viewController: 刚刚push进来的子控制器
    ///   - animated: 是否动画
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 // 如果viewController不是最早push进来的子控制器
        {
            //左上角
            let backButton = UIButton.init(type: UIButtonType.custom)
            backButton.setImage(UIImage(named:"bback"), for: UIControlState.normal)
            backButton.setImage(UIImage(named:"bback"), for: UIControlState.highlighted)
            backButton.setTitleColor(UIColor.black, for: UIControlState.normal)
            backButton.setTitleColor(UIColor.red, for: UIControlState.highlighted)
            backButton.sizeToFit()
            
            // 这句代码放在sizeToFit后面
            backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
            backButton.addTarget(self, action: #selector(back), for: UIControlEvents.touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backButton)
            
            //隐藏底部工具栏
            viewController.hidesBottomBarWhenPushed = true
        }
        
        // 所有设置搞定后, 再push控制器
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func back(){
        popViewController(animated: true)
    }
}

//MARK: - UIGestureRecognizerDelegate
extension SPNavigationController:UIGestureRecognizerDelegate
{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
        return childViewControllers.count > 1
    }
}
