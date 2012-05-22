//
//  HomeTableCell.h
//  Cinegram-iOS
//
//  Created by David Ford on 20/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *shareView;
@property (strong, nonatomic) IBOutlet UIView *videoThumb;
@property (strong, nonatomic) IBOutlet UIButton *twitterShareButton;
@property (strong, nonatomic) IBOutlet UIButton *starButton;
@property (strong, nonatomic) IBOutlet UIButton *emailButton;
@property (strong, nonatomic) IBOutlet UIButton *playVideo;
@property (strong, nonatomic) IBOutlet UILabel *videoTitle;
@property (strong, nonatomic) IBOutlet UIImageView *videoWatchCount;
@property (strong, nonatomic) IBOutlet UILabel *videoCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *favCountLabel;
@property (strong, nonatomic) IBOutlet UIButton *viewProfile;
@property (strong, nonatomic) IBOutlet UIButton *fanVideo;
@property (strong, nonatomic) IBOutlet UIButton *commentVideo;

@end
