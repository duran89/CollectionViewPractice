//
//  CustomCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by 권정근 on 2/23/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let identifier = "CustomCollectionViewCell"
    
    
    // MARK: - UI Components
    var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        imageView.tintColor = .systemGray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        self.backgroundColor = .systemMint
        
        self.addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    /*
     prepareForuse() 경우에는 셀들이 재사용되는 경우에 셀에 들어가는 내용과는 무관한 alpha? editing 같은 것도 들어가는데 이를 초기화해주는 것
     즉, 셀의 속성을 초기화해준다.
     
     이를 통해 인터넷 사용이 느린 곳이나, 빠르게 스크롤할 경우에 셀에 이전 셀 내용이나, 셀의 내용이 빠지는 경우에 대비할 수 있다. 
     */
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
    }
    
}
