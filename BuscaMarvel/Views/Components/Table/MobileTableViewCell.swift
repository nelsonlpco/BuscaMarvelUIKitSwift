//
//  MobileTableViewCell.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 09/02/21.
//

import AlamofireImage
import UIKit

class MobileTableViewCell: UITableViewCell {
    private var _container: UIView = {
       let container = UIStackView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    private var _heroImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var _heroName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(_container)
        
        selectionStyle = .none
        
        _container.addSubview(_heroImage)
        _container.addSubview(_heroName)
                        
        
        
        let border = CALayer()
        border.backgroundColor = UIColor.red.cgColor
        border.frame = CGRect(x: 0, y: 90, width: self.frame.size.width + 60, height: 1)
        contentView.layer.addSublayer(border)
        
        setupLayout()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setImage(imagePath: String) {
        if let url = URL(string: imagePath) {
            _heroImage.af.setImage(withURL: url)
        }
        else {
            _heroImage.image = UIImage(named: "no-photos")
        }
    }

    func setName(name: String) {
        _heroName.text = name
    }
    
    //MARK: - Layout Configurations
    func setupLayout() {
        _container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        _container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        _container.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        _container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        _heroImage.widthAnchor.constraint(equalToConstant: 58).isActive = true
        _heroImage.heightAnchor.constraint(equalToConstant: 58).isActive = true
        _heroImage.centerYAnchor.constraint(equalTo: _container.centerYAnchor).isActive = true
        _heroImage.leadingAnchor.constraint(equalTo: _container.leadingAnchor).isActive = true
        _heroImage.clipsToBounds = true
        _heroImage.layer.cornerRadius = 27
        
        _heroName.leadingAnchor.constraint(equalTo: _heroImage.trailingAnchor, constant: 30).isActive = true
        _heroName.centerYAnchor.constraint(equalTo: _container.centerYAnchor).isActive = true
    }
}
