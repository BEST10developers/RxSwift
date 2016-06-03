//
//  RxPickerViewDataSourceProxy.swift
//  Rx
//
//  Created by Yusuke Murata on 2016/06/02.
//  Copyright © 2016年 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)

    import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif
import UIKit

public class RxPickerViewDataSourceProxy: DelegateProxy, UIPickerViewDataSource, DelegateProxyType {

    /**
     For more information take a look at `DelegateProxyType`.
     */
    public class func setCurrentDelegate(delegate: AnyObject?, toObject object: AnyObject) {
        let pickerView: UIPickerView = castOrFatalError(object)
        pickerView.dataSource = castOptionalOrFatalError(delegate)
    }

    /**
     For more information take a look at `DelegateProxyType`.
     */
    public class func currentDelegateFor(object: AnyObject) -> AnyObject? {
        let pickerView: UIPickerView = castOrFatalError(object)
        return pickerView.dataSource
    }

    // UIPickerViewDataSource
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }

}

#endif
