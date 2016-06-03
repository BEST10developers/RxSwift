//
//  RxPickerViewDataSource.swift
//  Rx
//
//  Created by Yusuke Murata on 2016/06/02.
//  Copyright © 2016年 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)

    import Foundation
    import UIKit
#if !RX_NO_MODULE
    import RxSwift
#endif

class RxPickerViewDataSource: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {

    var titles: [[String]]?

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return titles?.count ?? 0
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles?[component].count ?? 0
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles?[component][row] ?? ""
    }

}

#endif
