//
//  ViewController.swift
//  TConverter
//
//  Created by Мария Матичина on 3/13/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var slider: UISlider! { // хотим менять температуру от 0 до 100, то делаем через код
        didSet {
            
            /*
             didSet блок кода, который выполнятся после того как появился slider, когда загружается проект:
             - загрузился StoryBoard
             - загрузился ViewController
             - также подцепился slider из нашего StoryBoard,  этот момент он стал установлен и в этот момень можем произвести его настройку
             Зачем нужна конструкция «didSet»?
             Выполняется блок кода после объявления переменной
             */
            
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 0
        }
        
        /*
         @available(iOS 5.0, *)
         open var minimumTrackTintColor: UIColor? - цвет слева от бегунка
         
         @available(iOS 5.0, *)
         open var maximumTrackTintColor: UIColor? - цвет справа от бегунка
         
         @available(iOS 5.0, *)
         open var thumbTintColor: UIColor? - изменить полность цвет
         */
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        /*
         если мы говорим, что бегунок сдвинулся, то должны считать его текущее значение
         текущее значение бегунка можем использовать через sender
         сам sender и есть бегунок
         */
        
        let temperatureCelsius = Int(round(sender.value))
        
        /*
         округлим, чтобы не было 35.96969997
         стало 35.0 - round(sender.value)
         избавимся от нуля - Int(round(sender.value))
         */
        
        celsiusLabel.text = "\(temperatureCelsius)ºC"
        
        
        let temperaturefahrenheit = Int(round((sender.value * 9 / 5) + 32))  // отображаем в ºF используя формулу
        fahrenheitLabel.text = "\(temperaturefahrenheit)ºF"
    }
}


