//
//  DMath.m
//  iNetHack
//
//  Created by dirk on 8/10/09.
//  Copyright 2009 Dirk Zimmermann. All rights reserved.
//

//  This file is part of iNetHack.
//
//  iNetHack is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, version 2 of the License only.
//
//  iNetHack is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with iNetHack.  If not, see <http://www.gnu.org/licenses/>.

#import "DMath.h"

@implementation DMath

#define DMath_VDIST(v1,v2) (sqrt((v2.x-v1.x)*(v2.x-v1.x)+(v2.y-v1.y)*(v2.y-v1.y)))

+ (CGPoint) normalizedPoint:(CGPoint)ps {
	CGPoint p = ps;
	float length = sqrt(p.x*p.x + p.y*p.y);
	p.x /= length;
	p.y /= length;
	return p;
}

- (id) init {
	if (self = [super init]) {
		directions[kUp] = CGPointMake(0,1);
		directions[kUpRight] = [DMath normalizedPoint:CGPointMake(1,1)];
		directions[kRight] = CGPointMake(1,0);
		directions[kDownRight] = [DMath normalizedPoint:CGPointMake(1,-1)];
		directions[kDown] = CGPointMake(0,-1);
		directions[kDownLeft] = [DMath normalizedPoint:CGPointMake(-1,-1)];
		directions[kLeft] = CGPointMake(-1,0);
		directions[kUpLeft] = [DMath normalizedPoint:CGPointMake(-1,1)];
		stdDistance = DMath_VDIST(directions[kUp],directions[kUpRight])/2;
	}
	return self;
}

- (dmathdirection) directionFromVector:(CGPoint)p {
	for (int i = kUp; i <= kUpLeft; ++i) {
		float d = DMath_VDIST(directions[i],p);
		if (fabs(d) <= stdDistance) {
			return i;
		}
	}
	return -1;
}

@end
