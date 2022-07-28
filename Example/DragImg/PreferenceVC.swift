//
//  PreferenceVC.swift
//  DragImg_Example
//
//  Created by dfpo on 2022/7/28.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Cocoa
import xUtils
class PreferenceVC: NSViewController {
    ///  把图片拷贝到哪个文件夹
    @IBOutlet weak var m_desFolderPathTF: NSTextField!
    
    /// 粘贴板生成的md格式
    @IBOutlet weak var m_pastStrTF: NSTextField!
    
    @IBAction func clickSaveBtn(_ sender: Any) {
        // 保存
        
        
        UserDefaults.standard.set(m_desFolderPathTF.stringValue, forKey: "desFolderPath")
        
        
        
        let pastStr = m_pastStrTF.stringValue
        if  pastStr.contains("\\(fileName)") {
            UserDefaults.standard.set(pastStr, forKey: "workPastStr")
            // 关闭偏好窗口
            self.view.window?.close()
        } else {
            xUtils.showAlter(msg: "md格式不正确")
        }
       
    }
    /// 选择文件夹
    @IBAction func clickChooseBtn(_ sender: NSButton) {
        var directoryURL: URL?
        let desFolderPath = m_desFolderPathTF.stringValue
        if !desFolderPath.isEmpty, xUtils.isFolderExists(desFolderPath) {
            directoryURL = URL(fileURLWithPath: desFolderPath)
        }
        xUtils.chooseFolder(for: self.view.window, directoryURL: directoryURL) { aNewFolderPath in
            self.m_desFolderPathTF.stringValue = "\(aNewFolderPath)/"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 回显
        
        let desFolderPath = UserDefaults.standard.string(forKey:  "desFolderPath")
        let pastStr = UserDefaults.standard.string(forKey:   "workPastStr")
        
        
        
        if let desFolderPath = desFolderPath, desFolderPath.hasSuffix("/") {
            m_desFolderPathTF.stringValue = desFolderPath
        }
       
        if let pastStr = pastStr, pastStr.contains("\\(fileName)") {
            m_pastStrTF.stringValue = pastStr
        }
    }
    
}
