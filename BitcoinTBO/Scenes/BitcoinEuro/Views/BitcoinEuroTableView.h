//
//  BitcoinEuroTableView.h
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 18.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BitcoinEuroDataSource;

NS_ASSUME_NONNULL_BEGIN

@interface BitcoinEuroTableView : UITableView

- (void)setupTableView:(nullable id <UITableViewDataSource>)bitcoinEuroDataSource;

@end

NS_ASSUME_NONNULL_END
