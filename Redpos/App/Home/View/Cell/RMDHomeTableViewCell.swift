//
//  RMDHomeTableViewCell.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    func willRemovePost(model: PostModel?)
}

class RMDHomeTableViewCell: UITableViewCell {

    weak var delegate: HomeTableViewCellDelegate?
    
    var model: PostModel? {
        didSet {
            self.authorLabel.text = model?.data.author
            self.descriptionLabel.text = model?.data.title

            if let comments = model?.data.numComments {
                self.commentsLabel.text = "\(comments) comments"
            }

            if let readed = model?.data.readed, readed == true {
                self.unreadLabel.isHidden = true
            } else {
                self.unreadLabel.isHidden = false
            }

            if let thumbnail = model?.data.thumbnail {
                self.postThumbImageView.loadThumbnail(urlSting: thumbnail)
            }

            if let created = model?.data.createdUtc {
                let date = Date(timeIntervalSince1970: created)
                self.timeLabel.text = "\(date.timeAgo()) ago"
            }
        }
    }

    private lazy var selectedView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = RDPStyleManager.Color.softBlue.color().withAlphaComponent(0.5)
        view.alpha = 0.5
        return view
    }()

    private lazy var containerView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()

    private lazy var separatorView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = RDPStyleManager.Color.softGray.color()
        view.autoSetDimension(.height, toSize: 1)
        view.alpha = 0.6
        return view
    }()

    private lazy var postThumbImageView: UIImageView = {
        let imageview = UIImageView.newAutoLayout()
        imageview.autoSetDimensions(to: CGSize(width: 104, height: 104))
        imageview.contentMode = .scaleAspectFill
        imageview.backgroundColor = RDPStyleManager.Color.softGray.color()
        imageview.layer.cornerRadius = 52
        imageview.clipsToBounds = true
        return imageview
    }()

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = RDPStyleManager.Color.bluePurple.color()
        label.font = RDPStyleManager.Font.roman.font(size: .medium)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = RDPStyleManager.Font.roman.font(size: .xsmall)
        label.numberOfLines = 0
        label.textColor = RDPStyleManager.Color.regularGray.color()
        return label
    }()

    private lazy var unreadLabel: UILabel = {
        let label = UILabel()
        label.font = RDPStyleManager.Font.roman.font(size: .tiny)
        label.numberOfLines = 0
        label.backgroundColor = RDPStyleManager.Color.softBlue.color()
        label.textColor = .white
        label.textAlignment = .center
        label.autoSetDimensions(to: CGSize(width: 62, height: 18))
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.text = "unreaded"
        return label
    }()

    private lazy var commentsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = RDPStyleManager.Color.regularGray.color()
        label.autoSetDimension(.height, toSize: 15)
        label.font = RDPStyleManager.Font.roman.font(size: .xsmall)
        return label
    }()

    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = RDPStyleManager.Color.regularGray.color()
        label.font = RDPStyleManager.Font.roman.font(size: .tiny)
        return label
    }()
    
    private lazy var removeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "trash")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 24
        button.autoSetDimensions(to: CGSize(width: 32, height: 32))
        button.addTarget(self, action: #selector(self.removePost(_:)), for: .touchUpInside)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension RMDHomeTableViewCell: RDPViewSetupable {

    func setupView() {
        self.selectedBackgroundView = self.selectedView
        self.contentView.addSubview(self.containerView)
        self.containerView.addSubview(self.authorLabel)
        self.containerView.addSubview(self.descriptionLabel)
        self.containerView.addSubview(self.postThumbImageView)
        self.containerView.addSubview(self.commentsLabel)
        self.containerView.addSubview(self.timeLabel)
        self.containerView.addSubview(self.unreadLabel)
        self.containerView.addSubview(self.separatorView)
        self.containerView.addSubview(self.removeButton)
    }

    func setupConstraints() {
        self.containerView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(all: 16))
        self.postThumbImageView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 19,
                                                                                left: 16,
                                                                                bottom: 19,
                                                                                right: 0),
                                                             excludingEdge: .trailing)

        self.authorLabel.autoPinEdge(.leading, to: .trailing, of: self.postThumbImageView, withOffset: 12)
        self.authorLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 23)
        self.authorLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)

        self.commentsLabel.autoPinEdge(.top, to: .bottom, of: self.authorLabel, withOffset: 4)
        self.commentsLabel.autoPinEdge(.leading, to: .trailing, of: self.postThumbImageView, withOffset: 12)
        self.commentsLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)

        self.descriptionLabel.autoPinEdge(.top, to: .bottom, of: self.commentsLabel, withOffset: 8)
        self.descriptionLabel.autoPinEdge(.leading, to: .trailing, of: self.postThumbImageView, withOffset: 12)
        self.descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        self.descriptionLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16, relation: .greaterThanOrEqual)

        self.timeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        self.timeLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)

        self.unreadLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 16)
        self.unreadLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)

        self.separatorView.autoPinEdge(toSuperviewEdge: .trailing)
        self.separatorView.autoPinEdge(toSuperviewEdge: .bottom)
        self.separatorView.autoPinEdge(toSuperviewEdge: .leading, withInset: 40)
        
        self.removeButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
        self.removeButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 8)

        
    }

}

private extension RMDHomeTableViewCell {
    
    @objc func removePost (_ sender: UIButton){
        self.delegate?.willRemovePost(model: self.model)
    }
    
}
