//
//  Reactive+Extension.swift
//  RxReadingMode
//
//  Created by 陈恩湖 on 2017/8/27.
//  Copyright © 2017年 Judson. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

///自定义 UIView 背景颜色监听者
extension Reactive where Base: UIView {
    var backgroundColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { view, color in
            view.backgroundColor = color
        }
    }
}

///自定义 UILabel 文字颜色监听者
extension Reactive where Base: UILabel {
    var textColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { label, result in
            label.textColor = result
        }
    }
}

///自定义 UIImageView 图片属性监听者
extension Reactive where Base: UIImageView {
    var image: UIBindingObserver<Base, UIImage> {
        return UIBindingObserver(UIElement: base) { imageView, result in
            imageView.image = result
        }
    }
}

extension Reactive where Base: UIButton {
    var normalImage: UIBindingObserver<Base, UIImage?> {
        return UIBindingObserver(UIElement: base) { button, result in
            button.setImage(result, for: .normal)
        }
    }
    
    var selectedImage: UIBindingObserver<Base, UIImage> {
        return UIBindingObserver(UIElement: base) { button, result in
            button.setImage(result, for: .selected)
        }
    }
    
    var textColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { button, result in
            button.setTitleColor(result, for: .normal)
        }
    }

}

extension Reactive where Base: UICollectionView {
    var backgroundColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { collectionView, result in
            collectionView.backgroundColor = result
        }
    }
}
