//
//  DragImgVC.swift
//  DragImg
//
//  Created by dfpo on 2022/5/21.
//

import Cocoa
import xViews
private func getLibBundle() -> Bundle? {
    let fb = Bundle(for: DragImgVC.self)
    guard let path = fb.path(forResource: "DragImg", ofType: "bundle") else {
        return nil
    }
    return Bundle(path: path)
    
}
private func getImg(_ imgName: String?) -> NSImage? {
    guard let imgName = imgName else {
        return nil
    }
    return getLibBundle()?.image(forResource: imgName)
}
public class DragImgVC: NSViewController {
    @IBOutlet var m_textView: NSTextView!
    private var desFolderPath: String?
    private var pastStr: String?
    /// 外界调用方法
    public static func vc() -> DragImgVC {
        let vc = DragImgVC(nibName: "DragImgVC", bundle: getLibBundle())
        return vc
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    func moveFile(_ fileURL: URL){
        let desFolderPath = UserDefaults.standard.string(forKey:  "desFolderPath")
        let pastStr = UserDefaults.standard.string(forKey:   "workPastStr")
        
        
        var workFolderPath = "/Users/dfpo/Downloads/daily-summary/assets/"
        if let desFolderPath = desFolderPath, desFolderPath.hasSuffix("/") {
            workFolderPath = desFolderPath
        }
       
        var workPastStr = "![](./assets/\\(fileName))"
        // ![](./assets/\(fileName))
        if let pastStr = pastStr, pastStr.contains("\\(fileName)") {
            workPastStr = pastStr
        }
        
        let fileName = fileURL.lastPathComponent
        let destFileURL = URL(fileURLWithPath:  workFolderPath.appending(fileName))
         
        do {
            try FileManager().moveItem(at: fileURL, to: destFileURL)
            
            // 一定要clearContents，再设置字符串，才有效果
            NSPasteboard.general.clearContents()
            let mdStr = workPastStr.replacingOccurrences(of: "\\(fileName)", with: destFileURL.lastPathComponent)
            NSPasteboard.general.setString(mdStr, forType: .string)
            if let outStr = NSPasteboard.general.string(forType: .string) {
                output("剪贴板内容：\(outStr)")
            }
            
        } catch {
            output(error.localizedDescription)
             
        }
    }
    private func output(_ str: String?) {
        guard let str = str, !str.isEmpty else {
            return
        }
        m_textView.string = m_textView.string.appending("\n").appending(str)
        let range = NSRange(location:m_textView.string.count,length:0)
        m_textView.scrollRangeToVisible(range)
    }
}
extension DragImgVC: FileDragDelegate {
    public func didFinishDrag(_ URLs: [URL]) {
        let fileURL = URLs[0]
        let ext = fileURL.pathExtension
        switch ext {
        case "png":
            moveFile(fileURL)
        default:
            print(ext)
        }
    }
}
extension DragImgVC: NSSplitViewDelegate {
    public func splitView(_ splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return proposedMinimumPosition+90
    }
    public func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return proposedMaximumPosition-90
    }
}
