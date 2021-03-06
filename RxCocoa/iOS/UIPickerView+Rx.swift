//
//  UIPickerView+Rx.swift
//  Rx
//
//  Created by Segii Shulga on 5/12/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)

    import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif
    import UIKit

extension UIPickerView {
    /**
     Reactive wrapper for `delegate`.
     For more information take a look at `DelegateProxyType` protocol documentation.
     */
    public var rx_delegate: DelegateProxy {
        return RxPickerViewDelegateProxy.proxyForObject(self)
    }

    public var rx_itemSelected: ControlEvent<(row: Int, component: Int)> {
        let source = rx_delegate
            .observe(#selector(UIPickerViewDelegate.pickerView(_:didSelectRow:inComponent:)))
            .map {
                return (try castOrThrow(Int.self, $0[1]), try castOrThrow(Int.self, $0[2]))
            }
        return ControlEvent(events: source)
    }

    /**
     Reactive wrapper for `dataSource`.
     For more information take a look at `DelegateProxyType` protocol documentation.
     */
    public var rx_dataSource: DelegateProxy {
        return RxPickerViewDataSourceProxy.proxyForObject(self)
    }

    public var rx_titlesAndWidths: (source: Observable<(titles: [[String]], widths: [CGFloat])>) -> Disposable {
        return { source in
            let dataSource = RxPickerViewDataSource()
            return source.subscribeProxyDataSourceForObject(self, dataSource: dataSource, retainDataSource: false) { [weak self] (_: RxPickerViewDataSourceProxy, event) in
                self?.dataSource = dataSource
                self?.delegate = dataSource
                dataSource.titles = event.element?.titles
                dataSource.componentWidths = event.element?.widths
            }
        }
    }
}

#endif
