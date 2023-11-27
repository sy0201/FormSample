//
//  CreateFormBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/23.
//

import UIKit
import SnapKit

final class CreateFormBaseView: BaseView {

    // TODO: 선택안함유무 데이터 전달시 필요
    //var attachmentButtonAction: (() -> Void)?
    var isAttachment: Bool = false {
        didSet {
            self.changeState()
        }
    }

    let scrollView = UIScrollView()
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
        locationLabel.text = "거실"
        return locationLabel
    }()

    let locationStackView: UIStackView = {
        let locationStackView = UIStackView()
        locationStackView.axis = .vertical
        locationStackView.alignment = .leading
        locationStackView.distribution = .fillProportionally
        locationStackView.spacing = 0
        return locationStackView
    }()

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

    private let defectiveView = UIView()
    private let defectiveTitleLabel: UILabel = {
        let defectiveTitleLabel = UILabel()
        defectiveTitleLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        defectiveTitleLabel.textColor = Asset.Color.gray2D3338.color
        defectiveTitleLabel.text = L10n.formMessage15
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

    let defectiveStackView: UIStackView = {
        let defectiveStackView = UIStackView()
        defectiveStackView.axis = .vertical
        defectiveStackView.alignment = .leading
        defectiveStackView.distribution = .fill
        defectiveStackView.spacing = 0
        return defectiveStackView
    }()

    private let defectiveLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = Asset.Color.grayEEF1F3.color
        return lineView
    }()

    let defectiveButton: UIButton = {
        let defectiveButton = UIButton()
        defectiveButton.setImage(UIImage(named: Asset.Icon.icArrowDefault.name), for: .normal)
        defectiveButton.imageEdgeInsets = .init(top: 0, left: 340, bottom: 0, right: 0)
        return defectiveButton
    }()

    let photoView: UIView = UIView()
    let photoStackView: UIStackView = {
        let photoStackView = UIStackView()
        photoStackView.axis = .vertical
        photoStackView.alignment = .fill
        photoStackView.distribution = .equalSpacing
        photoStackView.spacing = 0
        return photoStackView
    }()

    private let photoTitleLabel: UILabel = {
        let photoTitleLabel = UILabel()
        photoTitleLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        photoTitleLabel.textColor = Asset.Color.black.color
        photoTitleLabel.text = L10n.formMessage11
        return photoTitleLabel
    }()

    let unSelectedButton: UIButton = {
        let unSelectedButton = UIButton()
        unSelectedButton.setImage(UIImage(named: Asset.Icon.icCheckboxOff.name), for: .normal)
        unSelectedButton.titleLabel?.font = FontFamily.NotoSansKR.medium.font(size: 14)
        unSelectedButton.setTitleColor(Asset.Color.gray9DA4AA.color, for: .normal)
        unSelectedButton.setTitle(L10n.formMessage12, for: .normal)
        unSelectedButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 4)
        return unSelectedButton
    }()

    let photoTopView: UIView = UIView()

    let zoomInView: UIView = {
        let zoomInView = UIView()
        zoomInView.backgroundColor = Asset.Color.grayF4F5F6.color
        return zoomInView
    }()
    let zoomInImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()

    let zoomInButton = UIButton()

    let zoomOutView: UIView = {
        let zoomOutView = UIView()
        zoomOutView.backgroundColor = Asset.Color.grayF4F5F6.color
        return zoomOutView
    }()
    let zoomOutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    let zoomOutButton = UIButton()

    let attachPhotoStackView: UIStackView = {
        let attachPhotoStackView = UIStackView()
        attachPhotoStackView.axis = .horizontal
        attachPhotoStackView.alignment = .fill
        attachPhotoStackView.distribution = .fillEqually
        attachPhotoStackView.spacing = 10
        return attachPhotoStackView
    }()

    let attachPhotoView: UIView = UIView()

    let photoBottomView: UIView = UIView()
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

    let hiddenStackView: UIStackView = {
        let hiddenStackView = UIStackView()
        hiddenStackView.axis = .vertical
        hiddenStackView.alignment = .fill
        hiddenStackView.distribution = .fillProportionally
        hiddenStackView.spacing = 8
        return hiddenStackView
    }()

    let defectiveInputView: UIView = UIView()
    let defectiveInputStackView: UIStackView = {
        let defectiveInputStackView = UIStackView()
        defectiveInputStackView.axis = .vertical
        defectiveInputStackView.alignment = .fill
        defectiveInputStackView.distribution = .fillEqually
        defectiveInputStackView.spacing = 8
        return defectiveInputStackView
    }()
    private let defectiveInputTitleLabel: UILabel = {
        let defectiveInputTitleLabel = UILabel()
        defectiveInputTitleLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        defectiveInputTitleLabel.textColor = Asset.Color.gray2D3338.color
        defectiveInputTitleLabel.text = L10n.formMessage15
        defectiveInputTitleLabel.numberOfLines = 0
        return defectiveInputTitleLabel
    }()

    let defectiveTextView: UITextView = {
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
        zoomInView.addDashedBorder(to: zoomInView, withRadius: 12, borderWidth: 1)
        zoomOutView.addDashedBorder(to: zoomOutView, withRadius: 12, borderWidth: 1)
    }

    override func setupUI() {
        addSubviews([scrollView, mainView, titleView, locationView, defectiveView, locationStackView, defectiveStackView, photoView, photoStackView, attachPhotoStackView, hiddenStackView, defectiveInputView])
        scrollView.addSubview(mainView)
        titleView.addSubviews([titleLabel, titleLineView])

        locationView.addSubviews([locationStackView, locationLineView, locationButton])
        locationStackView.addArrangedSubviews([locationTitleLabel, locationLabel])

        defectiveView.addSubviews([defectiveStackView, defectiveLineView, defectiveButton])
        defectiveStackView.addArrangedSubviews([defectiveTitleLabel, defectiveLabel])

        photoView.addSubview(photoStackView)
        photoStackView.addArrangedSubviews([photoTopView, hiddenStackView, attachPhotoView, photoBottomView])

        photoTopView.addSubviews([photoTitleLabel, unSelectedButton])
        hiddenStackView.addSubviews([attachPhotoStackView, photoBottomView])

        attachPhotoView.addSubview(attachPhotoStackView)
        attachPhotoStackView.addArrangedSubviews([zoomInView, zoomOutView])
        zoomInView.addSubviews([zoomInImageView, zoomInButton])
        zoomOutView.addSubviews([zoomOutImageView, zoomOutButton])

        photoBottomView.addSubviews([photoBottomLabel, photoBottomLineView])

        defectiveInputView.addSubview(defectiveInputStackView)
        defectiveInputStackView.addSubviews([defectiveInputTitleLabel, defectiveTextView])
    }

    override func setupConstraint() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        mainView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(safeAreaLayoutGuide)
        }

        titleView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(mainView)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(22)
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

        locationStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(locationView).inset(24)
            make.top.bottom.equalTo(locationView).inset(16)
        }

        locationLineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(locationView).inset(24)
            make.bottom.equalTo(locationView.snp.bottom)
            make.height.equalTo(1)
        }

        locationButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(locationView)
        }

        defectiveView.snp.makeConstraints { make in
            make.top.equalTo(locationView.snp.bottom)
            make.leading.trailing.equalTo(mainView)
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

        defectiveButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(defectiveView)
        }

        photoView.snp.makeConstraints { make in
            make.top.equalTo(defectiveView.snp.bottom)
            make.leading.trailing.equalTo(mainView)
        }

        photoStackView.snp.makeConstraints { make in
            make.edges.equalTo(photoView)
        }

        photoTopView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(defectiveView)
            make.top.equalTo(defectiveView.snp.bottom)
        }

        photoTitleLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(photoTopView).inset(24)
        }

       hiddenStackView.snp.makeConstraints { make in
           make.leading.trailing.equalTo(photoTopView).inset(24)
           make.top.equalTo(photoTopView.snp.bottom)
        }

        unSelectedButton.snp.makeConstraints { make in
            make.trailing.equalTo(photoTopView.snp.trailing).inset(24)
            make.top.bottom.equalTo(photoTopView)
        }

        attachPhotoView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(hiddenStackView.snp.bottom)
        }

        attachPhotoStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(attachPhotoView).inset(24)
            make.top.bottom.equalTo(attachPhotoView)
            make.height.equalTo(150)
        }

        zoomInView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
        }

        zoomOutView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
        }

        zoomInImageView.snp.makeConstraints { make in
            make.edges.equalTo(zoomInView)
        }

        zoomOutImageView.snp.makeConstraints { make in
            make.edges.equalTo(zoomOutView)
        }

        zoomInButton.snp.makeConstraints { make in
            make.edges.equalTo(zoomInImageView)
        }

        zoomOutButton.snp.makeConstraints { make in
            make.edges.equalTo(zoomOutImageView)
        }

        photoBottomView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(attachPhotoView.snp.bottom)
        }

        photoBottomLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(photoBottomView).inset(24)
            make.top.equalTo(photoBottomView).offset(8)
        }

        photoBottomLineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(photoBottomView).inset(24)
            make.top.equalTo(photoBottomLabel.snp.bottom).offset(16)
            make.bottom.equalTo(photoBottomView.snp.bottom)
            make.height.equalTo(1)
        }

        defectiveInputView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(photoBottomView.snp.bottom)
        }

        defectiveInputStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(defectiveInputView).inset(24)
            make.top.equalTo(defectiveInputView.snp.top).offset(16)
            make.bottom.equalTo(defectiveInputView.snp.bottom).inset(16)
        }

        defectiveInputTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(defectiveInputStackView)
        }

        defectiveTextView.snp.makeConstraints { make in
            make.top.equalTo(defectiveInputTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalTo(defectiveInputStackView)
            make.height.equalTo(120)
        }
    }
}

extension CreateFormBaseView {
    func setupTextView() {
        defectiveTextView.delegate = self
    }

    func changeState() {
        if isAttachment {
            unSelectedButton.setImage(UIImage(named: Asset.Icon.icCheckboxOn.name), for: .normal)
            attachPhotoStackView.isHidden = true
        } else {
            unSelectedButton.setImage(UIImage(named: Asset.Icon.icCheckboxOff.name), for: .normal)
            attachPhotoStackView.isHidden = false
        }
    }

    func setupActions() {
        unSelectedButton.addTarget(self, action: #selector(hiddenPhotoView), for: .touchUpInside)
    }

    @objc func hiddenPhotoView() {
        print("선택안함")
        isAttachment.toggle()
        changeState()
//        attachmentButtonAction?()
    }
}

extension CreateFormBaseView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if defectiveTextView == Asset.Color.gray9DA4AA.color {
            defectiveTextView.text = nil
            defectiveTextView.textColor = Asset.Color.black.color
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if defectiveTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            defectiveTextView.text =  L10n.formMessage16
            defectiveTextView.textColor = Asset.Color.gray9DA4AA.color
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)

        return true
    }
}
