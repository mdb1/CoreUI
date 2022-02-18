//
//  UIView+RoundCornersTests.swift
//  
//
//  Created by Manu Herrera on 17/02/2022.
//

@testable import CoreUI
import XCTest

final class RoundCornersTests: XCTestCase {
    private enum Constant {
        static let cornerRadius: CGFloat = 4
        static let containerHeight = 20
        static let containerWidth = 20
    }

    private var containerView: UIView!

    override func setUp() {
        super.setUp()

        containerView = UIView(
            frame: CGRect(x: 0, y: 0, width: Constant.containerWidth, height: Constant.containerHeight)
        )
    }

    override func tearDown() {
        defer { super.tearDown() }

        containerView = nil
    }

    func testCornerRadius() {
        // Given
        XCTAssertNotNil(containerView)
        layoutViews([containerView])
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.cornerRadius = Constant.cornerRadius

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(
            containerView.layer.maskedCorners,
            [
                .layerMinXMinYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner
            ]
        )
    }

    func testRoundTopLeftCorner() {
        // Given
        XCTAssertNotNil(containerView)
        layoutViews([containerView])
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.round(corners: [.topLeft], radius: Constant.cornerRadius)

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.maskedCorners, [.layerMinXMinYCorner])
    }

    func testRoundTopRightCorner() {
        // Given
        XCTAssertNotNil(containerView)
        layoutViews([containerView])
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.round(corners: [.topRight], radius: Constant.cornerRadius)

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.maskedCorners, [.layerMaxXMinYCorner])
    }

    func testRoundBottomLeftCorner() {
        // Given
        XCTAssertNotNil(containerView)
        layoutViews([containerView])
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.round(corners: [.bottomLeft], radius: Constant.cornerRadius)

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.maskedCorners, [.layerMinXMaxYCorner])
    }

    func testRoundBottomRightCorner() {
        // Given
        XCTAssertNotNil(containerView)
        layoutViews([containerView])
        XCTAssertEqual(containerView.layer.cornerRadius, 0)

        // When
        containerView.round(corners: [.bottomRight], radius: Constant.cornerRadius)

        // Then
        // Corner Radius get applied correctly
        XCTAssertEqual(containerView.layer.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.cornerRadius, Constant.cornerRadius)
        XCTAssertEqual(containerView.layer.maskedCorners, [.layerMaxXMaxYCorner])
    }

    // We need to call this in order to simulate the viewDidLoad
    private func layoutViews(_ views: [UIView]) {
        views.forEach({
            $0.setNeedsLayout()
            $0.layoutIfNeeded()
        })
    }
}
