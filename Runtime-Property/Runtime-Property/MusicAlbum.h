//
//  MusicAlbum.h
//  LocationDemo
//
//  Created by 黎明 on 2017/9/20.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicAlbum : NSObject
{
    @private
    int _age;
    double _height;
    
    @public
    NSString *_nextMusicName;
}

@property (nonatomic, strong) NSString *albumName;

@property (nonatomic, strong) NSString *author;

@property (nonatomic, strong) NSArray *musicList;

@property (nonatomic, assign) int64_t publishTime;

@end
