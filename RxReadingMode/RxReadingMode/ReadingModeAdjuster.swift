//
//  ReadingModeAdjuster.swift
//  RxReadingMode
//
//  Created by 陈恩湖 on 2017/8/27.
//  Copyright © 2017年 Judson. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum ReadingMode {
    case dayTime, nightTime
}

// MARK: - 阅读体验调节器
class ReadingModeAdjuster {
    
    static var readingMode = Variable<ReadingMode>(.dayTime)
    
    init() { }
    
    static func updateStatus(readingMode: ReadingMode = .dayTime) {
        self.readingMode.value = readingMode
    }
}
