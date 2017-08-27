//
//  ThemeStyleConfigs.swift
//  RxReadingMode
//
//  Created by 陈恩湖 on 2017/8/27.
//  Copyright © 2017年 Judson. All rights reserved.
//

import Foundation
import UIKit

struct ThemeStyleConfigs {
    
    // 夜间模式下的样式配置
    struct NightTime {
        // 主背景颜色
        static let primaryBackgroundColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1.0)
        // 大标题文本颜色样式
        static let titleTextColor =  UIColor(red: 191/255.0, green: 191/255.0, blue: 191/255.0, alpha: 1.0)
        // 小标题文本颜色样式
        static let detailLabelTextColor = UIColor(red: 140/255.0, green: 140/255.0, blue: 140/255.0, alpha: 1.0)
        // 返回按钮图片样式
        static let backButtomImage = UIImage(named: "night_BackArrow@24x24")
        
    }

    // 日间模式下的样式配置 （与以上对应）
    struct DayTime {
        static let primaryBackgroundColor = UIColor.white
        static let titleTextColor =  UIColor(red: 63/255.0, green: 63/255.0, blue: 63/255.0, alpha: 1.0)
        static let detailLabelTextColor = UIColor(red: 101/255.0, green: 106/255.0, blue: 113/255.0, alpha: 1.0)
        static let backButtomImage = UIImage(named: "day_BackArrow@24x24")
    }
}
