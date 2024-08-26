//
//  PickerView.swift
//  Choose Gender Interaction
//
//  Created by Afeez Yunus on 26/08/2024.
//

import SwiftUI

struct CustomPicker: UIViewRepresentable {
    @Binding var selection: (Int, Int, Int)
    let data: [[String]]
    
    func makeUIView(context: Context) -> UIPickerView {
        let picker = UIPickerView()
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIView(_ uiView: UIPickerView, context: Context) {
        for i in 0..<min(data.count, 3) {
            let index = min(selection.0, data[i].count - 1)
            uiView.selectRow(index, inComponent: i, animated: false)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: CustomPicker
        
        init(_ parent: CustomPicker) {
            self.parent = parent
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return parent.data.count
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return parent.data[component].count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return parent.data[component][row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            var newSelection = parent.selection
            newSelection.0 = pickerView.selectedRow(inComponent: 0)
            newSelection.1 = pickerView.selectedRow(inComponent: 1)
            if parent.data.count > 2 {
                newSelection.2 = pickerView.selectedRow(inComponent: 2)
            }
            parent.selection = newSelection
        }
    }
}
