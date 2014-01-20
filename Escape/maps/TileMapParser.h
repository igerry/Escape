//
//  TileMapParser.h
//  Escape
//
//  Created by Xin Gao on 20/01/2014.
//  Copyright (c) 2014 dodo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TiledMap.h"

@interface TileMapParser : NSXMLParser{
    TiledMap * map;
}
+ (int) intAttribute:(NSDictionary*)dict attrName: (NSString*) attr;

-(TileMapParser *) initTileMapParser : (TiledMap *) map;
@end
