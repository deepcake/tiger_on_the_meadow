package systems;

import echos.*;
import components.*;
import js.html.Element;
import js.Browser;

class Render extends System {

    var w:Float;
    var h:Float;
    var world:Array<Array<Element>> = [];

    public function new(w:Int, h:Int, size:Int, canvas:Element) {
        this.w = w;
        this.h = h;
        for (y in 0...h) {
            world[y] = [];
            for (x in 0...w) {
                var span = Browser.document.createSpanElement();
                span.style.position = 'absolute';
                span.style.left = '${x * size}px';
                span.style.top = '${y * size}px';
                world[y][x] = span;
                canvas.appendChild(span);
            }
            canvas.appendChild(Browser.document.createBRElement());
        }
    }

    @ad inline function appendSprite(pos:Position, spr:Sprite) {
        world[Std.int(pos.y)][Std.int(pos.x)].appendChild(spr); 
    }
    @rm inline function detachSprite(pos:Position, spr:Sprite) {
        spr.remove();
    }

    @u inline function updateDynamicSprite(vel:Velocity, pos:Position, spr:Sprite) {
        world[Std.int(pos.y)][Std.int(pos.x)].appendChild(spr);
    }

}
