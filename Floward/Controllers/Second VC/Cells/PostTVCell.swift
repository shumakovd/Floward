//
//  PostTVCell.swift
//  Floward
//
//  Created by Shumakov Dmytro on 09.11.2022.
//

import UIKit

class PostTVCell: BasicTVCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    // MARK: - Properties
    
    private var postTitle: String = ""
    private var postBody: String = ""
    
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 16
    }
    
    override class var cellIdentifier: String {
        return String(describing: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // MARK: - Methods
    
    func configureCell(title: String, body: String) {
        postTitle = title
        postBody = body
        
        configureUI()
    }
    
    private func configureUI() {
        titleLabel.text = postTitle
        bodyLabel.text = postBody
    }    
}
