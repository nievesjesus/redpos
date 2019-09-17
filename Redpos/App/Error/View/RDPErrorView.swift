//
//  RDPErrorView.swift
//  Redpos
//
//  Created by Jesus Nieves on 16/09/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

typealias ErrorViewPressedCallback = () -> Void

class RDPErrorView: UIView {
    
    var onRetryPressed: ErrorViewPressedCallback?
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.autoSetDimensions(to: CGSize(width: 202.0, height: 202.0))
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "error")
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label.font = RDPStyleManager.Font.black.font(size: .large)
        label.textColor = RDPStyleManager.Color.main.color()
        label.numberOfLines = 0
        label.text = "Oops, sorry something has failed"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var retryButton: UIButton = {
        let button = UIButton.newAutoLayout()
        button.backgroundColor = RDPStyleManager.Color.main.color()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  RDPStyleManager.Font.medium.font(size: .medium)
        button.autoSetDimension(.height, toSize: 50.0)
        button.layer.cornerRadius = 25.0
        button.setTitle("Retry", for: .normal)
        return button
    }()
    
    private lazy var retryLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label.font =  RDPStyleManager.Font.roman.font(size: .medium)
        label.textColor = RDPStyleManager.Color.bluePurple.color()
        label.numberOfLines = 1
        label.text = "You can try to refresh the app."
        label.textAlignment = .center
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

extension RDPErrorView: RDPViewSetupable {
    
    func setupView() {
        self.retryButton.addTarget(self, action: #selector(self.retryPressed), for: .touchDown)
        self.backgroundColor = .white
        self.addSubview(self.iconImageView)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.retryButton)
        self.addSubview(self.retryLabel)
        
    }
    
    func setupConstraints() {
        self.iconImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 140.0)
        self.iconImageView.autoAlignAxis(toSuperviewAxis: .vertical)
        self.descriptionLabel.autoPinEdge(.top, to: .bottom, of: self.iconImageView, withOffset: 30.0)
        self.descriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16.0)
        self.descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16.0)
        
        self.retryLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 57.0)
        self.retryLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 57.0)
        self.retryLabel.autoPinEdge(.bottom, to: .top, of: self.retryButton, withOffset: -13.0)
        
        self.retryButton.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 14.0, left: 57.0, bottom: 12.0, right: 57.0), excludingEdge: .top)
    }
    
}

extension RDPErrorView {
    
    @objc func retryPressed () {
        guard let cb = onRetryPressed else { return }
        self.removeFromSuperview()
        cb()
    }
    
}
