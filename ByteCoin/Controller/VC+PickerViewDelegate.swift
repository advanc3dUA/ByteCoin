//
//  VC+PickerViewDelegate.swift
//  ByteCoin
//
//  Created by Yuriy Gudimov on 31.10.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.updateUI(with: row)
    }
}
