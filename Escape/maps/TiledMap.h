//
//  TiledMap.h
//  Escape
//
//  Created by Xin Gao on 19/01/2014.
//  Copyright (c) 2014 dodo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

/*! TiledMap is just a simple implementation of rpg map that uses tiles as its basic terrain elements.
    Some of the interface functions does not require the map to be tiled map, but currently we might not care.
 */
@interface TiledMap : NSObject {
    
    NSArray *layers; /*! FIXME: how to index overlap is not decided */
    
    SKTexture *tiletexture; /*! the texture used by tiles as follows */
    
    NSArray *tiles; /*! this is the array that should contain width * height SKSpriteNode(s) */
    
    SKSpriteNode *camera; /*! This is actually the camera node,
                                 We will try to make sure there is only 1 map node under this node.
                                 So far, the easiest way to move camera is by adjusting the pox_x and pos_y of the map node.
                             */
}
@property NSString *version; /*! we did not use this , but we set this for testing purpose to make sure our NSXMLParser works fine */
@property NSString *orientation; /*! always orthonogoal, and only for test purpose as well */

@property int width; /*! width = n means we have n tiles wide */
@property int height; /*! height = n means we have n tiles height */
@property int tilewidth; /*! width of the tile by pixels */
@property int tileheight; /*! height of the tile by pixels */


/*! 
 
 To initialize Map, there are actually 7 steps in general
 
 1. Collect tile infomation from .tmx file and load all the tile files accordingly
 
 2. generate logical nodes for each tile.
 
 3. generate io nodes from logical nodes. So far in this application it is an 2 dimensional array with SpriteNodes
 
 4. computing static attributes based on the logical nodes. (Connection graph and Shortest path between 2 tiles and more if necessary)
 
 5. create the camera if the map size is larger than the given SpriteNode size and initialize that camera.
 
 6. place actors 
 
 7. setup event handlers. all events in format <type,source,info>
 
*/

-(TiledMap *) initializeMap : (NSString *)tmxfile;

/* Following are straight forward small functions */

-(SKSpriteNode*) getCamera;
-(SKSpriteNode*) posX : (int)posx
                 posY : (int)posy;

-(SKSpriteNode*) initializeRenderNode;
-(SKSpriteNode*) invalidateRenderNode;

-(void) addTile : (int) tileindex;

-(void) addTileSet : (NSString *) tilename;

-(void) setTileTexture : (NSString *) tileimage;

@end
