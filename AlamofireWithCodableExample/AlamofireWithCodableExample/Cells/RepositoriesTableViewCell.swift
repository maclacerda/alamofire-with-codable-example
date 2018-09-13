//
//  RepositoriesTableViewCell.swift
//  AlamofireWithCodableExample
//
//  Created by Marcos Lacerda on 12/09/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var ownerPhoto: UIImageView!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        ownerPhoto.layer.cornerRadius = 30
        ownerPhoto.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        ownerPhoto.image = nil
        repoName.text = ""
        ownerName.text = ""
        repoDescription.text = ""
    }
    
    func initWithRepositorie(_ repo: Repositories) {
        guard let photoURL = URL(string: repo.owner.avatar) else { return }
        ownerPhoto.kf.setImage(with: photoURL)
        
        repoName.text = repo.name
        ownerName.text = repo.owner.login
        repoDescription.text = repo.text
    }

}
