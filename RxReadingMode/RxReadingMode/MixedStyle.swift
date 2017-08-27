//
//  MixedStyle.swift
//  RxReadingMode
//
//  Created by 陈恩湖 on 2017/8/27.
//  Copyright © 2017年 Judson. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - 混合风格样式
struct MixedStyle<T> {
    
    /// 混合风格类属性
    var dayTimeStyle: T // 日间模式样式输入
    var nightTimeStyle: T // 夜间间模式样式输入

    // outPut
    var presentedStyle: Driver<T> // 外部输出属性，即呈现给外部的模式样式

    fileprivate let disposeBag = DisposeBag() // 监听者自动销毁器
    
    /// 混合风格类初始化构造器的配置
    init(dayTime dayStyle: T, nightTime nightStyle: T) {
        
        self.dayTimeStyle = dayStyle
        self.nightTimeStyle = nightStyle
        
        // 默认日间模式
        presentedStyle = ReadingModeAdjuster.readingMode.asObservable().flatMapLatest { (readMode) -> Observable<T> in
            switch readMode {
            case .dayTime:
                return Observable.just(dayStyle)
            case .nightTime:
                return Observable.just(nightStyle)
            }
        }
        .asDriver(onErrorJustReturn: dayStyle)
    }
}
