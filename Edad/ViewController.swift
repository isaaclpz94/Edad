//
//  ViewController.swift
//  Edad
//
//  Created by Isaac Mac on 28/9/16.
//  Copyright (c) 2016 Isaac Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var TFFecha: UITextField!
    @IBOutlet var LBEdad: UILabel!
    @IBAction func BTNCalcular(sender: UIButton) {
        var fecha: String = TFFecha.text
        
        if !fecha.isEmpty{
            if isValidEmail(fecha){
                //Declaramos el formato de la fecha
                let dateStringFormatter = NSDateFormatter()
                dateStringFormatter.dateFormat = "dd-MM-yyyy"
                
                //La pasamos a NSDate
                let d1 = dateStringFormatter.dateFromString(fecha)!
                //Fecha actual
                let d2 = NSDate()
                
                var calendar: NSCalendar = NSCalendar.currentCalendar()
                
                // Replace the hour (time) of both dates with 00:00
                let date1 = calendar.startOfDayForDate(d1)
                let date2 = calendar.startOfDayForDate(d2)
                
                let flags = NSCalendarUnit.CalendarUnitYear
                let components = calendar.components(flags, fromDate: d1, toDate: d2, options: NSCalendarOptions())
                
                LBEdad.text = String(components.year)
            }else{
                LBEdad.text = "La fecha no es válida"
            }
        }else{
            LBEdad.text = "Inserte una fecha"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func isValidEmail(testStr:String) -> Bool {

        let emailRegEx = "\\d{2}\\/\\d{2}\\/\\d{4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
}

