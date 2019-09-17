//
//  RDPDetailView.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

protocol DetailViewDelegate: class {
    func savePhotoFailed(error: Error)
    func savePhotoSuccess()
}

class RDPDetailView: UIView {

    weak var delegate: DetailViewDelegate?
    
    var model: PostModel? {
        didSet {
            self.authorLabel.text = model?.data.author
            self.descriptionLabel.text = model?.data.title

            if let thumbnail = model?.data.thumbnail {
                self.postThumbImageView.loadThumbnail(urlSting: thumbnail)
            }
        }
    }

    private lazy var postThumbImageView: UIImageView = {
        let imageview = UIImageView.newAutoLayout()
        imageview.backgroundColor = RDPStyleManager.Color.softGray.color()
        imageview.autoSetDimensions(to: CGSize(width: 144, height: 144))
        imageview.contentMode = .scaleAspectFill
        imageview.backgroundColor = RDPStyleManager.Color.softGray.color()
        imageview.layer.cornerRadius = 72
        imageview.clipsToBounds = true
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
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.postThumbImageView.isUserInteractionEnabled = true
        self.postThumbImageView.addGestureRecognizer(tapGestureRecognizer)
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

private extension RDPDetailView {

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        guard let image = tappedImage.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self
            , #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            self.delegate?.savePhotoFailed(error: error)
        } else {
            self.delegate?.savePhotoSuccess()
        }
    }
}

