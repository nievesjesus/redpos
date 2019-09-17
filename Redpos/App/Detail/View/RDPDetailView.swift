//
//  RDPDetailView.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

class RDPDetailView: UIView {

    private lazy var postThumbImageView: UIImageView = {
        let imageview = UIImageView.newAutoLayout()
        imageview.backgroundColor = RDPStyleManager.Color.softGray.color()
        imageview.autoSetDimensions(to: CGSize(width: 144, height: 144))
        imageview.contentMode = .scaleAspectFit
        imageview.backgroundColor = RDPStyleManager.Color.softGray.color()
        imageview.layer.cornerRadius = 72
        return imageview
    }()

    private lazy var contentView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Jesus Nieves"
        label.numberOfLines = 0
        label.textColor = RDPStyleManager.Color.bluePurple.color()
        label.textAlignment = .center
        label.font = RDPStyleManager.Font.roman.font(size: .large)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "asdlka sdl kasjdl aksjd asd asd laskdj alkdj alskdj alsdkj alskd"
        label.font = RDPStyleManager.Font.roman.font(size: .medium)
        label.numberOfLines = 0
        label.textColor = RDPStyleManager.Color.regularGray.color()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupView()
        self.setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension RDPDetailView: RDPViewSetupable {

    func setupView() {
        self.backgroundColor = RDPStyleManager.Color.main.color()
        self.addSubview(self.postThumbImageView)
        self.addSubview(self.contentView)
        self.contentView.addSubview(self.authorLabel)
        self.contentView.addSubview(self.descriptionLabel)
    }

    func setupConstraints() {
        self.postThumbImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        self.postThumbImageView.autoAlignAxis(toSuperviewAxis: .vertical)

        self.contentView.autoPinEdge(toSuperviewEdge: .top, withInset: 190)
        self.contentView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)

        self.authorLabel.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(all: 36), excludingEdge: .bottom)

        self.descriptionLabel.autoPinEdge(.top, to: .bottom, of: self.authorLabel, withOffset: 10)
        self.descriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 36)
        self.descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 36)
        self.descriptionLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 36, relation: .greaterThanOrEqual)
    }

}
