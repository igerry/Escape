//
//  TiledMap.m
//  Escape
//
//  Created by Xin Gao on 19/01/2014.
//  Copyright (c) 2014 dodo. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "TiledMap.h"
#import "TileMapParser.h"

@implementation TiledMap
-(SKSpriteNode*) getRenderNode{
    return NULL;
}
-(SKSpriteNode*) posX : (int)posx
                 posY : (int)posy{
    return NULL;
}


- (TiledMap *) initializeMap: (NSString*)mapname
{
    // Step 1 : Collect tile information from .tmx file and load all the tile files accordingly
    
    TileMapParser *map_parser = [TileMapParser alloc];
    map_parser = [map_parser initTileMapParser : self ];
    NSURL * furl = [[NSBundle mainBundle] URLForResource:mapname withExtension:@"tmx"];
    
    // FIXME: we should handle this error or not ?
    assert (furl);
    map_parser = [map_parser initWithContentsOfURL: furl];
    
    [map_parser setDelegate: map_parser];
    bool rslt = [map_parser parse];
    assert(rslt);
    return self;
}

-(SKSpriteNode*) getCamera{
    return camera;
}
-(void) addTileSet : (NSString *) tilename{
    return;
}

-(void) addTile: (int) tileidx{
    return;
}
-(void) setTileTexture : (NSString *) tileimage{
    tiletexture = [SKTexture textureWithImageNamed: tileimage];
    assert(tiletexture);
}
-(SKSpriteNode*) initializeRenderNode{
    return NULL;
}
-(SKSpriteNode*) invalidateRenderNode{
    return NULL;
}
@end
