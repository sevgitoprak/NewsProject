//
//  NewsViewModal.swift
//  NewsProject
//
//  Created by Macbook on 19.02.2022.
//

import Foundation

struct NewsTableViewModal {
    let newsList : [News]
    
    func numberOfRowsInSection() -> Int {
        return self.newsList.count
    }
    func newsAtIndexPath (_ index : Int) -> NewsViewModal {
        let news = self.newsList[index]
        return NewsViewModal(news: news)
    }
}

struct NewsViewModal {
    let news : News
    
    var title :String {
        return self.news.title
    }
    var story :String {
        return self.news.story
    }
}
