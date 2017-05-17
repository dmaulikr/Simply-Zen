//
// MainMenuView.swift
// Generated by Core Animator version 1.4 on 5/17/17.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

protocol MainMenuViewDelegate: class {
	func moodZenPressed(moodZen: UIButton)
	func guidedZenPressed(guidedZen: UIButton)
	func openZenPressed(openZen: UIButton)
}

private class MainMenuPassthroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
class MainMenuView : UIView, CAAnimationDelegate {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 414, height: 768))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	weak var mainMenuViewDelegate: MainMenuViewDelegate?

	// - MARK: Scaling

	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .scaleToFill:
				break
			case .scaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransform(scaleX: xScale, y: yScale)
			scalingView.center = CGPoint(x:self.bounds.midX, y:self.bounds.midY)
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = Bundle(for:type(of: self))
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:414, height:768)
		__scaling__.center = CGPoint(x:207.0, y:384.0)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let guidedZen__root = MainMenuPassthroughView()
		let guidedZen__xScale = MainMenuPassthroughView()
		let guidedZen__yScale = MainMenuPassthroughView()
		let guidedZen = UIButton(type: .custom)
		let imgGuidedZen = UIImage(named:"Guided Zen.png", in: bundle, compatibleWith: nil)
		if imgGuidedZen == nil {
			print("** Warning: Could not create image from 'Guided Zen.png'")
		}
		guidedZen.setBackgroundImage(imgGuidedZen, for:.normal)
		guidedZen.contentMode = .center
		guidedZen.bounds = CGRect(x:0, y:0, width:549.0, height:549.0)
		guidedZen__root.layer.position = CGPoint(x:249.018, y:421.702)
		guidedZen__xScale.transform = CGAffineTransform(scaleX: 0.46, y: 1.00)
		guidedZen__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.46)
		guidedZen__root.transform = CGAffineTransform(rotationAngle: 0.000)
		guidedZen.addTarget(self, action:#selector(MainMenuView.actionGuidedZenPressed), for: .touchUpInside)
		__scaling__.addSubview(guidedZen__root)
		guidedZen__root.addSubview(guidedZen__xScale)
		guidedZen__xScale.addSubview(guidedZen__yScale)
		guidedZen__yScale.addSubview(guidedZen)
		__scaling__.addSubview(guidedZen__root)
		viewsByName["Guided Zen__root"] = guidedZen__root
		viewsByName["Guided Zen__xScale"] = guidedZen__xScale
		viewsByName["Guided Zen__yScale"] = guidedZen__yScale
		viewsByName["Guided Zen"] = guidedZen

		let moodZen__root = MainMenuPassthroughView()
		let moodZen__xScale = MainMenuPassthroughView()
		let moodZen__yScale = MainMenuPassthroughView()
		let moodZen = UIButton(type: .custom)
		let imgMoodZen = UIImage(named:"Mood Zen.png", in: bundle, compatibleWith: nil)
		if imgMoodZen == nil {
			print("** Warning: Could not create image from 'Mood Zen.png'")
		}
		moodZen.setBackgroundImage(imgMoodZen, for:.normal)
		moodZen.contentMode = .center
		moodZen.bounds = CGRect(x:0, y:0, width:363.0, height:363.0)
		moodZen__root.layer.position = CGPoint(x:128.243, y:608.187)
		moodZen__xScale.transform = CGAffineTransform(scaleX: 0.43, y: 1.00)
		moodZen__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.43)
		moodZen__root.transform = CGAffineTransform(rotationAngle: 0.000)
		moodZen.addTarget(self, action:#selector(MainMenuView.actionMoodZenPressed), for: .touchUpInside)
		__scaling__.addSubview(moodZen__root)
		moodZen__root.addSubview(moodZen__xScale)
		moodZen__xScale.addSubview(moodZen__yScale)
		moodZen__yScale.addSubview(moodZen)
		__scaling__.addSubview(moodZen__root)
		viewsByName["Mood Zen__root"] = moodZen__root
		viewsByName["Mood Zen__xScale"] = moodZen__xScale
		viewsByName["Mood Zen__yScale"] = moodZen__yScale
		viewsByName["Mood Zen"] = moodZen

		let openZen__root = MainMenuPassthroughView()
		let openZen__xScale = MainMenuPassthroughView()
		let openZen__yScale = MainMenuPassthroughView()
		let openZen = UIButton(type: .custom)
		let imgOpenZen = UIImage(named:"Open Zen.png", in: bundle, compatibleWith: nil)
		if imgOpenZen == nil {
			print("** Warning: Could not create image from 'Open Zen.png'")
		}
		openZen.setBackgroundImage(imgOpenZen, for:.normal)
		openZen.contentMode = .center
		openZen.bounds = CGRect(x:0, y:0, width:447.0, height:447.0)
		openZen__root.layer.position = CGPoint(x:142.443, y:201.624)
		openZen__xScale.transform = CGAffineTransform(scaleX: 0.44, y: 1.00)
		openZen__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.44)
		openZen__root.transform = CGAffineTransform(rotationAngle: 0.000)
		openZen.addTarget(self, action:#selector(MainMenuView.actionOpenZenPressed), for: .touchUpInside)
		__scaling__.addSubview(openZen__root)
		openZen__root.addSubview(openZen__xScale)
		openZen__xScale.addSubview(openZen__yScale)
		openZen__yScale.addSubview(openZen)
		__scaling__.addSubview(openZen__root)
		viewsByName["Open Zen__root"] = openZen__root
		viewsByName["Open Zen__xScale"] = openZen__xScale
		viewsByName["Open Zen__yScale"] = openZen__yScale
		viewsByName["Open Zen"] = openZen

		self.viewsByName = viewsByName
	}

	// - MARK: float

	func addFloatAnimation() {
		addFloatAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addFloatAnimation(completion: ((Bool) -> Void)?) {
		addFloatAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addFloatAnimation(removedOnCompletion: Bool) {
		addFloatAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addFloatAnimation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addFloatAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addFloatAnimation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let easeInOutTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 25.500
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "Float")
			self.animationCompletions[layer.animation(forKey: "Float")!] = complete
		}

		let guidedZenScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		guidedZenScaleXAnimation.duration = 25.500
		guidedZenScaleXAnimation.values = [0.460, 0.450, 0.470, 0.440, 0.420, 0.460] as [Float]
		guidedZenScaleXAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		guidedZenScaleXAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		guidedZenScaleXAnimation.repeatCount = HUGE
		guidedZenScaleXAnimation.beginTime = beginTime
		guidedZenScaleXAnimation.fillMode = fillMode
		guidedZenScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Guided Zen__xScale"]?.layer.add(guidedZenScaleXAnimation, forKey:"float_ScaleX")

		let guidedZenScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		guidedZenScaleYAnimation.duration = 25.500
		guidedZenScaleYAnimation.values = [0.460, 0.450, 0.470, 0.440, 0.420, 0.460] as [Float]
		guidedZenScaleYAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		guidedZenScaleYAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		guidedZenScaleYAnimation.repeatCount = HUGE
		guidedZenScaleYAnimation.beginTime = beginTime
		guidedZenScaleYAnimation.fillMode = fillMode
		guidedZenScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Guided Zen__yScale"]?.layer.add(guidedZenScaleYAnimation, forKey:"float_ScaleY")

		let guidedZenTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		guidedZenTranslationXAnimation.duration = 25.500
		guidedZenTranslationXAnimation.values = [0.000, -2.000, 2.000, -2.000, 1.000, 0.000] as [Float]
		guidedZenTranslationXAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		guidedZenTranslationXAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		guidedZenTranslationXAnimation.repeatCount = HUGE
		guidedZenTranslationXAnimation.beginTime = beginTime
		guidedZenTranslationXAnimation.fillMode = fillMode
		guidedZenTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Guided Zen__root"]?.layer.add(guidedZenTranslationXAnimation, forKey:"float_TranslationX")

		let guidedZenTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		guidedZenTranslationYAnimation.duration = 25.500
		guidedZenTranslationYAnimation.values = [0.000, 2.000, -4.000, 2.000, -1.000, 0.000] as [Float]
		guidedZenTranslationYAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		guidedZenTranslationYAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		guidedZenTranslationYAnimation.repeatCount = HUGE
		guidedZenTranslationYAnimation.beginTime = beginTime
		guidedZenTranslationYAnimation.fillMode = fillMode
		guidedZenTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Guided Zen__root"]?.layer.add(guidedZenTranslationYAnimation, forKey:"float_TranslationY")

		let moodZenScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		moodZenScaleXAnimation.duration = 25.500
		moodZenScaleXAnimation.values = [0.434, 0.440, 0.400, 0.430, 0.460, 0.430] as [Float]
		moodZenScaleXAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		moodZenScaleXAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		moodZenScaleXAnimation.repeatCount = HUGE
		moodZenScaleXAnimation.beginTime = beginTime
		moodZenScaleXAnimation.fillMode = fillMode
		moodZenScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Mood Zen__xScale"]?.layer.add(moodZenScaleXAnimation, forKey:"float_ScaleX")

		let moodZenScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		moodZenScaleYAnimation.duration = 25.500
		moodZenScaleYAnimation.values = [0.434, 0.440, 0.400, 0.430, 0.460, 0.430] as [Float]
		moodZenScaleYAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		moodZenScaleYAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		moodZenScaleYAnimation.repeatCount = HUGE
		moodZenScaleYAnimation.beginTime = beginTime
		moodZenScaleYAnimation.fillMode = fillMode
		moodZenScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Mood Zen__yScale"]?.layer.add(moodZenScaleYAnimation, forKey:"float_ScaleY")

		let moodZenTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		moodZenTranslationXAnimation.duration = 25.500
		moodZenTranslationXAnimation.values = [0.000, 2.000, -2.000, -6.000, -10.000, 0.000] as [Float]
		moodZenTranslationXAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		moodZenTranslationXAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		moodZenTranslationXAnimation.repeatCount = HUGE
		moodZenTranslationXAnimation.beginTime = beginTime
		moodZenTranslationXAnimation.fillMode = fillMode
		moodZenTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Mood Zen__root"]?.layer.add(moodZenTranslationXAnimation, forKey:"float_TranslationX")

		let moodZenTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		moodZenTranslationYAnimation.duration = 25.500
		moodZenTranslationYAnimation.values = [0.000, -2.097, -2.000, 0.000, 4.000, 0.000] as [Float]
		moodZenTranslationYAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		moodZenTranslationYAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		moodZenTranslationYAnimation.repeatCount = HUGE
		moodZenTranslationYAnimation.beginTime = beginTime
		moodZenTranslationYAnimation.fillMode = fillMode
		moodZenTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Mood Zen__root"]?.layer.add(moodZenTranslationYAnimation, forKey:"float_TranslationY")

		let openZenScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		openZenScaleXAnimation.duration = 25.500
		openZenScaleXAnimation.values = [0.443, 0.450, 0.470, 0.440, 0.460, 0.440] as [Float]
		openZenScaleXAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		openZenScaleXAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		openZenScaleXAnimation.repeatCount = HUGE
		openZenScaleXAnimation.beginTime = beginTime
		openZenScaleXAnimation.fillMode = fillMode
		openZenScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Open Zen__xScale"]?.layer.add(openZenScaleXAnimation, forKey:"float_ScaleX")

		let openZenScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		openZenScaleYAnimation.duration = 25.500
		openZenScaleYAnimation.values = [0.443, 0.450, 0.470, 0.440, 0.460, 0.440] as [Float]
		openZenScaleYAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		openZenScaleYAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		openZenScaleYAnimation.repeatCount = HUGE
		openZenScaleYAnimation.beginTime = beginTime
		openZenScaleYAnimation.fillMode = fillMode
		openZenScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Open Zen__yScale"]?.layer.add(openZenScaleYAnimation, forKey:"float_ScaleY")

		let openZenTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		openZenTranslationXAnimation.duration = 25.500
		openZenTranslationXAnimation.values = [0.000, 1.000, -3.000, -5.000, 2.000, 0.000] as [Float]
		openZenTranslationXAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		openZenTranslationXAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		openZenTranslationXAnimation.repeatCount = HUGE
		openZenTranslationXAnimation.beginTime = beginTime
		openZenTranslationXAnimation.fillMode = fillMode
		openZenTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Open Zen__root"]?.layer.add(openZenTranslationXAnimation, forKey:"float_TranslationX")

		let openZenTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		openZenTranslationYAnimation.duration = 25.500
		openZenTranslationYAnimation.values = [0.000, 1.000, 4.000, -2.000, 3.000, 0.000] as [Float]
		openZenTranslationYAnimation.keyTimes = [0.000, 0.196, 0.392, 0.588, 0.784, 1.000] as [NSNumber]
		openZenTranslationYAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		openZenTranslationYAnimation.repeatCount = HUGE
		openZenTranslationYAnimation.beginTime = beginTime
		openZenTranslationYAnimation.fillMode = fillMode
		openZenTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Open Zen__root"]?.layer.add(openZenTranslationYAnimation, forKey:"float_TranslationY")
	}

	func removeFloatAnimation() {
		self.layer.removeAnimation(forKey: "Float")
		self.viewsByName["Guided Zen__xScale"]?.layer.removeAnimation(forKey: "float_ScaleX")
		self.viewsByName["Guided Zen__yScale"]?.layer.removeAnimation(forKey: "float_ScaleY")
		self.viewsByName["Guided Zen__root"]?.layer.removeAnimation(forKey: "float_TranslationX")
		self.viewsByName["Guided Zen__root"]?.layer.removeAnimation(forKey: "float_TranslationY")
		self.viewsByName["Mood Zen__xScale"]?.layer.removeAnimation(forKey: "float_ScaleX")
		self.viewsByName["Mood Zen__yScale"]?.layer.removeAnimation(forKey: "float_ScaleY")
		self.viewsByName["Mood Zen__root"]?.layer.removeAnimation(forKey: "float_TranslationX")
		self.viewsByName["Mood Zen__root"]?.layer.removeAnimation(forKey: "float_TranslationY")
		self.viewsByName["Open Zen__xScale"]?.layer.removeAnimation(forKey: "float_ScaleX")
		self.viewsByName["Open Zen__yScale"]?.layer.removeAnimation(forKey: "float_ScaleY")
		self.viewsByName["Open Zen__root"]?.layer.removeAnimation(forKey: "float_TranslationX")
		self.viewsByName["Open Zen__root"]?.layer.removeAnimation(forKey: "float_TranslationY")
	}

	// MARK: CAAnimationDelegate
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValue(forKey: anim)
			completion(flag)
		}
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimation(forKey: "Float")
	}

	func actionGuidedZenPressed(guidedZen: UIButton) {
		mainMenuViewDelegate?.guidedZenPressed(guidedZen: guidedZen)
	}

	func actionMoodZenPressed(moodZen: UIButton) {
		mainMenuViewDelegate?.moodZenPressed(moodZen: moodZen)
	}

	func actionOpenZenPressed(openZen: UIButton) {
		mainMenuViewDelegate?.openZenPressed(openZen: openZen)
	}
}