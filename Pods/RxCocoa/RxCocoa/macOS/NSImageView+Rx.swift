//
//  NSImageView+Rx.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 5/17/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(macOS)

import Cocoa
import RxSwift

extension Reactive where Base: NSImageView {
    /// Bindable sink for `image` property.
    public var image: Binder<NSImage?> {
        return Binder(self.base) { imageView, image in
            imageView.image = image
        }
    }
}

#endif
