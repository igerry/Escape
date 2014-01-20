//
//  TileMapParser.m
//  Escape
//
//  Created by Xin Gao on 20/01/2014.
//  Copyright (c) 2014 dodo. All rights reserved.
//

#import "TileMapParser.h"

@implementation TileMapParser;

/*! 
   2 small help functions to format attributes of xml elements
 */
 + (int) intAttribute:(NSDictionary*)dict attrName: (NSString*) attr{
 return[(NSString *)[dict objectForKey :attr] intValue];
 }
 + (NSString *) strAttribute:(NSDictionary*)dict attrName: (NSString*) attr{
 return [dict objectForKey :attr];
 }


/*! 
  Nothing interesting here, the parser will update the map data during SAX processing
*/

-(TileMapParser *)initTileMapParser :(TiledMap *) imap{
    self = [super init];
    self->map = imap;
    return self;
}


/*! 
  Implementing startElement,
  
  1. for map element: we update the map basic info
  2. for tileset element : we add new tile into map and its related texture
  3. for tile element : we create KSprite nodes and provid related texture
 
 */
-(void) parser:(NSXMLParser *)parser
        didStartElement:(NSString *)elementName
        namespaceURI:(NSString *)namespaceURI
        qualifiedName:(NSString *)qualifiedName
        attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"map"]) {
        NSLog(@"top map element found – setting basic attributes of map");
        [self->map setVersion : [TileMapParser strAttribute: attributeDict attrName:@"version"]];
        [self->map setHeight : [TileMapParser intAttribute: attributeDict attrName:@"height"]];
        [self->map setWidth : [TileMapParser intAttribute: attributeDict attrName:@"width"]];
        [self->map setTilewidth : [TileMapParser intAttribute: attributeDict attrName:@"tilewidth"]];
        [self->map setTileheight : [TileMapParser intAttribute: attributeDict attrName:@"tileheight"]];
    }else if ([elementName isEqualToString:@"tileset"]) {
        NSLog(@"top tileset element found – setting basic attributes of map");
        [map addTileSet: [TileMapParser strAttribute : attributeDict attrName:@"name"]];
    }else if ([elementName isEqualToString:@"tile"]) {
        NSLog(@"tile element found – setting basic attributes of map");
        [map addTile: [TileMapParser intAttribute : attributeDict attrName:@"gid"]];
    }

}

/*! 
   It is not used since luckly we do not care characters in our tmx file currently 
 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"foundCharacters: %@", string);
}

/*! 
   It should be used to do some clearn up work. 
   However I do not bother think about it at the moment.
 
 */
- (void)parser:(NSXMLParser *)parser
        didEndElement:(NSString *)elementName
        namespaceURI:(NSString *)namespaceURI
        qualifiedName:(NSString *)qName
{
    NSLog(@"didEndElement: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"Error %ld, Description: %@, Line: %ld, Column: %ld",
          [parseError code], [[parser parserError] localizedDescription],
          [parser lineNumber], [parser columnNumber]);
}


@end

