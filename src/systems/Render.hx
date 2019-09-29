package systems;

import echos.*;
import components.*;
import js.html.Element;
import js.Browser;

class Render extends System {


    var w:Float;
    var h:Float;

    var tiles:Array<Array<Element>> = [];


    public function new(w:Int, h:Int, size:Int, canvas:Element) {
        this.w = w;
        this.h = h;
        for (y in 0...h) {
            tiles[y] = [];
            for (x in 0...w) {
                var span = Browser.document.createSpanElement();
                span.style.position = 'absolute';
                span.style.left = '${(x + 1) * size}px';
                span.style.top = '${(y + 1) * size}px';
                tiles[y][x] = span;
                canvas.appendChild(span);
            }
            canvas.appendChild(Browser.document.createBRElement());
        }
    }


    @ad inline function onAddPosSprite(pos:Position, spr:Sprite) {
        tiles[Std.int(pos.y)][Std.int(pos.x)].appendChild(spr); 
    }
    @rm inline function onRemovePosSprite(pos:Position, spr:Sprite) {
        spr.remove();
    }

    @u inline function updateMovedSprite(vel:Velocity, pos:Position, spr:Sprite) {
        tiles[Std.int(pos.y)][Std.int(pos.x)].appendChild(spr);
    }


}
