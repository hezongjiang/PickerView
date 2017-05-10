//
//  PickerView.swift
//  Test
//
//  Created by he on 2017/5/10.
//  Copyright © 2017年 he. All rights reserved.
//

import UIKit

class PickerView: UIView {

    /// 日期选择的闭包
    fileprivate var selectedTime: ((_ time: Date?) -> ())?
    
    /// 普通选择的闭包
    fileprivate var selected: ((_ title: String) -> ())?
    
    @IBOutlet weak var datePicker: UIDatePicker?
    @IBOutlet weak var pickerView: UIPickerView?
    
    
    
    fileprivate var titles = [String]()
    
    
    // 日期选择确定
    @IBAction func certain() {
        
        if datePicker != nil {
            
            selectedTime?(datePicker?.date)
        }
        
        if pickerView != nil, let row = pickerView?.selectedRow(inComponent: 0), row < titles.count {
            
            selected?(titles[row])
            textField?.text = titles[row]
        }
        
        textField?.resignFirstResponder()
    }
    
    fileprivate var textField: UITextField?
    
    class func timePickerView(textField: UITextField, _ selectedTime: ((_ time: Date?) -> ())?) -> PickerView {
        
        let nib = UINib(nibName: "TimePickerView", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! PickerView
        view.selectedTime = selectedTime
        view.textField = textField
        textField.inputView = view
        return view
    }
    
    class func pickerView(textField: UITextField, titles: [String], selected: ((_ title: String) -> ())?) -> PickerView{
        let nib = UINib(nibName: "PickerView", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! PickerView
        view.selected = selected
        view.titles = titles
        view.textField = textField
        textField.inputView = view
        return view
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if pickerView != nil {
            pickerView?.dataSource = self
            pickerView?.delegate = self
        }
    }
}


extension PickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected?(titles[row])
        textField?.text = titles[row]
    }
}

