//
//  ViewController.swift
//  DragImg
//
//  Created by songxing10000 on 05/21/2022.
//  Copyright (c) 2022 songxing10000. All rights reserved.
//

import Cocoa
import DragImg
class ViewController: NSViewController {
    ///  把图片拷贝到哪个文件夹
    @IBOutlet weak var m_desFolderPathTF: NSTextField!
    
    /// 粘贴板生成的md格式
    @IBOutlet weak var m_pastStrTF: NSTextField!

    @IBAction func clickBtn(_ sender: Any) {
      
        presentViewControllerAsModalWindow(DragImgVC.vc())
    }
    
}


