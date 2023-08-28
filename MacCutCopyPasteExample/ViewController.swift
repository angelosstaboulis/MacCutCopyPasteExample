//
//  ViewController.swift
//  MacCutCopyPasteExample
//
//  Created by Angelos Staboulis on 26/8/23.
//

import Cocoa
import AppKit

class ViewController: NSViewController {

    @IBAction func mnuCut(_ sender: Any) {
        let pasteboard = NSPasteboard.general
        pasteboard.prepareForNewContents(with: .init())
        pasteboard.setData(sourceImageView.image!.tiffRepresentation, forType: .png)
        sourceImageView.image = NSImage()
        
    }
    @IBAction func mnuCopy(_ sender: Any) {
        let pasteboard = NSPasteboard.general
        pasteboard.prepareForNewContents(with: .init())
        pasteboard.setData(sourceImageView.image!.tiffRepresentation, forType: .png)
    }
    @IBAction func mnuPaste(_ sender: Any) {
        let pasteboard = NSPasteboard.general
        let getData = pasteboard.data(forType: .png)
        let newImage = NSImage(data: getData!)
        newImage?.size = destImageView.frame.size
        destImageView.image =  newImage
    }
    
    
    
    
    @IBOutlet var sourceImageView: NSImageView!
    @IBOutlet var destImageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

extension ViewController {
    func initViewController(){
        sourceImageView.isEditable = true
        sourceImageView.allowsCutCopyPaste = true
    }
}
