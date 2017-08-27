//
//  ViewController.swift
//  RxReadingMode
//
//  Created by 陈恩湖 on 2017/8/27.
//  Copyright © 2017年 Judson. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var modeTitleLabel: UILabel!
    
    @IBOutlet weak var modeDetailLabel: UILabel!
    
    @IBOutlet weak var modeToggleLabel: UILabel!
    
    @IBOutlet weak var themeStyleLabel: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    @IBOutlet weak var descriptionImageView: UIImageView!
    
    fileprivate let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        modeDetailLabel.text = (toggleSwitch.isOn ? "当前为夜间模式" : "当前为日间模式")
        configureReadModeStyle()
    }

    @IBAction func toggleReadingMode(_ sender: UISwitch) {
        // 当开关打开的时候 开启夜间模式 否则开启日间模式
        ReadingModeAdjuster.updateStatus(readingMode: sender.isOn ? .nightTime : .dayTime)
        modeDetailLabel.text = (sender.isOn ? "当前为夜间模式" : "当前为日间模式")
        
    }
    
    // 阅读模式配置方法
    fileprivate func configureReadModeStyle() {
        
        // 输入两套风格样式到 MixedStyle 类中
        let mixedViewColors = MixedStyle(dayTime: ThemeStyleConfigs.DayTime.primaryBackgroundColor, nightTime: ThemeStyleConfigs.NightTime.primaryBackgroundColor)
        // self.view 的背景颜色去监听 MixedStyle 类的呈现风格并进行背景颜色的属性绑定
        mixedViewColors.presentedStyle.drive(self.view.rx.backgroundColor).disposed(by: disposeBag)

        let mixedImages = MixedStyle(dayTime: ThemeStyleConfigs.DayTime.backButtomImage, nightTime: ThemeStyleConfigs.NightTime.backButtomImage)
        mixedImages.presentedStyle.drive(self.backButton.rx.normalImage).disposed(by: disposeBag)

        let mixedTextColors = MixedStyle(dayTime: ThemeStyleConfigs.DayTime.titleTextColor, nightTime:  ThemeStyleConfigs.NightTime.titleTextColor)
        mixedTextColors.presentedStyle.drive(self.modeTitleLabel.rx.textColor).disposed(by: disposeBag)
        mixedTextColors.presentedStyle.drive(self.modeToggleLabel.rx.textColor).disposed(by: disposeBag)
        mixedTextColors.presentedStyle.drive(self.themeStyleLabel.rx.textColor).disposed(by: disposeBag)

        let mixedDetailTextColors = MixedStyle(dayTime: ThemeStyleConfigs.DayTime.detailLabelTextColor, nightTime:  ThemeStyleConfigs.NightTime.detailLabelTextColor)
        mixedDetailTextColors.presentedStyle.drive(self.modeDetailLabel.rx.textColor).disposed(by: disposeBag)
        mixedTextColors.presentedStyle.drive(self.checkButton.rx.textColor).disposed(by: disposeBag)
        
        // 为图片（descriptionImageView）配置夜间模式和日间模式 （有兴趣的朋友可以试着实现下）
        
    }
    
}

