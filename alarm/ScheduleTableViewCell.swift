//
//  ScheduleTableViewCell.swift
//  alarm
//
//  Created by Michael Lewis on 3/10/15.
//  Copyright (c) 2015 Kevin Farst. All rights reserved.
//

import UIKit

protocol DayOfWeekAlarmDelegate {
  func updateTimeSelected(cell: ScheduleTableViewCell)
  func updateAlarmEnabled(cell: ScheduleTableViewCell, enabled: Bool)
}

class ScheduleTableViewCell: UITableViewCell {

  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var timeButton: UIButton!
  @IBOutlet weak var activeSwitch: UISwitch!

  var alarmEntity: AlarmEntity! {
    didSet {
      updateDisplay()
    }
  }
  
  var delegate: DayOfWeekAlarmDelegate!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    self.backgroundColor = UIColor.darkGrayColor()
    self.dayLabel.textColor = UIColor.whiteColor()
    self.timeButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }

  @IBAction func switchChanged(sender: UISwitch) {
    NSLog("Switch toggled: \(sender.on)")
    delegate.updateAlarmEnabled(self, enabled: sender.on)
  }
  
  @IBAction func timeChangeSelected(sender: UIButton) {
    delegate.updateTimeSelected(self)
  }

  // Given details of our alarm entity, update the display
  func updateDisplay() {
    dayLabel.text = alarmEntity.dayOfWeekForDisplay()
    timeButton.setTitle(alarmEntity.stringForTableDisplay(), forState: UIControlState.Normal)
    activeSwitch.on = alarmEntity.enabled
  }
}
