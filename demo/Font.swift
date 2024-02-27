//
//  Font.swift
//  Example Project
//
//  Created by yen on 2/26/24.
//

import ToDwoong

lazy var largeTitleLabel = createStyledLabel(text: "Large Title", font: TDStyle.font.largeTitle(style: .regular))
lazy var title1Label = createStyledLabel(text: "Title 1", font: TDStyle.font.title1(style: .regular))
lazy var title2Label = createStyledLabel(text: "Title 2", font: TDStyle.font.title2(style: .regular))
lazy var title3Label = createStyledLabel(text: "Title 3", font: TDStyle.font.title3(style: .regular))
lazy var bodyLabel = createStyledLabel(text: "Body", font: TDStyle.font.body(style: .regular))
lazy var subheadlineLabel = createStyledLabel(text: "Subheadline", font: TDStyle.font.subheadline(style: .regular))
lazy var footnoteLabel = createStyledLabel(text: "Footnote", font: TDStyle.font.footnote(style: .regular))
lazy var caption1Label = createStyledLabel(text: "Caption 1", font: TDStyle.font.caption1(style: .regular))
lazy var caption2Label = createStyledLabel(text: "Caption 2", font: TDStyle.font.caption2(style: .regular))

lazy var largeTitleLabelBold = createStyledLabel(text: "Large Title (Bold)", font: TDStyle.font.largeTitle(style: .bold))
lazy var title1LabelBold = createStyledLabel(text: "Title 1 (Bold)", font: TDStyle.font.title1(style: .bold))
lazy var title2LabelBold = createStyledLabel(text: "Title 2 (Bold)", font: TDStyle.font.title2(style: .bold))
lazy var title3LabelBold = createStyledLabel(text: "Title 3 (Bold)", font: TDStyle.font.title3(style: .bold))
lazy var bodyLabelBold = createStyledLabel(text: "Body (Bold)", font: TDStyle.font.body(style: .bold))
lazy var subheadlineLabelBold = createStyledLabel(text: "Subheadline (Bold)", font: TDStyle.font.subheadline(style: .bold))
lazy var footnoteLabelBold = createStyledLabel(text: "Footnote (Bold)", font: TDStyle.font.footnote(style: .bold))
lazy var caption1LabelBold = createStyledLabel(text: "Caption 1 (Bold)", font: TDStyle.font.caption1(style: .bold))
lazy var caption2LabelBold = createStyledLabel(text: "Caption 2 (Bold)", font: TDStyle.font.caption2(style: .bold))

func createStyledLabel(text: String, font: UIFont) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = font
    return label
}