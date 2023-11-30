//
//  CreateFormBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/23.
//

import UIKit
import SnapKit

final class CreateBaseView: BaseView {

    var unSelectedPhoto: (Bool) -> Void = { _ in }
    var didChangeContentHandler: (String) -> Void = { _ in }
    var isAttachment: Bool = false {
        didSet {
            self.changeState()
        }
    }

    let shadowView: UIView = {
        let shadowView = UIView()
        shadowView.backgroundColor = Asset.Color.white.color
        return shadowView
    }()
    let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = Asset.Color.white.color
        return bottomView
    }()
    let bottomStackView: UIStackView = {
        let bottomStackView = UIStackView()
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillProportionally
        bottomStackView.spacing = 10
        return bottomStackView
    }()

    let closeBottomButton: UIButton = {
        let closeBottomButton = UIButton()
        closeBottomButton.backgroundColor = Asset.Color.white.color
        closeBottomButton.layer.cornerRadius = 24
        closeBottomButton.layer.borderWidth = 1
        closeBottomButton.layer.borderColor = Asset.Color.grayEEF1F3.color.cgColor
        closeBottomButton.titleLabel?.font = FontFamily.NotoSansKR.bold.font(size: 15)
        closeBottomButton.setTitleColor(Asset.Color.gray9DA4AA.color, for: .normal)
        closeBottomButton.setTitle(L10n.close, for: .normal)
        return closeBottomButton
    }()

    let saveBottomButton: UIButton = {
        let saveBottomButton = UIButton()
        saveBottomButton.backgroundColor = Asset.Color.green0F4F51.color
        saveBottomButton.layer.cornerRadius = 24
        saveBottomButton.layer.borderColor = Asset.Color.grayEEF1F3.color.cgColor
        saveBottomButton.titleLabel?.font = FontFamily.NotoSansKR.bold.font(size: 15)
        saveBottomButton.setTitleColor(Asset.Color.white.color, for: .normal)
        saveBottomButton.setTitle("저장하기", for: .normal)
        return saveBottomButton
    }()

    private let mainView = UIView()
    private let titleView = UIView()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontFamily.NotoSansKR.bold.font(size: 16)
        titleLabel.textColor = Asset.Color.black.color
        titleLabel.text = L10n.formMessage2
        return titleLabel
    }()
    private let titleLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = Asset.Color.black.color
        return lineView
    }()

    private let locationView = UIView()
    let locationButton: UIButton = {
        let locationButton = UIButton()
        locationButton.setImage(UIImage(named: Asset.Icon.icArrowDefault.name), for: .normal)
        locationButton.imageEdgeInsets = .init(top: 0, left: 340, bottom: 0, right: 0)
        return locationButton
    }()

    private let locationLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = Asset.Color.grayEEF1F3.color
        return lineView
    }()

    let locationStackView: UIStackView = {
        let locationStackView = UIStackView()
        locationStackView.axis = .vertical
        locationStackView.alignment = .leading
        locationStackView.distribution = .fillProportionally
        locationStackView.spacing = 0
        return locationStackView
    }()
    private let locationTitleLabel: UILabel = {
        let locationTitleLabel = UILabel()
        locationTitleLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        locationTitleLabel.textColor = Asset.Color.gray2D3338.color
        locationTitleLabel.text = L10n.formMessage9
        return locationTitleLabel
    }()
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = FontFamily.NotoSansKR.bold.font(size: 14)
        locationLabel.textColor = Asset.Color.green458E8F.color
        locationLabel.text = ""
        return locationLabel
    }()

    private let defectiveView = UIView()
    let defectiveButton: UIButton = {
        let defectiveButton = UIButton()
        defectiveButton.setImage(UIImage(named: Asset.Icon.icArrowDefault.name), for: .normal)
        defectiveButton.imageEdgeInsets = .init(top: 0, left: 340, bottom: 0, right: 0)
        return defectiveButton
    }()
    private let defectiveLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = Asset.Color.grayEEF1F3.color
        return lineView
    }()

    let defectiveStackView: UIStackView = {
        let defectiveStackView = UIStackView()
        defectiveStackView.axis = .vertical
        defectiveStackView.alignment = .leading
        defectiveStackView.distribution = .fill
        defectiveStackView.spacing = 0
        return defectiveStackView
    }()
    private let defectiveTitleLabel: UILabel = {
        let defectiveTitleLabel = UILabel()
        defectiveTitleLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        defectiveTitleLabel.textColor = Asset.Color.gray2D3338.color
        defectiveTitleLabel.text = L10n.formMessage10
        return defectiveTitleLabel
    }()
    let defectiveLabel: UILabel = {
        let defectiveLabel = UILabel()
        defectiveLabel.font = FontFamily.NotoSansKR.bold.font(size: 14)
        defectiveLabel.textColor = Asset.Color.green458E8F.color
        defectiveLabel.text = ""
        defectiveLabel.numberOfLines = 0
        return defectiveLabel
    }()

    private let photoView = UIView()
    let photoStackView: UIStackView = {
        let photoStackView = UIStackView()
        photoStackView.axis = .vertical
        photoStackView.alignment = .fill
        photoStackView.distribution = .equalSpacing
        photoStackView.spacing = 0
        return photoStackView
    }()
    private let photoInTitleView = UIView()
    private let photoTitleLabel: UILabel = {
        let photoTitleLabel = UILabel()
        photoTitleLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        photoTitleLabel.textColor = Asset.Color.black.color
        photoTitleLabel.text = L10n.formMessage11
        return photoTitleLabel
    }()
    let unSelectedPhotoButton: UIButton = {
        let unSelectedButton = UIButton()
        unSelectedButton.setImage(UIImage(named: Asset.Icon.icCheckboxOff.name), for: .normal)
        unSelectedButton.titleLabel?.font = FontFamily.NotoSansKR.medium.font(size: 14)
        unSelectedButton.setTitleColor(Asset.Color.gray9DA4AA.color, for: .normal)
        unSelectedButton.setTitle(L10n.formMessage12, for: .normal)
        unSelectedButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 4)
        return unSelectedButton
    }()

    let hiddenStackView: UIStackView = {
        let hiddenStackView = UIStackView()
        hiddenStackView.axis = .vertical
        hiddenStackView.alignment = .fill
        hiddenStackView.distribution = .fillProportionally
        hiddenStackView.spacing = 8
        return hiddenStackView
    }()

    let addPhotoStackView: UIStackView = {
        let addPhotoStackView = UIStackView()
        addPhotoStackView.axis = .horizontal
        addPhotoStackView.alignment = .fill
        addPhotoStackView.distribution = .fillEqually
        addPhotoStackView.spacing = 8
        return addPhotoStackView
    }()
    let zoomInView: UIView = {
        let zoomInView = UIView()
        zoomInView.backgroundColor = Asset.Color.grayF4F5F6.color
        return zoomInView
    }()
    let zoomInImageView = UIImageView()
    let zoomInButton = UIButton()
    let plusZoomInPhotoStackView: UIStackView = {
        let plusPhotoStackView = UIStackView()
        plusPhotoStackView.axis = .vertical
        plusPhotoStackView.alignment = .center
        plusPhotoStackView.distribution = .fillEqually
        plusPhotoStackView.spacing = 8
        return plusPhotoStackView
    }()
    let plusZoomInPhotoLabel: UILabel = {
        let photoTitleLabel = UILabel()
        photoTitleLabel.font = FontFamily.NotoSansKR.medium.font(size: 14)
        photoTitleLabel.textColor = Asset.Color.gray9DA4AA.color
        photoTitleLabel.text = L10n.formMessage13
        return photoTitleLabel
    }()
    let plusZoomInPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.Icon.icAdd.image
        return imageView
    }()
    let zoomInDeleteButton: UIButton = {
        let deleteIcon = UIButton()
        deleteIcon.setImage(UIImage(named: Asset.Icon.icClear.name), for: .normal)
        deleteIcon.frame.size = CGSize(width: 26, height: 26)
        return deleteIcon
    }()

    let zoomOutView: UIView = {
        let zoomOutView = UIView()
        zoomOutView.backgroundColor = Asset.Color.grayF4F5F6.color
        return zoomOutView
    }()
    let zoomOutImageView = UIImageView()
    let zoomOutButton = UIButton()
    let plusZoomOutPhotoStackView: UIStackView = {
        let plusPhotoStackView = UIStackView()
        plusPhotoStackView.axis = .vertical
        plusPhotoStackView.alignment = .center
        plusPhotoStackView.distribution = .fillEqually
        plusPhotoStackView.spacing = 8
        return plusPhotoStackView
    }()
    let plusZoomOutPhotoLabel: UILabel = {
        let photoTitleLabel = UILabel()
        photoTitleLabel.font = FontFamily.NotoSansKR.medium.font(size: 14)
        photoTitleLabel.textColor = Asset.Color.gray9DA4AA.color
        photoTitleLabel.text = L10n.formMessage13
        return photoTitleLabel
    }()
    let plusZoomOutPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.Icon.icAdd.image
        return imageView
    }()
    let zoomOutDeleteButton: UIButton = {
        let deleteIcon = UIButton()
        deleteIcon.setImage(UIImage(named: Asset.Icon.icClear.name), for: .normal)
        deleteIcon.frame.size = CGSize(width: 26, height: 26)
        return deleteIcon
    }()

    private let photoBottomView: UIView = UIView()
    private let photoBottomLabel: UILabel = {
        let photoBottomLabel = UILabel()
        photoBottomLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        photoBottomLabel.textColor = Asset.Color.gray9DA4AA.color
        photoBottomLabel.text = L10n.formMessage14
        photoBottomLabel.numberOfLines = 0
        return photoBottomLabel
    }()
    private let photoBottomLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = Asset.Color.grayEEF1F3.color
        return lineView
    }()

    private let contentInputView: UIView = UIView()
    let contentInputStackView: UIStackView = {
        let contentInputStackView = UIStackView()
        contentInputStackView.axis = .vertical
        contentInputStackView.alignment = .fill
        contentInputStackView.distribution = .fillEqually
        contentInputStackView.spacing = 8
        return contentInputStackView
    }()
    private let contentInputTitleLabel: UILabel = {
        let contentInputTitleLabel = UILabel()
        contentInputTitleLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        contentInputTitleLabel.textColor = Asset.Color.gray2D3338.color
        contentInputTitleLabel.text = L10n.formMessage15
        contentInputTitleLabel.numberOfLines = 0
        return contentInputTitleLabel
    }()

    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 8
        textView.layer.borderColor = Asset.Color.grayEEF1F3.color.cgColor
        textView.layer.borderWidth = 1
        textView.textContainerInset = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
        textView.font = FontFamily.NotoSansKR.regular.font(size: 14)
        textView.textColor = Asset.Color.gray9DA4AA.color
        textView.text = L10n.formMessage16
        return textView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
        setupTextView()
        setupActions()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.addTopShadow(shadowColor: UIColor.gray, shadowOpacity: 0.1, shadowRadius: 4, offset: CGSize(width: 0.0, height: -5.0))

        zoomInView.layer.cornerRadius = 12
        zoomInView.layer.masksToBounds = true
        zoomInView.addDashedBorder(withRadius: 12)

        zoomOutView.layer.cornerRadius = 12
        zoomOutView.layer.masksToBounds = true
        zoomOutView.addDashedBorder(withRadius: 12)

        zoomInImageView.layer.cornerRadius = 12
        zoomInImageView.layer.masksToBounds = true

        zoomOutImageView.layer.cornerRadius = 12
        zoomOutImageView.layer.masksToBounds = true
    }

    override func setupUI() {
        addSubviews([mainView,
                     titleView,
                     locationView,
                     defectiveView,
                     photoView,
                     contentInputView,
                     shadowView,
                     bottomView])

        titleView.addSubviews([titleLabel, titleLineView])
        locationView.addSubviews([locationStackView,
                                  locationLineView,
                                  locationButton])
        locationStackView.addArrangedSubviews([locationTitleLabel, locationLabel])

        defectiveView.addSubviews([defectiveStackView,
                                   defectiveLineView,
                                   defectiveButton])
        defectiveStackView.addArrangedSubviews([defectiveTitleLabel, defectiveLabel])

        photoView.addSubview(photoStackView)
        photoStackView.addArrangedSubviews([photoInTitleView, hiddenStackView])
        photoInTitleView.addSubviews([photoTitleLabel, unSelectedPhotoButton])
        hiddenStackView.addArrangedSubviews([addPhotoStackView,
                                             photoBottomView])
        addPhotoStackView.addArrangedSubviews([zoomInView, zoomOutView])
        zoomInView.addSubviews([plusZoomInPhotoStackView,
                                zoomInImageView,
                                zoomInButton,
                                zoomInDeleteButton])
        plusZoomInPhotoStackView.addArrangedSubviews([plusZoomInPhotoLabel, plusZoomInPhotoImageView])
        zoomOutView.addSubviews([plusZoomOutPhotoStackView,
                                 zoomOutImageView,
                                 zoomOutButton,
                                 zoomOutDeleteButton])
        plusZoomOutPhotoStackView.addArrangedSubviews([plusZoomOutPhotoLabel, plusZoomOutPhotoImageView])

        photoBottomView.addSubviews([photoBottomLabel, photoBottomLineView])

        contentInputView.addSubview(contentInputStackView)
        contentInputStackView.addSubviews([contentInputTitleLabel, contentTextView])

        bottomView.addSubview(bottomStackView)
        bottomStackView.addArrangedSubviews([closeBottomButton, saveBottomButton])

        zoomInDeleteButton.isHidden = true
        zoomOutDeleteButton.isHidden = true
    }

    override func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(mainView).inset(24)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(titleView).inset(22)
            make.centerX.equalTo(titleView.snp.centerX)
        }

        titleLineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(titleView).inset(24)
            make.bottom.equalTo(titleView)
            make.height.equalTo(2)
        }

        locationView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(titleView.snp.bottom)
        }

        locationButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(locationView)
        }

        locationStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(locationView).inset(24)
            make.top.bottom.equalTo(locationView).inset(16)
        }

        locationLineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(locationView).inset(24)
            make.bottom.equalTo(locationView.snp.bottom)
            make.height.equalTo(1)
        }

        defectiveView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(locationView.snp.bottom)
        }

        defectiveButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(defectiveView)
        }

        defectiveStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(defectiveView).inset(24)
            make.top.bottom.equalTo(defectiveView).inset(16)
        }

        defectiveLineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(defectiveView).inset(24)
            make.bottom.equalTo(defectiveView.snp.bottom)
            make.height.equalTo(1)
        }

        photoView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(defectiveView.snp.bottom)
        }

        photoStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(photoView).inset(24)
            make.top.bottom.equalTo(photoView)
        }

        photoInTitleView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(photoStackView)
        }

        photoTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(photoInTitleView)
            make.top.equalTo(photoInTitleView).inset(24)
            make.bottom.equalTo(photoInTitleView).inset(10)
        }

        unSelectedPhotoButton.snp.makeConstraints { make in
            make.trailing.equalTo(photoInTitleView)
            make.top.bottom.equalTo(photoInTitleView)
        }

        hiddenStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(photoStackView)
            make.top.equalTo(photoInTitleView.snp.bottom)
        }

        addPhotoStackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(hiddenStackView)
        }

        zoomInView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
        }
        plusZoomInPhotoStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(zoomInView)
        }
        zoomInImageView.snp.makeConstraints { make in
            make.edges.equalTo(zoomInView)
        }
        zoomInButton.snp.makeConstraints { make in
            make.edges.equalTo(zoomInView)
        }
        zoomInDeleteButton.snp.makeConstraints { make in
            make.trailing.top.equalTo(zoomInButton)
            make.width.height.equalTo(50)
        }

        zoomOutView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
        }
        plusZoomOutPhotoStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(zoomOutView)
        }
        zoomOutImageView.snp.makeConstraints { make in
            make.edges.equalTo(zoomOutView)
        }
        zoomOutButton.snp.makeConstraints { make in
            make.edges.equalTo(zoomOutView)
        }
        zoomOutDeleteButton.snp.makeConstraints { make in
            make.trailing.top.equalTo(zoomOutButton)
            make.width.height.equalTo(50)
        }

        photoBottomView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(hiddenStackView)
            make.top.equalTo(addPhotoStackView.snp.bottom)
        }

        photoBottomLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(photoBottomView)
            make.top.equalTo(photoBottomView).inset(8)
        }

        photoBottomLineView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(photoBottomView)
            make.top.equalTo(photoBottomLabel.snp.bottom).offset(16)
            make.bottom.equalTo(photoBottomView.snp.bottom)
            make.height.equalTo(1)
        }

        contentInputView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(photoBottomView.snp.bottom).offset(16)
        }

        contentInputStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentInputView).inset(24)
            make.top.equalTo(contentInputView.snp.top).offset(16)
            make.bottom.equalTo(contentInputView.snp.bottom).inset(16)
        }
        
        contentInputTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentInputStackView)
            make.top.equalTo(contentInputStackView)
        }

        contentTextView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentInputView).inset(24)
            make.top.equalTo(contentInputTitleLabel.snp.bottom).offset(8)
            make.bottom.equalTo(contentInputView.snp.bottom)
            make.height.equalTo(120)
        }

        shadowView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(bottomView.snp.top)
        }

        bottomView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }

        bottomStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(bottomView).inset(24)
        }

        closeBottomButton.snp.makeConstraints { make in
            make.leading.equalTo(bottomStackView)
            make.width.equalTo(98)
            make.height.equalTo(50)
        }

        saveBottomButton.snp.makeConstraints { make in
            make.leading.equalTo(closeBottomButton.snp.trailing).offset(bottomStackView.spacing)
            make.trailing.equalTo(bottomStackView)
            make.height.equalTo(50)
        }
    }
}

extension CreateBaseView {
    func setupTextView() {
        contentTextView.delegate = self
    }

    func changeState() {
        if isAttachment {
            unSelectedPhoto(isAttachment)
            unSelectedPhotoButton.setImage(UIImage(named: Asset.Icon.icCheckboxOn.name), for: .normal)
            hiddenStackView.isHidden = true

        } else {
            unSelectedPhoto(isAttachment)
            unSelectedPhotoButton.setImage(UIImage(named: Asset.Icon.icCheckboxOff.name), for: .normal)
            hiddenStackView.isHidden = false
        }
    }

    func setupActions() {
        unSelectedPhotoButton.addTarget(self, action: #selector(hiddenPhotoView), for: .touchUpInside)
    }

    @objc func hiddenPhotoView() {
        isAttachment.toggle()
        changeState()
    }
}

extension CreateBaseView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        didChangeContentHandler(contentTextView.text)
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            contentTextView.textColor = Asset.Color.gray9DA4AA.color
            contentTextView.text = L10n.formMessage16
        } else if textView.text == L10n.formMessage16 {
            contentTextView.textColor = Asset.Color.black.color
            contentTextView.text = nil
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if contentTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            contentTextView.text =  L10n.formMessage16
            contentTextView.textColor = Asset.Color.gray9DA4AA.color
        }
    }
}
