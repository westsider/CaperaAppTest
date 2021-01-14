//
//  OverviewController.swift
//  RWStore
//
//  Created by Warren Hansen on 1/11/21.
//

import Cocoa

class OverviewController: NSViewController {

    @IBOutlet weak var titleLabel: NSTextField!
    
    @IBOutlet weak var priceLabel: NSTextField!
    
    @IBOutlet weak var descriptionLabel: NSTextField!
    
    @IBOutlet weak var productImageView: NSImageView!
    
    let numberFormatter = NumberFormatter()
    
    private var overviewViewController: OverviewController?

    
    var selectedProduct: Product? {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() 
    }
    
    override func viewWillAppear() {
      super.viewWillAppear()
      updateUI()
    }

    func updateUI() {
        
        if isViewLoaded {
            if let product = selectedProduct {
                productImageView.image = product.image
                titleLabel.stringValue = product.title
                priceLabel.stringValue = numberFormatter.string(from: product.price) ?? "n/a"
            }
        }
    }
    
}
