//
//  BitcoinEuroTableView.m
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 18.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

#import "BitcoinEuroTableView.h"

@implementation BitcoinEuroTableView

- (void)setupTableView:(nullable id <UITableViewDataSource>)bitcoinEuroDataSource {
    self.dataSource = bitcoinEuroDataSource;
	
	[self registerNib:[UINib nibWithNibName: @"BitcoinInformationCell" bundle: nil] forCellReuseIdentifier: @"BitcoinInformationCell"];
}

@end
