//
//  UserTVCell.swift
//  Floward
//
//  Created by Shumakov Dmytro on 09.11.2022.
//

import UIKit

class UserTVCell: BasicTVCell {
    
    // MARK: - IBOutlets

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    //
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
        
    // MARK: - Properties
    
    private var username: String = ""
    private var postsCount: Int = 0
    //
    private var userImage: String?

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 16
        userImageView.layer.cornerRadius = userImageView.layer.frame.height / 2
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
    
    func configureCell(name: String, count: Int, image: String?) {
        username = name
        postsCount = count
        userImage = image
        
        configureUI()
    }
    
    private func configureUI() {
        
        usernameLabel.text = username
        postsLabel.text = "Posts: \(postsCount)"
        
        userImageView.setImage(url: userImage)
    }
}
