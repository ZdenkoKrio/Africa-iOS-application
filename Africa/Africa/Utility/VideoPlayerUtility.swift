//
//  VideoPlayerUtility.swift
//  Africa
//
//  Created by Zdenko Čepan on 21/07/2021.
//

import SwiftUI
import AVKit

var videoPlayer: AVPlayer?

func playVideo(videoName: String, videoFormat: String) -> AVPlayer {
    if Bundle.main.url(forResource: videoName, withExtension: videoFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: videoName,
                                                    withExtension: videoFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
