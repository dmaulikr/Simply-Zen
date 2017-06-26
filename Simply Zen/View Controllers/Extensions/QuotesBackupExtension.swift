//
//  QuotesBackupExtension.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 6/26/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

extension SessionCompleteViewController {
    
    func getQuote() -> [String:String] {
        
        let quotes = [
            ["Quote" : "Reduce the stress levels in your life through relaxation techniques like meditation, deep breathing, and exercise. You'll look and feel way better...", "Author":"Suzanne Somers"],
            ["Quote" : "Keep your best wishes, close to your heart and watch what happens", "Author" : "Tony DeLiso"],
            ["Quote" : "Feelings come and go like clouds in a windy sky. Conscious breathing is my anchor.", "Author" : "Thich Nhat Hanh"],
            ["Quote" : "If the ocean can calm itself, so can you.  We are both salt water mixed with air.", "Author" : "Nayyirah Waheed"],
            ["Quote" : "I have lived with several Zen masters—all of them cats.", "Author" : "Eckhart Tolle"],
            ["Quote" : "The mind can go in a thousand directions, but on this beautiful path, I walk in peace. With each step, the wind blows. With each step, a flower blooms", "Author" : "Thich Nhat Hanh"],
            ["Quote" : "We can live without religion and meditation, but we cannot survive without human affection.", "Author" : "Dalai Lama"],
            ["Quote" : "Meditation is the tongue of the soul and the language of our spirit.", "Author" : "Jeremy Taylor"],
            ["Quote" : "Meditation is the soul's perspective glass.", "Author" : "Owen Feltham"],
            ["Quote" : "The best way to meditate is through meditation itself.", "Author" : "Ramana Maharshi"],
            ["Quote" : "We tend to think of meditation in only one way. But life itself is a meditation.", "Author" : "Raul Julia"]
        ]
        
        let quoteLocation: Int = Int(arc4random_uniform(UInt32(quotes.count)))

        return quotes[quoteLocation]
    }
    
    
    
}
