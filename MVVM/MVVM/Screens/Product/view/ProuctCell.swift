//
//  ProuctCell.swift
//  MVVM
//
//  Created by prem on 2/3/23.
//

import UIKit

class ProuctCell: UITableViewCell {
    
    @IBOutlet weak var productView: UIView!
    
    @IBOutlet weak var ProductImageView: UIImageView!
    @IBOutlet weak var ProductTitleLBL: UILabel!
    @IBOutlet weak var ProductCatgeory: UILabel!
    @IBOutlet weak var descriptionView: UILabel!
    @IBOutlet weak var ratingButton: UIButton!
    @IBOutlet weak var priceLBL: UILabel!
    
    var product: Product? {
        didSet {
            productDetailConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguration() {
        guard let product else { return }
        ProductTitleLBL.text = product.title
        ProductCatgeory.text = product.category
        descriptionView.text = product.description
        priceLBL.text = "$\(product.price)"
        ratingButton.setTitle("\(product.rating.rate)", for: .normal)
        ProductImageView.setImage(with: product.image)
    }
}
